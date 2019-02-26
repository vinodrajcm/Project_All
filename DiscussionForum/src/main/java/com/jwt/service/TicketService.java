package com.jwt.service;

/**
 * @author munirvc
 * date : 7-feb-2019 
 * version : 1.0
 * 
 * TicketService interface as methods to call service now
 *
 */
public interface TicketService {

	public String webServiceCall(String url,String userId , String password);
}
