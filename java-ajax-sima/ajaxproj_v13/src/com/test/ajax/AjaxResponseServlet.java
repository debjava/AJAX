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
	/**
	 * Generated serial version id;
	 */
	private static final long serialVersionUID = -7005412269532564405L;

	public void doGet( HttpServletRequest request , HttpServletResponse response ) 
		throws ServletException,IOException
	{
		
		System.out.println("************** Inside the doGet method of the servlet ********************");
		String firstNo = request.getParameter("firstno");
		System.out.println("First No======>>>"+firstNo);
		
		String secondNo = request.getParameter("secondno");
		System.out.println("Second No=========>>>>"+secondNo);
				
		if( firstNo != null && secondNo != null )
		{	String result = null;
			try
			{
				result = String.valueOf( ( Integer.parseInt( firstNo )+Integer.parseInt( secondNo ) ) );
				response.setContentType( "text/html" );
				response.setHeader("Cache-Control", "no-cache");				
				response.getWriter().write( result );
			}
			catch( Exception e )
			{
				System.out.println("An error has occured, please provide the actual data");
				response.getWriter().write( "Error" );
			}
		}
		else
		{
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write( "Error" );
		}
		System.out.println("************** Inside the doGet method of the servlet ********************");
	}
}
