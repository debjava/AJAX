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
import java.util.HashMap;
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
public class TableCreateAction extends Action {


	  public ActionForward execute(ActionMapping mapping, ActionForm inForm, HttpServletRequest request, HttpServletResponse response) throws Exception {

	    String sortField = (String)request.getParameter("sortField");
	    System.out.println("sortField======>>>"+sortField);
	    if (sortField == null) 
	    {
	      sortField = "";
	    }
	    ArrayList sortedNamesList = getNamesList(sortField);

	    // And yes, I know creating HTML in an Action is generally very bad form,
	    // but I wanted to keep this exampel simple.
	    String html = "<table border=\"1\" align=\"center\" cellpadding=\"2\" cellspacing=\"0\">";
	    html += "<tr>";
	    html += "<th onClick=\"retrieveURL('tablecreateaction.do?sortField=firstName');\" onMouseOver=\"style.background='#c0c0c0';\" onMouseOut=\"style.background='';\">First Name</th>";
	    html += "<th onClick=\"retrieveURL('tablecreateaction.do?sortField=middleName');\" onMouseOver=\"style.background='#c0c0c0';\" onMouseOut=\"style.background='';\">Middle Name</th>";
	    html += "<th onClick=\"retrieveURL('tablecreateaction.do?sortField=lastName');\" onMouseOver=\"style.background='#c0c0c0';\" onMouseOut=\"style.background='';\">Last Name</th>";
	    html += "<th onClick=\"retrieveURL('tablecreateaction.do?sortField=firstYearInOffice');\" onMouseOver=\"style.background='#c0c0c0';\" onMouseOut=\"style.background='';\">First Year In Office</th>";
	    html += "<th onClick=\"retrieveURL('tablecreateaction.do?sortField=lastYearInOffice');\" onMouseOver=\"style.background='#c0c0c0';\" onMouseOut=\"style.background='';\">Last Year In Office</th>";
	    html += "</tr>";
	    for (Iterator it = sortedNamesList.iterator(); it.hasNext();) {
	      HashMap hm = (HashMap)it.next();
	      html += "<tr>";
	      html += "<td>" + (String)hm.get("firstName")         + "</td>";
	      html += "<td>" + (String)hm.get("middleName")        + "</td>";
	      html += "<td>" + (String)hm.get("lastName")          + "</td>";
	      html += "<td>" + (String)hm.get("firstYearInOffice") + "</td>";
	      html += "<td>" + (String)hm.get("lastYearInOffice")  + "</td>";
	      html += "</tr>";
	    }
	    html += "</table>";

	    // Write the HTML to response
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    out.println(html);
	    out.flush();

	    return null;

	  } 
	  
	  private ArrayList getNamesList(String sortField) {

	    ArrayList al = new ArrayList();

	    // No "sort", initial page display
	    if (sortField.equalsIgnoreCase("")) 
	    {
	      al.add(name1());
	      al.add(name2());
	      al.add(name3());
	      al.add(name4());
	      al.add(name5());
	    }

	    // "Sort" by first name
	    if (sortField.equalsIgnoreCase("FirstName")) {
	      al.add(name3());
	      al.add(name5());
	      al.add(name4());
	      al.add(name2());
	      al.add(name1());
	    }

	    // "Sort" by middle name
	    if (sortField.equalsIgnoreCase("MiddleName")) 
	    {
	      al.add(name5());
	      al.add(name3());
	      al.add(name4());
	      al.add(name1());
	      al.add(name2());
	    }

	    // "Sort" by last name
	    if (sortField.equalsIgnoreCase("LastName")) 
	    {
	      al.add(name1());
	      al.add(name5());
	      al.add(name3());
	      al.add(name4());
	      al.add(name2());
	    }

	    // "Sort" by first year in office
	    if (sortField.equalsIgnoreCase("FirstYearInOffice")) 
	    {
	      al.add(name3());
	      al.add(name5());
	      al.add(name4());
	      al.add(name2());
	      al.add(name1());
	    }

	    // "Sort" by last year in office
	    if (sortField.equalsIgnoreCase("LastYearInOffice")) 
	    {
	      al.add(name3());
	      al.add(name5());
	      al.add(name4());
	      al.add(name2());
	      al.add(name1());
	    }
	    return al;

	  } 
	  
	  private HashMap name1() {

	    HashMap hm = new HashMap();
	    hm.put("firstName",         "PIKU");
	    hm.put("middleName",        "LILU");
	    hm.put("lastName",          "ARZOO");
	    hm.put("firstYearInOffice", "1993");
	    hm.put("lastYearInOffice",  "2001");
	    return hm;

	  } // president1()


	  // Get the details of president #2
	  private HashMap name2() {

	    HashMap hm = new HashMap();
	    hm.put("firstName",         "SIMA");
	    hm.put("middleName",        "MISHRA");
	    hm.put("lastName",          "ARADHANA");
	    hm.put("firstYearInOffice", "1981");
	    hm.put("lastYearInOffice",  "1989");
	    return hm;

	  } // president2()


	  // Get the details of president #3
	  private HashMap name3() {

	    HashMap hm = new HashMap();
	    hm.put("firstName",         "SIMA");
	    hm.put("middleName",        "MOHANTY");
	    hm.put("lastName",          "RAMA");
	    hm.put("firstYearInOffice", "1961");
	    hm.put("lastYearInOffice",  "1963");
	    return hm;

	  } // president3()


	  // Get the details of president #4
	  private HashMap name4() {

	    HashMap hm = new HashMap();
	    hm.put("firstName",         "HARI");
	    hm.put("middleName",        "SHYAMA");
	    hm.put("lastName",          "SUNITA");
	    hm.put("firstYearInOffice", "1969");
	    hm.put("lastYearInOffice",  "1974");
	    return hm;

	  } // president4()


	  // Get the details of president #5
	  private HashMap name5() 
	  {

	    HashMap hm = new HashMap();
	    hm.put("firstName",         "HATI");
	    hm.put("middleName",        "GHODA");
	    hm.put("lastName",          "BAGHA");
	    hm.put("firstYearInOffice", "1963");
	    hm.put("lastYearInOffice",  "1969");
	    return hm;
	  }
}	  
