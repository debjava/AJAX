package ajaxsample;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.io.IOException;
import org.apache.struts.util.LabelValueBean;
import java.util.*;
/**
 *
 * @author rupali_l
 */
public class CacheServlet extends HttpServlet {
    
    
    /** Creates a new instance of CacheServlet */
    public void init() throws ServletException {
   
      
        System.out.println("In do get of CacheServlet");
        ArrayList countries = new ArrayList(); 
        countries.add(new  LabelValueBean("India", "1" ));
        countries.add(new  LabelValueBean("U.S","2"));
        countries.add(new  LabelValueBean( "Australia","3"));
        
        ArrayList states = new ArrayList(); 
        states.add(new  LabelValueBean("Maharashtra","11"));
        states.add(new  LabelValueBean( "Delhi","12"));
        states.add(new  LabelValueBean("Goa","13"));
        states.add(new  LabelValueBean( "Newjersey","21"));
        states.add(new  LabelValueBean("NewYork","22"));
        states.add(new  LabelValueBean( "California","23"));
        states.add(new  LabelValueBean("Sydney","31"));
        getServletContext().setAttribute("countries", countries);
        getServletContext().setAttribute("states", states);
        
       
    }
        
    
    public void doGet(HttpServletRequest request ,HttpServletResponse response) throws ServletException,
    IOException
    {
        // request.getRequestDispatcher
    }       
            
    
}