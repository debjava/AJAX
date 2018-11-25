package net.kencochrane;

import org.apache.log4j.PropertyConfigurator;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/*
*  Created for Part 2, by Ken Cochrane
*  http://KenCochrane.net , http://CampRate.com , http://PopcornMonsters.com
*/

public class LogInit extends HttpServlet {

    /**
     * Calls setupLogging to initialize log4j.
     */
    public void init() {
        setupLogging();
    }

    /**
     * Reloads logging configuration and sends a redirect to /
     *
     * @param req the Http request
     * @param res the response sent to the browser
     */
    public void doGet( HttpServletRequest req, HttpServletResponse res )  throws ServletException, IOException {
        if ( req.getParameter( "reload" ) != null ) {
           setupLogging();
        }
        res.sendRedirect( "/" );
    }

    /**
     * Configures the log4j logging system by reading in a configuration file.
     */
    private void setupLogging() {
        String configFileName = getInitParameter( "log4j-config-file" );
          try {

              if ( configFileName != null ) {
                  InputStream instr = this.getClass().getClassLoader().getResourceAsStream(configFileName);
                  Properties props = new Properties();
                  props.load( instr );
                  PropertyConfigurator.configure( props );
                  System.out.println("Loginit: Configured logging system");
              } else {
                  System.out.println("Loginit: unable to find config file name.");
              }

          } catch ( IOException ie ) {
              System.out.println("IO Exception: " + ie.getMessage());
          }
      }

}// LogInit