package org.dspace.app.webui.submit.step;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.dspace.app.util.SubmissionInfo;
import org.dspace.app.webui.submit.JSPStep;
import org.dspace.app.webui.submit.JSPStepManager;
import org.dspace.app.webui.util.UIUtil;
import org.dspace.authorize.AuthorizeException;
import org.dspace.content.Item;
import org.dspace.content.MetadataValue;
import org.dspace.content.factory.ContentServiceFactory;
import org.dspace.content.service.ItemService;
import org.dspace.core.ConfigurationManager;
import org.dspace.core.Context;
import org.dspace.core.LogManager;
import org.dspace.submit.step.RIDCCLicenseStep;

public class JSPRIDCCLicenseStep extends JSPStep {
    /** JSP which displays the step to the user * */
    private static final String DISPLAY_JSP = "/submit/rid-license-step.jsp";

    /** JSP which displays information to be reviewed during 'verify step' * */
    private static final String REVIEW_JSP = "/submit/review-rid-license-step.jsp";

    /** log4j logger */
    private static Logger log = Logger.getLogger(JSPCCLicenseStep.class);

    private ItemService itemService = ContentServiceFactory.getInstance().getItemService();

    /**
     * Do any pre-processing to determine which JSP (if any) is used to generate
     * the UI for this step. This method should include the gathering and
     * validating of all data required by the JSP. In addition, if the JSP
     * requires any variable to passed to it on the Request, this method should
     * set those variables.
     * <P>
     * If this step requires user interaction, then this method must call the
     * JSP to display, using the "showJSP()" method of the JSPStepManager class.
     * <P>
     * If this step doesn't require user interaction OR you are solely using
     * Manakin for your user interface, then this method may be left EMPTY,
     * since all step processing should occur in the doProcessing() method.
     *
     * @param context
     *            current DSpace context
     * @param request
     *            current servlet request object
     * @param response
     *            current servlet response object
     * @param subInfo
     *            submission info object
     */
    public void doPreProcessing(Context context, HttpServletRequest request,
                                HttpServletResponse response, SubmissionInfo subInfo)
            throws ServletException, IOException, SQLException,
            AuthorizeException
    {
        // Do we already have a CC license?
        Item item = subInfo.getSubmissionItem().getItem();
        String ccUri = ConfigurationManager.getProperty("cc.license.uri");
        List<MetadataValue> currentLicense = itemService.getMetadataByMetadataString(item, ccUri);

        String licenseUri;
        String commercialOption = "yes";
        String adaptationOption = "yes";

        // Pregunto si la licencia actual es distinto de null
        if (currentLicense != null && currentLicense.size() > 0 && currentLicense.get(0) != null && currentLicense.get(0).getValue() != null) {
            // Por ejemplo, si me trae la url "http://creativecommons.org/licenses/by-nc-sa/4.0/"
            licenseUri = currentLicense.get(0).getValue();
            // Obtengo solo valor "by-nc-sa/4.0/"
            String licenseName = licenseUri.substring(licenseUri.indexOf("/by") + 1);
            // Y luego el valor "by-nc-sa"
            licenseName = licenseName.substring(0, licenseName.indexOf("/"));
            // Divido el string para obtener las variables
            String[] s = licenseName.split("-");
            // Como se que la cantidad no supera los 3 elementos, guardo lo siguiente
            commercialOption = s.length > 1 ? s[1] : "yes";
            adaptationOption = s.length > 2 ? s[2] : "yes";
            // Pregunto si el primer parametro corresponde a lo comercial
            if(!commercialOption.equals("nc")) {
                adaptationOption = commercialOption;
                commercialOption = "yes";
            }
        }
        // Envio los datos extraidos a la vista JSP sin el "by"
        request.setAttribute("ridCommercial", commercialOption);
        request.setAttribute("ridAdaptation", adaptationOption);

        // Tell JSPStepManager class to load "sample-step.jsp"
        JSPStepManager.showJSP(request, response, subInfo, DISPLAY_JSP);
    }

    /**
     * Do any post-processing after the step's backend processing occurred (in
     * the doProcessing() method).
     * <P>
     * It is this method's job to determine whether processing completed
     * successfully, or display another JSP informing the users of any potential
     * problems/errors.
     * <P>
     * If this step doesn't require user interaction OR you are solely using
     * Manakin for your user interface, then this method may be left EMPTY,
     * since all step processing should occur in the doProcessing() method.
     *
     * @param context
     *            current DSpace context
     * @param request
     *            current servlet request object
     * @param response
     *            current servlet response object
     * @param subInfo
     *            submission info object
     * @param status
     *            any status/errors reported by doProcessing() method
     */
    public void doPostProcessing(Context context, HttpServletRequest request,
                                 HttpServletResponse response, SubmissionInfo subInfo, int status)
            throws ServletException, IOException, SQLException,
            AuthorizeException
    {
        String buttonPressed = UIUtil.getSubmitButton(request, RIDCCLicenseStep.NEXT_BUTTON);

        // Here's some sample error message processing!
        if (status == RIDCCLicenseStep.STATUS_LICENSE_REJECTED || buttonPressed.equals("submit_reject"))
        {
            // special processing for this error message
            log.info(LogManager.getHeader(context, "reject_license", subInfo.getSubmissionLogInfo()));
        }

        log.info(LogManager.getHeader(context, "accepted_license", subInfo.getSubmissionLogInfo()));
    }

    /**
     * Return the URL path (e.g. /submit/review-metadata.jsp) of the JSP
     * which will review the information that was gathered in this Step.
     * <P>
     * This Review JSP is loaded by the 'Verify' Step, in order to dynamically
     * generate a submission verification page consisting of the information
     * gathered in all the enabled submission steps.
     *
     * @param context
     *            current DSpace context
     * @param request
     *            current servlet request object
     * @param response
     *            current servlet response object
     * @param subInfo
     *            submission info object
     */
    public String getReviewJSP(Context context, HttpServletRequest request,
                               HttpServletResponse response, SubmissionInfo subInfo)
    {
        return REVIEW_JSP;
    }
}
