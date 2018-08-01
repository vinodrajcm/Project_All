package com.jwt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jwt.service.session.sessionBean;

public class loginInterceptor extends HandlerInterceptorAdapter{
	
	/**
     * Instantiates a new bx custom interceptor.
     */
    public loginInterceptor() {
	super();
    }
    
    @Autowired
	private sessionBean sessionBean;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	boolean result = true;
	
	String userName = null;
	if (sessionBean != null && sessionBean.getEmp() != null) {
		userName  = sessionBean.getEmp().getLoginId();
		
	    }
	    if (userName  == null || userName == "" ) {
	    	
	    	 StringBuilder redirectUrl = new StringBuilder(request.getContextPath())
	    			    .append("/login");
	    	 response.sendRedirect(redirectUrl.toString());
	    	return false;
	    }
	
	
	
	return result;
    }
    
    @Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("After handling the request");
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("After rendering the view");
		super.afterCompletion(request, response, handler, ex);
	}

}
