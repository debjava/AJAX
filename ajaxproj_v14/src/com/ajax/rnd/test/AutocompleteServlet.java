/**
 * 	This is a very simple servlet for interaction
 *	with Ajax. This application is an 
 *	outcome of the RnD division run Debadatta Mishra.
 *	Very shortly you will find several java and other
 *	related articles in the internet.
 *
 *	It is a learning application, please do not integrate
 *	in your application. It has been made open source.
 *	It is not for any commercial purpose.
 *	Please enjoy it at your own convenience.
 *
 */
package com.ajax.rnd.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

/**
 * @author PIKU
 *
 */
public class AutocompleteServlet extends HttpServlet {
    
    /**
	 * Generated serial version id.
	 */
	private static final long serialVersionUID = -5484644212053169000L;
	private ServletContext context;
    private HashMap employees = new HashMap();
 
    public void init(ServletConfig config) throws ServletException 
    {
        this.context = config.getServletContext();
        
        employees.put("1", new EmployeeBean("1","Piku","Mishra"));
        employees.put("2", new EmployeeBean("2","Lilu","Mishra"));
        employees.put("3", new EmployeeBean("3","Arzoo","Mishra"));
        employees.put("4", new EmployeeBean("4","Sima","Mohanty"));
        employees.put("5", new EmployeeBean("5","Seema","Mishra"));
        employees.put("6", new EmployeeBean("6","Amit","Ingle"));
        employees.put("7", new EmployeeBean("7","Aradhan","Nandi"));
        employees.put("8", new EmployeeBean("8","Bandita","Purohit"));
        employees.put("9", new EmployeeBean("9","Citrix","Peter"));
        employees.put("10", new EmployeeBean("10","Deba","Mishra"));
        employees.put("11", new EmployeeBean("11","Ehswar","Sahoo"));
        employees.put("12", new EmployeeBean("12","Rani","Mukherjee"));
        employees.put("12", new EmployeeBean("12","Preety","Zinta"));
    }

    public  void doGet(HttpServletRequest request, HttpServletResponse  response)
        throws IOException, ServletException 
    {
    	String firstNameValue = null;
	    String action = request.getParameter("action");
	    System.out.println("Action Name====>>>"+action);
        String targetId = request.getParameter("id");
        System.out.println("Target Id======="+targetId);
        StringBuffer sb = new StringBuffer();
        if (targetId != null) 
        	targetId = targetId.trim().toLowerCase();
        boolean namesAdded = false;
		if ("complete".equals(action)) 
		{
            Iterator it = employees.keySet().iterator();
            while (it.hasNext()) 
            {
                String id = (String)it.next();
                EmployeeBean e = (EmployeeBean)employees.get(id);
                // simple matching only for start of first or last name
                if ((targetId != null) && (e.getFirstName().toLowerCase().startsWith(targetId) ||
                    e.getLastName().toLowerCase().startsWith(targetId)) &&
                    !targetId.equals(""))  
                {
                    sb.append("<employee>");
                    sb.append("<id>" + e.getId() + "</id>");
                    sb.append("<firstName>" + e.getFirstName() + "</firstName>");
                    sb.append("<lastName>" + e.getLastName() + "</lastName>");
                    sb.append("</employee>");
                    namesAdded = true;
                    firstNameValue = e.getFirstName();
                    
                }
            }
		    if (namesAdded) 
		    {
			    response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
		        response.getWriter().write("<employees>" + sb.toString() + "</employees>");
		        request.setAttribute("FIRSTNAME",firstNameValue);
			}
		    else 
			{
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
	    } 
//		else if ("lookup".equals(action)) 
//         {
//            // put the target employee in the reqeust scope to display 
//            if ((targetId != null) && employees.containsKey(targetId.trim())) 
//            {
//                request.setAttribute("employee", employees.get(targetId));
//                request.setAttribute("FIRSTNAME",firstNameValue);
//                context.getRequestDispatcher("/employee.jsp").forward(request, response);
//                request.setAttribute("employee", employees );
//            }
//            else 
//            {
//                context.getRequestDispatcher("/error.jsp").forward(request, response);
//            }
//		}
    }
}


