/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */
package org.dspace.submit.step;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.dspace.app.util.SubmissionInfo;
import org.dspace.app.util.Util;
import org.dspace.authorize.AuthorizeException;
import org.dspace.content.Collection;
import org.dspace.content.Item;
import org.dspace.core.Context;
import org.dspace.services.ConfigurationService;
import org.dspace.services.factory.DSpaceServicesFactory;
import org.dspace.submit.AbstractProcessingStep;

/**
 * CCLicense step for DSpace Submission Process.
 *
 * Processes the
 * user response to the license.
 * <P>
 * This class performs all the behind-the-scenes processing that
 * this particular step requires.  This class's methods are utilized
 * by both the JSP-UI and the Manakin XML-UI
 * <P>
 *
 * @see org.dspace.app.util.SubmissionConfig
 * @see org.dspace.app.util.SubmissionStepConfig
 * @see org.dspace.submit.AbstractProcessingStep
 *
 * @author Tim Donohue
 * @author Wendy Bossons (based on earlier CC license step work, but updated
 * for DSpace 1.8 and CC web services api + curation)
 * @version $Revision: 6785 $
 */
public class RIDCCLicenseStep extends AbstractProcessingStep
{
    /***************************************************************************
     * STATUS / ERROR FLAGS (returned by doProcessing() if an error occurs or
     * additional user interaction may be required)
     *
     * (Do NOT use status of 0, since it corresponds to STATUS_COMPLETE flag
     * defined in the JSPStepManager class)
     **************************************************************************/
    // user rejected the license
    public static final int STATUS_LICENSE_REJECTED = 1;

    /** log4j logger */
    private static Logger log = Logger.getLogger(CCLicenseStep.class);

    protected ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();

    /**
     * Do any processing of the information input by the user, and/or perform
     * step processing (if no user interaction required)
     * <P>
     * It is this method's job to save any data to the underlying database, as
     * necessary, and return error messages (if any) which can then be processed
     * by the appropriate user interface (JSP-UI or XML-UI)
     * <P>
     * NOTE: If this step is a non-interactive step (i.e. requires no UI), then
     * it should perform *all* of its processing in this method!
     *
     * @param context
     *            current DSpace context
     * @param request
     *            current servlet request object
     * @param response
     *            current servlet response object
     * @param subInfo
     *            submission info object
     * @return Status or error flag which will be processed by
     *         doPostProcessing() below! (if STATUS_COMPLETE or 0 is returned,
     *         no errors occurred!)
     */
    public int doProcessing(Context context, HttpServletRequest request,
                            HttpServletResponse response, SubmissionInfo subInfo)
            throws ServletException, IOException, SQLException,
            AuthorizeException,java.io.IOException
    {
        HttpSession session = request.getSession();
        session.setAttribute("inProgress", "TRUE");
        String buttonPressed = Util.getSubmitButton(request, NEXT_BUTTON);

        if (buttonPressed.equals("submit_grant")) {
            return processRIDCC(context, request, response, subInfo);
        }

        if (buttonPressed.startsWith(PROGRESS_BAR_PREFIX) || buttonPressed.equals(PREVIOUS_BUTTON)) {
            removeRequiredAttributes(session);
        }

        if (buttonPressed.equals(NEXT_BUTTON) || buttonPressed.equals(CANCEL_BUTTON)  || buttonPressed.equals(PREVIOUS_BUTTON)) {
            return processRIDCC(context, request, response, subInfo);
        } else {
            removeRequiredAttributes(session);
            session.removeAttribute("inProgress");
            return STATUS_COMPLETE;
        }
    }


    /**
     * Process the input from the CC license page using CC Web service
     *
     * @param context
     *            current DSpace context
     * @param request
     *            current servlet request object
     * @param response
     *            current servlet response object
     * @param subInfo
     *            submission info object
     *
     *
     * @return Status or error flag which will be processed by
     *         doPostProcessing() below! (if STATUS_COMPLETE or 0 is returned,
     *         no errors occurred!)
     */
    protected int processRIDCC(Context context, HttpServletRequest request,
                                  HttpServletResponse response, SubmissionInfo subInfo)
            throws ServletException, IOException, SQLException,
            AuthorizeException {

        // Desarmo los metadatos en schema, element y qualifier
        String[] uriField=(configurationService.getProperty("cc.license.uri")).split("\\.");
        String uriFieldSchema=(uriField.length>0)?uriField[0]:null;
        String uriFieldElement=(uriField.length>1)?uriField[1]:null;
        String uriFieldQualifier=(uriField.length>2)?uriField[2]:null;

        String[] uriName=(configurationService.getProperty("cc.license.name")).split("\\.");
        String uriNameSchema=(uriName.length>0)?uriName[0]:null;
        String uriNameElement=(uriName.length>1)?uriName[1]:null;
        String uriNameQualifier=(uriName.length>2)?uriName[2]:null;

        String jurisdictionId = (configurationService.getProperty("cc.license.jurisdiction") != null) ? configurationService.getProperty("cc.license.jurisdiction") : "";
        String jurisdictionDescription = (configurationService.getProperty("cc.license.jurisdiction.description") != null) ? configurationService.getProperty("cc.license.jurisdiction.description") : "";

        // Obtengo el item
        Item item = subInfo.getSubmissionItem().getItem();
        // Obtengo la colección del ítem
        Collection coleccion = subInfo.getSubmissionItem().getCollection();
        // Obtengo la sesión actual
        HttpSession session = request.getSession();

        // Cargo los nuevos valores para el metadata
        String ccVersion = "4.0";
        String licenseUri = "http://creativecommons.org/licenses/by";
        String licenseDescription = "Creative Commons Attribution";
        String postfixLicenseDescription = "(cc by";

        // Si no es administrador trato los campos por separado
        String commercialOption = request.getParameter("ridCommercial");
        String adaptationOption = request.getParameter("ridAdaptation");

        if (commercialOption != null && adaptationOption != null) {
            // Limpio los metadatos
            itemService.clearMetadata(context, item, uriNameSchema, uriNameElement, uriNameQualifier, null);
            itemService.clearMetadata(context, item, uriFieldSchema, uriFieldElement, uriFieldQualifier, null);

            // Armo la descripcion y la URL de la licencia
            if (!commercialOption.equals("yes")){
                licenseUri += "-" + commercialOption;
                postfixLicenseDescription += "-" + commercialOption;
                licenseDescription += "-NonCommercial";
            }
            if (!adaptationOption.equals("yes")){
                licenseUri += "-" + adaptationOption;
                postfixLicenseDescription += "-" + adaptationOption;
                if (adaptationOption == "nd"){
                    licenseDescription += "-NoDerivatives";
                } else {
                    licenseDescription += "-ShareAlike";
                }
            };
            licenseUri += "/" + ccVersion + "/";
            postfixLicenseDescription += " " + ccVersion + ")";
            licenseDescription += " " + ccVersion + " International";

            // Pregunto si hay juridisccion
            if (!jurisdictionId.equals("")){
                licenseUri += jurisdictionId + "/";
                licenseDescription += " " + jurisdictionDescription;
            };
            licenseDescription += " " + postfixLicenseDescription.toUpperCase();

            // Agrego los metadatos al item
            itemService.addMetadata(context, item, uriFieldSchema, uriFieldElement, uriFieldQualifier, null, licenseUri);
            itemService.addMetadata(context, item, uriNameSchema, uriNameElement, uriNameQualifier, null, licenseDescription);

            // Actualizo el item
            itemService.update(context, item);
            // Realizo commit previo
            context.dispatchEvents();
            removeRequiredAttributes(session);
            session.removeAttribute("inProgress");

            return STATUS_COMPLETE;
        } else {
            session.setAttribute("problem", Boolean.TRUE);
            return STATUS_LICENSE_REJECTED;
        }
    }

    private void removeRequiredAttributes(HttpSession session) {
        session.removeAttribute("problem");
    }

    /**
     * Retrieves the number of pages that this "step" extends over. This method
     * is used to build the progress bar.
     * <P>
     * This method may just return 1 for most steps (since most steps consist of
     * a single page). But, it should return a number greater than 1 for any
     * "step" which spans across a number of HTML pages. For example, the
     * configurable "Describe" step (configured using input-forms.xml) overrides
     * this method to return the number of pages that are defined by its
     * configuration file.
     * <P>
     * Steps which are non-interactive (i.e. they do not display an interface to
     * the user) should return a value of 1, so that they are only processed
     * once!
     *
     * @param request
     *            The HTTP Request
     * @param subInfo
     *            The current submission information object
     *
     * @return the number of pages in this step
     */
    public int getNumberOfPages(HttpServletRequest request, SubmissionInfo subInfo) throws ServletException {
        return 1;
    }
}
