package net.kencochrane.action;

import net.kencochrane.form.UploadForm;
import net.kencochrane.util.UploadUtil;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
*  Created for Part 2, by Ken Cochrane
*  http://KenCochrane.net , http://CampRate.com , http://PopcornMonsters.com
*/

/**
 * User: Ken Cochrane
 * Date: Mar 18, 2006
 * Time: 3:25:44 PM
 */
public class HomeAction extends MappingDispatchAction {

    Logger log = Logger.getLogger(this.getClass());

    public ActionForward index(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response) {
        log.debug("Inside home:index");
        ActionForward actionForward = null;
        //do more stuff here if you need it.
        actionForward = mapping.findForward("valid");
        log.debug("Leaving home:index");
        return actionForward;
    }

    public ActionForward doUpload(ActionMapping mapping,
                                  ActionForm form,
                                  HttpServletRequest request,
                                  HttpServletResponse response) {
        log.debug("Inside home:doUpload");
        ActionForward actionForward = null;
        try {
            UploadForm uploadForm = (UploadForm) form;
            log.debug("uploadForm = " + uploadForm);
            StringBuffer ufMessage = new StringBuffer();
            String uploadDir = "S:/temp/upload/";
            log.debug("uploadDir = " + uploadDir);

            if (uploadForm != null) {
                if (uploadForm.getFile1().getFileName().length() > 0) {
                    UploadUtil.writeToDisk(uploadForm.getFile1(), uploadForm.getFile1().getFileName(), uploadDir);
                    ufMessage.append("Uploaded File:<strong> " + uploadForm.getFile1().getFileName() + "</strong> is done.. <br />");
                }
                if (uploadForm.getFile2().getFileName().length() > 0) {
                    UploadUtil.writeToDisk(uploadForm.getFile2(), uploadForm.getFile2().getFileName(), uploadDir);
                    ufMessage.append("Uploaded File:<strong> " + uploadForm.getFile2().getFileName() + "</strong> is done.. <br />");
                }
                if (uploadForm.getFile3().getFileName().length() > 0) {
                    UploadUtil.writeToDisk(uploadForm.getFile3(), uploadForm.getFile3().getFileName(), uploadDir);
                    ufMessage.append("Uploaded File:<strong> " + uploadForm.getFile3().getFileName() + "</strong> is done.. <br />");
                }
                if (uploadForm.getFile4().getFileName().length() > 0) {
                    UploadUtil.writeToDisk(uploadForm.getFile4(), uploadForm.getFile4().getFileName(), uploadDir);
                    ufMessage.append("Uploaded File:<strong> " + uploadForm.getFile4().getFileName() + "</strong> is done.. <br />");
                }
                request.setAttribute("uploadLog", ufMessage.toString());
                log.debug("uploadLog = " + ufMessage.toString());
            }

        } catch (Exception e) {
            log.error("error = " + e);
        }


        actionForward = mapping.findForward("valid");
        log.debug("Leaving home:doUpload");
        return actionForward;
    }

    public ActionForward showUploadForm(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) {
        log.debug("Inside home:showUploadForm");
        ActionForward actionForward = null;
        //do more here if you need to.
        actionForward = mapping.findForward("valid");
        log.debug("Leaving home:showUploadForm");
        return actionForward;
    }
}
