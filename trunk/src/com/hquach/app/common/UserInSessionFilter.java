package com.hquach.app.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class UserInSessionFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		// we only deal with http requests
	    if (!(req instanceof HttpServletRequest)) {
	      chain.doFilter(req, res);
	      return;
	    }

	    // we are http
	    HttpServletRequest request = (HttpServletRequest) req;
	    UserService userService = UserServiceFactory.getUserService();
	    
	    if (request.getUserPrincipal() != null) {
	    	request.setAttribute("LoggedIn", Boolean.TRUE);
	    	request.setAttribute("logoutURL", userService.createLogoutURL(request.getRequestURI()));
	    	request.setAttribute("groups", JDOServices.getGroups(request.getUserPrincipal().getName()));
                                     
        } else {
        	request.setAttribute("LoggedIn", Boolean.FALSE);
        	request.setAttribute("loginURL", userService.createLoginURL(request.getRequestURI()));
        }
	    chain.doFilter(req, res);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
