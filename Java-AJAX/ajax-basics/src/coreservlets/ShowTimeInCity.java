package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ShowTimeInCity extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String city = request.getParameter("city");
    boolean useHTML = false;
    if (request.getParameter("useHTML") != null) {
      useHTML = true;
    }
    String message = TimeZone.getTimeString(city);
    if (useHTML) {
      message = String.format("<h2>%s</h2>", message);
    }
    out.print(message);
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
