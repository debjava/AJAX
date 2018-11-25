import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ValidationServlet extends HttpServlet {
    
    private ServletContext context;
    private HashMap accounts = new HashMap();
 
    public void init(ServletConfig config) throws ServletException {
	    super.init(config);
        this.context = config.getServletContext();
        accounts.put("greg","account data");
        accounts.put("duke","account data");
        accounts.put("lilu","account data");
        
    }
    
    public  void doGet(HttpServletRequest request, HttpServletResponse  response)
        throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String targetId = request.getParameter("id");
	    if ((targetId != null) && !accounts.containsKey(targetId.trim())) 
	    {
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write("<valid>true</valid>");
            request.setAttribute("targetId", targetId);
        } 
	    else 
	    {
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write("<valid>false</valid>");
        }
    }

    public  void doPost(HttpServletRequest request, HttpServletResponse  response)
        throws IOException, ServletException {

        String targetId = request.getParameter("id");
        if ((targetId != null) && !accounts.containsKey(targetId.trim())) {
            accounts.put(targetId.trim(), "account data");
            request.setAttribute("targetId", targetId);
            context.getRequestDispatcher("/success.jsp").forward(request, response);
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}



