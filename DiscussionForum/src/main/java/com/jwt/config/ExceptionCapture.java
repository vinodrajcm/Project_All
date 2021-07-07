package com.jwt.config;

import org.hibernate.annotations.common.util.impl.Log;
import org.jboss.logging.Logger;
import org.jboss.logging.Logger.Level;

import com.jwt.controller.TicketUpdate;

public class ExceptionCapture extends Exception{

	private static final Logger logger = Logger.getLogger(ExceptionCapture.class);
	
	 public ExceptionCapture(String s) 
	    { 
	     // Call constructor of parent Exception 
		 logger.log(Level.ERROR,s);
	    } 
	
}
