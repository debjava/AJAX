package com.actions;
import javax.servlet.http.*;
import org.apache.struts.action.*; 
import java.io.PrintWriter; 
public class PostMessage extends Action
{  
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
		throws Exception
		{
				if(!chk.IsUesrOnline(request)) 
				{
					return mapping.findForward("expired"); 
				}
				PrintWriter out = response.getWriter(); 
				content=(String)request.getParameter("messsage"); 
				if(content.length()>500  subject.length()>50)  out.println("Subject  Content Length is too Long"); 
				if(subject.length()<5  content.length()<10)  out.println("Subject  Content Length is too Short"); 
				else  out.println(objDAO.addMessage(user_name,subject,content)); 
				out.flush(); 
				return(null); 
		}
}