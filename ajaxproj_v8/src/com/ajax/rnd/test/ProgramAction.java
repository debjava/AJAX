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

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author PIKU
 *
 */
public class ProgramAction extends Action {


	  public ActionForward execute(ActionMapping mapping, ActionForm inForm, HttpServletRequest request, HttpServletResponse response) throws Exception {

	    // Get a list of characters associated with the select TV show
	    String tvShow = (String)request.getParameter("tvShow");
	    System.out.println("TV show=========>>>"+tvShow);
	    if (tvShow == null) {
	      tvShow = "";
	    }
	    ArrayList characters = getCharacters(tvShow);
	  
	    String html = "<select name=\"CharactersSelect\">";
	    int i = 0;
	    for (Iterator it = characters.iterator(); it.hasNext();) {
	      String name = (String)it.next();
	      i++;
	      html += "<option value=\"" + i + "\">" + name + "</option>";
	    }
	    html += "</select>";

	    // Write the HTML to response
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    out.println(html);
	    out.flush();

	    return null; 

	  }
	  
	  private ArrayList getCharacters(String tvShow) {

	    ArrayList al = new ArrayList();

	    if (tvShow.equalsIgnoreCase("Star Tv")) {
	      al.add("Star News");
	      al.add("Star Cinema");
	      al.add("Star Movies");
	      al.add("Star advertising");
	      al.add("CNN-IBN");
	    }

	    if (tvShow.equalsIgnoreCase("DD Oriya")) {
	      al.add("DD Cinema");
	      al.add("DD Serials");
	      al.add("DD Oriya News");
	      al.add("Ajira Odisa");
	      al.add("DD Oriya Festivals");
	      al.add("DD Oriya Albums");
	    }

	    if (tvShow.equalsIgnoreCase("Zee News")) {
	      al.add("Zee Cinamea");
	      al.add("Zee English Movies");
	      al.add("Zee Sas baha");
	      al.add("Zee International");
	      al.add("Zee Forest");
	    }

	    return al;

	  }

	} 
