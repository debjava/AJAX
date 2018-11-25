package coreservlets;

import java.util.*;

/** A class representing a timezone on the U.S. mainland. */

public class TimeZone {
  private int offset;
  private String[] cities;

  public TimeZone(int offset, String[] cities) {
    this.offset = offset;
    this.cities = cities;
  }

  /** Offset in hours relative to New York. */

  public int getOffset() {
    return(offset);
  }

  public String[] getCities() {
    return(cities);
  }

  public boolean isInZone(String city) {
    for(String c: cities) {
      if(c.equalsIgnoreCase(city)) {
        return(true);
      }
    }
    return(false);
  }

  public static String getTimeString(String city,
                                     TimeZone[] zones,
                                     Calendar dateTime) {
    int timeZoneOffset = findOffset(city);
    if (timeZoneOffset <= 0) {
      dateTime.add(Calendar.HOUR_OF_DAY, timeZoneOffset);
      String timeString =
        String.format("In %s, it is now %tr on %tD.",
                      city, dateTime, dateTime);
      return(timeString);
    } else {
      String timeString =
        String.format("Unknown city '%s'.", city);
      return(timeString);
    }
  }

  public static String getTimeString(String city,
                                     Calendar dateTime) {
    return(getTimeString(city, getCommonZones(), dateTime));
  }

  public static String getTimeString(String city) {
    return(getTimeString(city, new GregorianCalendar()));
  }

  public static int findOffset(String city, TimeZone[] zones) {
    if (city != null) {
      for(TimeZone zone: zones) {
        if(zone.isInZone(city)) {
          return(zone.getOffset());
        }
      }
    }
    return(1); // Real zones are 0 or negative
  }

  public static int findOffset(String city) {
    return(findOffset(city, getCommonZones()));
  }

  private final static String[] EASTERN_CITIES =
    {"New York", "Philadelphia", "Boston"};
  private final static String[] CENTRAL_CITIES =
      {"Chicago", "Dallas", "New Orleans"};
  private final static String[] MOUNTAIN_CITIES =
      {"Denver", "Salt Lake City", "Phoenix"};
  private final static String[] PACIFIC_CITIES =
      {"Seattle", "Los Angeles", "San Francisco"};
  private final static TimeZone[] COMMON_ZONES =
      {new TimeZone(0,  EASTERN_CITIES),
       new TimeZone(-1, CENTRAL_CITIES),
       new TimeZone(-2, MOUNTAIN_CITIES),
       new TimeZone(-3, PACIFIC_CITIES)};

  public static TimeZone[] getCommonZones() {
    return(COMMON_ZONES);
  }
}