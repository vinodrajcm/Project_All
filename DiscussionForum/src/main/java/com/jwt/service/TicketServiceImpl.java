package com.jwt.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jboss.logging.Logger;
import org.jboss.logging.Logger.Level;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.config.ApplicationProperties;
import com.jwt.controller.TicketUpdate;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {

	private static final Logger logger = Logger.getLogger(TicketUpdate.class);
	
	@Override
	public String webServiceCall(String url,String userId , String password) {
		String output= null;
		try {
		DefaultHttpClient httpClient = new DefaultHttpClient();
		String Weburl = url;
		Weburl = Weburl.replaceAll(" ", "%20");
		HttpGet getRequest = new HttpGet(Weburl);
		getRequest.addHeader("accept",ApplicationProperties.XML);
		if(password == null || password.isEmpty()  || password == "usersUpdatefromTeamLead"){
			userId = ApplicationProperties.USERID;
			password = ApplicationProperties.PASSWORD;
		}
		String auth = userId + ":" + password;
		String encodedUserDetails = Base64.getEncoder().encodeToString(auth.getBytes("utf-8"));
		encodedUserDetails = "Basic "+encodedUserDetails;
		getRequest.addHeader("Authorization",encodedUserDetails);
		HttpResponse response = httpClient.execute(getRequest);
		if (response.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + response.getStatusLine().getStatusCode());
		}
		output = EntityUtils.toString(response.getEntity());
		logger.log(Level.INFO, output);
		httpClient.getConnectionManager().shutdown();
		} catch ( IOException | RuntimeException e) {
			logger.log(Level.INFO, e.toString());
		}
		
		
		return output;
	}

}
