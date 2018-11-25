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

package com.test.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Debadatta Mishra(PIKU)
 *
 */
public class AjaxResponseServlet extends HttpServlet 
{
	public void doGet( HttpServletRequest request , HttpServletResponse response ) 
		throws ServletException,IOException
	{
		System.out.println(".......... Calling the Servlet ............");
		String key = request.getParameter("key");
		if( key != null )
		{
			int keyInt = key.charAt( 0 );
			String decimalString = Integer.toString( keyInt );
			response.setContentType( "text/html" );
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write( decimalString );
		}
		else
		{
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write("?");
		}
	}
}
