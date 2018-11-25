package coreservlets;

import java.util.*;

public class FormattedTimeAndDay {
  private Calendar dateTime;

  public FormattedTimeAndDay(String timezone) {
    String[] zones = { "EASTERN", "CENTRAL", "MOUNTAIN", "PACIFIC"};
    if (timezone == null) {
      timezone = "EASTERN";
    }
    timezone = timezone.toUpperCase();
    int offset = 0;
    for(String zone: zones) {
      if (zone.equalsIgnoreCase(timezone)) {
        break;
      }
      offset = offset - 1;
    }
    dateTime = new GregorianCalendar();
    dateTime.add(Calendar.HOUR_OF_DAY, offset);
  }

  public String getTime() {
    return(String.format("%tr", dateTime));
  }

  public  String getDay() {
    return(String.format("%tD", dateTime));
  }
}