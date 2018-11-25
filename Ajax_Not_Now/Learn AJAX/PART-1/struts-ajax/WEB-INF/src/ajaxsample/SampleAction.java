package ajaxsample;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * @author Paul Browne , release under GPL
 * */
public class SampleAction extends Action {

	/** Logger for this class and subclasses */
    protected final Logger log = Logger.getLogger(getClass());
	
	
  public ActionForward execute(ActionMapping mapping, ActionForm inForm, HttpServletRequest request, HttpServletResponse response) throws Exception {

  	log.debug("SampleAction.execute()");
  	
  	//Local Variables
  	
  	//Log the incoming values
  	Enumeration myLoop= request.getParameterNames();
    String tmpObject;
    
    log.debug("======");
    while (myLoop.hasMoreElements()){
    	tmpObject = ""+myLoop.nextElement();
    	log.debug("Incoming key:"+tmpObject+" value:"+request.getParameter(tmpObject));
    }
    
    log.debug(inForm);
    
    
    log.debug("======");
    
	
  	
  	//otherwise , return null
  	log.info("returning to the welcome page");
  	return mapping.findForward("welcome");
  	
  	
  } // End execute()


} // End class
