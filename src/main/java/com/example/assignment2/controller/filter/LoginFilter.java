package com.example.assignment2.controller.filter;

import com.example.assignment2.dto.person.extend.User;
import com.example.assignment2.util.ServletType;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter( urlPatterns = { "/servlet" } )
public class LoginFilter implements Filter {
	
	
	@Override
	public void init ( FilterConfig filterConfig ) throws ServletException {
	
	}
	
	@Override
	public void doFilter ( ServletRequest request, ServletResponse response, FilterChain chain ) throws IOException,
	                                                                                                    ServletException {
		
		System.out.println( "do filter" );
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpResp = (HttpServletResponse) response;
		
		User user = (User) httpReq.getSession().getAttribute( "user" );
		
		// if LOGIN is required, make request to /servlet
		if ( request.getParameter( "type" ).equals( ServletType.LOGIN ) ) {
			chain.doFilter( request, response );
			return;
		}
		
		// if user is not login, send request to login.jsp
		if ( user == null ) {
			// send to login page
			httpReq.setAttribute( "errorMessage", "Please login" );
			httpReq.getRequestDispatcher( "/view/login.jsp" ).forward( httpReq, httpResp );
			return;
		}
		
		// user is login, make request to /servlet
		chain.doFilter( request, response );
	}
	
	@Override
	public void destroy ( ) {
	
	}
}