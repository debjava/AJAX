package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ShowTimesInCities extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setContentType("text/xml");
    String timezone = request.getParameter("timezone");
    List legalZones =
      Arrays.asList("eastern", "central", "mountain", "pacific");
    if ((timezone == null) || (!legalZones.contains(timezone))) {
      timezone = "eastern";
    }
    timezone = timezone.toLowerCase();
    String outputPage =
      String.format("/WEB-INF/results/%s.jsp", timezone);
    FormattedTimeAndDay timeAndDay =
      new FormattedTimeAndDay(timezone);
    request.setAttribute("timeAndDay", timeAndDay);
    RequestDispatcher dispatcher =
      request.getRequestDispatcher(outputPage);
    dispatcher.include(request, response);
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
