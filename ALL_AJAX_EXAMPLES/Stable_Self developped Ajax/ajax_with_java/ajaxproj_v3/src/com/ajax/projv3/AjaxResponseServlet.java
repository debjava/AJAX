package com.ajax.projv3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxResponseServlet extends HttpServlet 
{
	public void doGet( HttpServletRequest request , HttpServletResponse response ) 
		throws ServletException,IOException
	{
		System.out.println("************** Inside the doGet method of the servlet ********************");
		String textFromJsp = request.getParameter("name");
		System.out.println("You have entered text as ===>>>"+textFromJsp);
		
		String wishMsg = "Hi ";
		String welcomeMsg = ", you are welcomed to ajax. Enjoy ajax through this example.";
		String unknownMsg = "Since you are unknown to us, we can not wish you." +
				" Please enter your name in the text field";
		
		if( textFromJsp != null && textFromJsp.length() != 0 )
		{
			String genResponse = new StringBuffer(wishMsg).append(textFromJsp)
					.append(welcomeMsg).toString();
			response.setContentType( "text/html" );
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write( genResponse );
		}
		else
		{
			String genResponse = unknownMsg;
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write( genResponse );
		}
		System.out.println("************** Inside the doGet method of the servlet ********************");
	}
}
