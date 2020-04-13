package org.dspace.recaptcha;

import com.google.gson.Gson;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.log4j.Logger;
import org.dspace.authorize.AuthorizeException;
import org.dspace.core.ConfigurationManager;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URISyntaxException;

public class RecaptchaQuery {
    private static final Logger log = Logger.getLogger(RecaptchaQuery.class);
    private static String secret = ConfigurationManager.getProperty("recaptcha.secretkey");
    private static String siteverify = ConfigurationManager.getProperty("recaptcha.siteverify");
    private static boolean recaptchaEnabled = ConfigurationManager.getBooleanProperty("recaptcha.enabled");

    public RecaptchaResponse query(String token) throws URISyntaxException, IOException {

        URIBuilder uriBuilder = new URIBuilder(siteverify);

        uriBuilder.addParameter("secret", secret);
        uriBuilder.addParameter("response", token);

        HttpPost post = new HttpPost(uriBuilder.build());

        CloseableHttpClient client = HttpClients.createDefault();

        CloseableHttpResponse response = client.execute(post);

        HttpEntity responseEntity = response.getEntity();
        InputStream is = responseEntity.getContent();

        Reader reader = new InputStreamReader(is, "UTF-8");
        Gson gson = new Gson();
        RecaptchaResponse captchaResponse = gson.fromJson(reader, RecaptchaResponse.class);

        return captchaResponse;
    }

    public static boolean verify(String gRecaptchaResponse) {
        // Start Recaptcha form
        boolean verifyRecaptcha = false;

        if (recaptchaEnabled) {
            if(secret == null || secret.equals("")) {
                return true;
            }

            if (gRecaptchaResponse == null || gRecaptchaResponse.equals("")) {
                return false;
            }

            RecaptchaQuery query = new RecaptchaQuery();
            try {
                RecaptchaResponse captchaResponse = query.query(gRecaptchaResponse);
                log.info("Request item captcha response: "
                        + captchaResponse.getSuccess()
                        + ", "
                        + captchaResponse.getChallenge_ts()
                        + ", "
                        + captchaResponse.getHostname()
                        + ", "
                        + captchaResponse.getErrorCodes()
                );
                if ("false".equals(captchaResponse.getSuccess())) {
                    log.error("Recaptcha returned a negative response");
                    throw new AuthorizeException("You have not been authorised to request an items files");
                }
                verifyRecaptcha = Boolean.parseBoolean(captchaResponse.getSuccess());
            }
            catch (IOException | URISyntaxException | AuthorizeException e) {
                log.error("Exception processing re-captcha response");
                verifyRecaptcha = false;
            }
        } else {
            verifyRecaptcha = true;
        }
        // End Recaptcha form
        return verifyRecaptcha;
    }
}