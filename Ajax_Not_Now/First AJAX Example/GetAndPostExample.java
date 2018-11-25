package ajaxsample;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.ArrayList;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.util.LabelValueBean;

public class GetAndPostExample extends Action {
    
    ServletContext context = null;
    
    public void setServlet(ActionServlet servlet)
    {
        context =  servlet.getServletContext();
    }
   public ActionForward execute(ActionMapping mapping, ActionForm inForm, 
           HttpServletRequest request, HttpServletResponse response) throws Exception {
           response.setContentType("text/xml");

          String optionSelected = request.getParameter("selcountry");        
         //Build the response text
         
         SampleForm sform = (SampleForm)inForm;
         ArrayList countries = (ArrayList)context.getAttribute("countries");
         ArrayList states = (ArrayList)context.getAttribute("states");
         ArrayList newStates = new ArrayList();
         String responseText = "";
         //sending response text in the format label:value||label;value
         for(int i=0;i<states.size();i++)
         {
            LabelValueBean temp = (LabelValueBean)states.get(i);
            if(temp.getValue().startsWith(optionSelected))
            {
                    newStates.add(temp); 
                    responseText = temp.getLabel()+";"+temp.getValue()+"||"+responseText; 
            }
         }
         if(responseText.endsWith("||"))   //chop off the ending ||
         {
             responseText = responseText.substring(0, responseText.lastIndexOf("||"));
         }
         PrintWriter out = response.getWriter();
         out.println(responseText);
        //Close the writer
        out.close();
        return(mapping.findForward("content1"));
   }
  }
