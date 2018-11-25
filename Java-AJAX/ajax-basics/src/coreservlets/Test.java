package coreservlets;

import java.util.*;

public class Test {
  public static void main(String[] args) {
    System.out.printf("<B><FONT COLOR=\"RED\">%tr</FONT></B>",
                      new GregorianCalendar());
    String[] names = null;
    System.out.println("Before loop");
    for(String name: names) {
      System.out.println(name);
    }
    System.out.println("After loop");
  }
}