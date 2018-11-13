package com.jwt.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Employee;
import com.jwt.model.Messages;
import com.jwt.model.SystemProperties;
import com.jwt.model.TicketHistory;
import com.jwt.model.TicketResult;
import com.jwt.model.Tickets;
import com.jwt.model.TicketsData;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
@RequestMapping(value = "/ticketUpdate")
public class TicketUpdate {

	private static final Logger logger = Logger
			.getLogger(TicketUpdate.class);
	
	public TicketUpdate() {
		System.out.println("TicketUpdate()"); 
		
	}
	
	
	@Autowired(required = true)
	private EmployeeService employeeService;
	
	@Autowired(required = true)
	private sessionBean sessionBean;
	
	@RequestMapping(value = "/TicketLogin")
	public ModelAndView userEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView model =new ModelAndView();
			model.setViewName("pages/Ticket/Login");
		return model ;
	}
	
	@RequestMapping(value = "/TicketReview")
	public ModelAndView ticketReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView model =new ModelAndView();
			model.setViewName("pages/Ticket/TicketReview");
		return model ;
	}
	
	
	@RequestMapping(value = "/userSearch")
	public @ResponseBody String userSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String tag = request.getParameter("user") == null ? "" : request.getParameter("user");
		JSONObject xmlJSONObj = null;
		
		try {
			DefaultHttpClient httpClient = new DefaultHttpClient();
			String url = "https://kennametal.service-now.com/api/now/table/sys_user?sysparm_query=nameSTARTSWITH"+tag+"&sysparm_fields=user_name%2Cname";
			url = url.replaceAll(" ", "%20");
			HttpGet getRequest = new HttpGet(
					url);
			getRequest.addHeader("accept", "application/xml");
			getRequest.addHeader("Authorization", "Basic bXVuaXJ2YzpaaXBnb0AxMjM0NQ==");
			HttpResponse response1 = httpClient.execute(getRequest);

			if (response1.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response1.getStatusLine().getStatusCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(response1.getEntity().getContent())));

			String output = "";
			String output2 = "";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {

				System.out.println(output);
				output2 = output;
			}

				try {
					xmlJSONObj = XML.toJSONObject(output2);
					
					System.out.println(xmlJSONObj.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			
			httpClient.getConnectionManager().shutdown();

		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		ModelAndView model2 = new ModelAndView();
		
		return xmlJSONObj.toString();
	}
	
	@RequestMapping(value = "/TicketAuth",method=RequestMethod.POST)
	public @ResponseBody String  ticketUserAuth(HttpServletRequest request, HttpServletResponse response) {
		String userId = null;
		String password = null;
		String outPut = null;
		
		boolean isLadapAuthenticated = false;
		try{
			userId = request.getParameter("userId") != null ? request.getParameter("userId") : null;
			password = request.getParameter("password") != null ?  request.getParameter("password") : null;
		
		if(userId != null && password != null){
			isLadapAuthenticated = employeeService.getUserAuthenticated(userId, password);
		}
		
		}
		catch(NullPointerException e){
			System.out.println("null pointer exception" + e.toString());
			outPut = "false" ;
			
			
		}
		if(isLadapAuthenticated == true){
			
			Employee emp = new Employee();
			emp.setLoginId(userId);
			emp.setPassword(password);
			sessionBean.setEmp(emp);
			
			return outPut = "true" ;
			
		}else{
			
			return outPut = "false" ;
		}
		
			
		
	}
	
	
	public String getSysId(String user_Id){
			JSONObject xmlJSONObj = null;
			String userId ="";
			String password = "";
			
			if(user_Id.isEmpty()){
				userId = sessionBean.getEmp().getLoginId();
				password = sessionBean.getEmp().getPassword();
			}else{
				userId = user_Id;
			}
			
			
			String sys_id = "";
		try {
			DefaultHttpClient httpClient = new DefaultHttpClient();
			String url = "https://kennametal.service-now.com/api/now/table/sys_user?sysparm_query=user_name="+userId+"&sysparm_fields=sys_id&sysparm_limit=1";
			url = url.replaceAll(" ", "%20");
			HttpGet getRequest = new HttpGet(url);
			getRequest.addHeader("accept", "application/xml");
			String auth = userId+":"+password;	
			String encode = Base64.encodeBase64(auth.getBytes("UTF-8")).toString(); 
			
			//String authStringEnc = new BASE64Encoder().encode(auth.getBytes()); 
			getRequest.addHeader("Authorization", "Basic bXVuaXJ2YzpaaXBnb0AxMjM0NQ==");
			HttpResponse response1 = httpClient.execute(getRequest);

			if (response1.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response1.getStatusLine().getStatusCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((response1.getEntity().getContent())));

			String output = "";
			String output2 = "";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				output2 = output;
			}

				try {
					xmlJSONObj = XML.toJSONObject(output2);
					JSONObject  xmlJSONObjresult1=  xmlJSONObj.getJSONObject("response").getJSONObject("result");
					sys_id = (String)xmlJSONObjresult1.get("sys_id");
					
					System.out.println(xmlJSONObj.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			
			httpClient.getConnectionManager().shutdown();

		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sys_id;
	}
	
	
	@RequestMapping(value = "/getTickets" ,method=RequestMethod.GET)
	public    ModelAndView getChange() throws IOException {
		List<TicketsData>  outPut = null;
		
		if(sessionBean.getEmp() == null){
			ModelAndView model =new ModelAndView();
			model.setViewName("pages/Ticket/Login");
			return model ;
		}
		
		String sys_id = getSysId("");
		
		if(sys_id == ""){
			ModelAndView model =new ModelAndView();
			model.setViewName("pages/Ticket/Login");
			return model ;
		}
		
		outPut = getTicketsBysystemId(sys_id,sessionBean.getEmp().getLoginId(), "");
		
		ModelAndView model = new ModelAndView();
		model.addObject("result",outPut);
		model.setViewName("pages/Ticket/userTickets");
		return model;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<TicketsData> getTicketsBysystemId(String sysId,String userId, String password){
		JSONObject xmlJSONObj = null;
		JSONObject xmlJSONObj2 = null;
		List<TicketsData> tickets_dataTable = new ArrayList<TicketsData>();
		List<Tickets> cars2 = new ArrayList<Tickets>();
		try {
			DefaultHttpClient httpClient = new DefaultHttpClient();
		String url1 = "https://kennametal.service-now.com/api/now/table/incident?sysparm_query=assigned_to="+sysId+"%5Eincident_state!%3D7%5E8%5E25&sysparm_fields=number%2Cassigned_to%2Cassignment_group%2Csys_created_on%2Cshort_description%2Cincident_state&sysparm_limit=1000";
		url1 = url1.replaceAll(" ", "%20");
		HttpGet getRequest1 = new HttpGet(
				url1);
		getRequest1.addHeader("accept", "application/xml");
		getRequest1.addHeader("Authorization", "Basic bXVuaXJ2YzpaaXBnb0AxMjM0NQ==");
		HttpResponse response1 = httpClient.execute(getRequest1);
		if (response1.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ response1.getStatusLine().getStatusCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
				(response1.getEntity().getContent())));

		String output = "";
		String output2 = "";
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {

			System.out.println(output);
			output2 = output;
		}

			try {
				xmlJSONObj = XML.toJSONObject(output2);
				
				JSONObject xmlJSONObj21 = xmlJSONObj.getJSONObject("response");
				JSONArray  xmlJSONObjresult1 = null;
				xmlJSONObjresult1 =  xmlJSONObj21.getJSONArray("result");
				ObjectMapper objectMapper = new ObjectMapper();
				TicketResult car =objectMapper.readValue(xmlJSONObj21.toString(), TicketResult.class);
				
				cars2 = car.getResult();
				// Create iterator to loop through each book in list.
	            for(Iterator<Tickets> bookIterator = cars2.iterator(); bookIterator.hasNext();){
	                // Get next book.
	            	Tickets tickets = bookIterator.next();
	            	
	                // 
	                if (tickets.getIncident_state().equals("6") || tickets.getIncident_state().equals("25")) {
	                    bookIterator.remove();
	                } 
	            }
	            
	         
	            for (Tickets tickets : cars2) {
	            	TicketsData ticket_dataTable = new TicketsData();
					ticket_dataTable.setTicket(tickets.getNumber());
					ticket_dataTable.setCreatedDate(new Date());
					ticket_dataTable.setUpdateBY(userId);
					ticket_dataTable.setDescription(tickets.getShort_description());
					ticket_dataTable.setStatus(tickets.getIncident_state());
					ticket_dataTable.setTicketCratedDate(tickets.getSys_created_on());
					tickets_dataTable.add(ticket_dataTable);
				}
	            
	            tickets_dataTable =   employeeService.updateTicketsDataBase(tickets_dataTable,userId);
	            
	            
	            if(password == "cron"){
	            	return null;
	            }
	            List<SystemProperties> listOfStatus = employeeService.getValues("ticketStatus");
				for (TicketsData tickets : tickets_dataTable) {
					
					String incidentState = tickets.getStatus();
					for (SystemProperties systemProperties : listOfStatus) {
						
						if(incidentState.equals(systemProperties.getName())){
							tickets.setStatus(systemProperties.getDescription());
						}
					}
				}
	           
				
				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		httpClient.getConnectionManager().shutdown();

	} catch (ClientProtocolException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		return tickets_dataTable;
	}
	
	
	@RequestMapping(value = "/updateTicketPlanDate" ,method=RequestMethod.POST)
	public @ResponseBody String  updateTicketPlanDate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String output ="";
		String ticket = null;
		String planStartDate = null;
		String planEndDate = null;
		Date createdDate = new Date();
		String noHours = null;
		String comments = null;
		String createdBy = sessionBean.getEmp().getLoginId();
	
		ticket = request.getParameter("ticket") != null ? request.getParameter("ticket") : null;
		planStartDate = request.getParameter("planStartDate") != null ?  request.getParameter("planStartDate") : null;
		planEndDate = request.getParameter("planEndDate") != null ? request.getParameter("planEndDate") : null;
		noHours = request.getParameter("noHours") != null ?  request.getParameter("noHours") : null;
		comments = request.getParameter("comments") != null ?  request.getParameter("comments") : null;
		
		SimpleDateFormat formate = new SimpleDateFormat("MM/dd/yyyy");
		Date startDate = null;
		Date endDate = null;
		try {
			startDate = formate.parse(planStartDate);
			endDate = formate.parse(planEndDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		TicketHistory ticket_db = new TicketHistory();
		ticket_db.setTicket(ticket);
		ticket_db.setCreatedDate(createdDate);
		ticket_db.setNoHours(noHours);
		ticket_db.setPlanEndDate(endDate);
		ticket_db.setPlanStartDate(startDate);
		ticket_db.setComments(comments);
		output = employeeService.updateTicketPlanDate(ticket_db);
		
		return output;
	}
	
	public Map<String,String> getState(String changeNumber){
		Map<String,String> output = new HashMap<String,String>();
		try {
		DefaultHttpClient httpClient = new DefaultHttpClient();
		String url1 = "https://kennametal.service-now.com/api/now/table/change_request?sysparm_query=number="+changeNumber+"&sysparm_fields=state%2Csys_created_on&sysparm_limit=1";
		url1 = url1.replaceAll(" ", "%20");
		HttpGet getRequest1 = new HttpGet(
				url1);
		getRequest1.addHeader("accept", "application/xml");
		getRequest1.addHeader("Authorization", "Basic bXVuaXJ2YzpaaXBnb0AxMjM0NQ==");
		HttpResponse response1 = httpClient.execute(getRequest1);
		if (response1.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ response1.getStatusLine().getStatusCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
				(response1.getEntity().getContent())));

		String output1 = "";
		String output2 = "";
		System.out.println("Output from Server .... \n");
		while ((output1 = br.readLine()) != null) {
			System.out.println(output1);
			output2 = output1;
		}

			try {
				JSONObject xmlJSONObj = XML.toJSONObject(output2);
				
				JSONObject xmlJSONObj2 = xmlJSONObj.getJSONObject("response");
				JSONObject xmlJSONObj3 = xmlJSONObj2.getJSONObject("result");
				String createdDate = xmlJSONObj3.getString("sys_created_on");
				String state =  xmlJSONObj3.getString("state");
				output.put("created_date", createdDate);
				output.put("state", state);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		httpClient.getConnectionManager().shutdown();

	} catch (ClientProtocolException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		return output;
		
	}
	
	public List<TicketsData> getChangeBysystemId(String sysId,String userId){
		JSONObject xmlJSONObj = null;
		List<Tickets> cars2 = new ArrayList<Tickets>();
		List<TicketsData> tickets_dataTable = new ArrayList<TicketsData>();
		try {
			DefaultHttpClient httpClient = new DefaultHttpClient();
			//https://kennametal.service-now.com/api/now/table/change_request?sysparm_query=assigned_to=e455f6f3554ef580e05bccaab938ef95%5Estate!%3D3%5Estate!%3D8&sysparm_fields=number%2Cassigned_to%2Cassignment_group%2Cparent%2Csys_created_on%2Cshort_description%2Cstart_date%2Cstate%2Cend_date&sysparm_limit=100
		String url1 = "https://kennametal.service-now.com/api/now/table/change_request?sysparm_query=assigned_to="+sysId+"%5Estate!%3D3%5Estate!%3D8&sysparm_fields=number%2Cassigned_to%2Cassignment_group%2Cparent%2Csys_created_on%2Cshort_description%2Cstart_date%2Cstate%2Cend_date&sysparm_limit=100";
		url1 = url1.replaceAll(" ", "%20");
		HttpGet getRequest1 = new HttpGet(
				url1);
		getRequest1.addHeader("accept", "application/xml");
		getRequest1.addHeader("Authorization", "Basic bXVuaXJ2YzpaaXBnb0AxMjM0NQ==");
		HttpResponse response1 = httpClient.execute(getRequest1);
		if (response1.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ response1.getStatusLine().getStatusCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
				(response1.getEntity().getContent())));

		String output = "";
		String output2 = "";
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
			output2 = output;
		}

			try {
				xmlJSONObj = XML.toJSONObject(output2);
				
				JSONObject xmlJSONObj2 = xmlJSONObj.getJSONObject("response");
				Object result = xmlJSONObj2.get("result");
				JSONArray jsonArray = new JSONArray();
				 if (result instanceof JSONObject) {
				    // It's an object
					 jsonArray.put(result);
					 xmlJSONObj2.remove("result");
					 xmlJSONObj2.append("result", result);
					 
				}
				ObjectMapper objectMapper = new ObjectMapper();
				TicketResult car =objectMapper.readValue(xmlJSONObj2.toString(), TicketResult.class);
				cars2 = car.getResult();
				
				 for (Tickets tickets : cars2) {
		            	TicketsData ticket_dataTable = new TicketsData();
						
						ticket_dataTable.setTicket(tickets.getNumber());
						
						/*Map<String , String> state = getState(tickets.getNumber());
						String createdDate = state.get("created_date");
						String state_change = state.get("state");*/
						
						String state  = tickets.getState();
						
						List<SystemProperties> listOfStatus = employeeService.getValues("changeState");
						
							for (SystemProperties systemProperties : listOfStatus) {
								
								if(state.equals(systemProperties.getName())){
									tickets.setState(systemProperties.getDescription());
								}
							}
						
						DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date startDate = null;
						Date endDate = null;
						try {
							
							if(!tickets.getStart_date().isEmpty() && !tickets.getEnd_date().isEmpty()){
								startDate = inputFormat.parse(tickets.getStart_date());
								endDate = inputFormat.parse(tickets.getEnd_date());
							}
						
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						ticket_dataTable.setTicketCratedDate(tickets.getSys_created_on());
						ticket_dataTable.setStatus(tickets.getState());
						ticket_dataTable.setPlanEndDate(endDate);
						ticket_dataTable.setUpdateBY(userId);
						ticket_dataTable.setPlanStartDate(startDate);
						
						ticket_dataTable.setDescription(tickets.getShort_description());
						
						tickets_dataTable.add(ticket_dataTable);
					}
		            
		           
				
				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		httpClient.getConnectionManager().shutdown();

	} catch (ClientProtocolException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return tickets_dataTable;
	}
	
	
	@RequestMapping(value = "/getReport" ,method=RequestMethod.POST)
	public @ResponseBody Map<String, List<TicketResult>>  getReportForUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String userList = "";
		String usersRole = "";
		userList = request.getParameter("userList") != null ? request.getParameter("userList") : null;
		usersRole = request.getParameter("usersRole") != null ? request.getParameter("usersRole") : null;
		
		
		
		Calendar c=Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
		c.set(Calendar.HOUR_OF_DAY,0);
		c.set(Calendar.MINUTE,0);
		c.set(Calendar.SECOND,0);
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String lastWeek = df.format(c.getTime());      // This past Sunday [ May include today ]
		c.add(Calendar.DATE,7);
		String Week1 = df.format(c.getTime());      // Next Sunday
		c.add(Calendar.DATE,7);
		String Week2= df.format(c.getTime());
		c.add(Calendar.DATE,7);
		String Week3= df.format(c.getTime());
		c.add(Calendar.DATE,7);
		String Week4= df.format(c.getTime());
		c.add(Calendar.DATE,7);
		String Week5= df.format(c.getTime());
		c.add(Calendar.DATE,7);
		String Week6= df.format(c.getTime());
		c.add(Calendar.DATE,7);
		String Week7= df.format(c.getTime());
		c.add(Calendar.DATE,7);
		String Week8= df.format(c.getTime());
		
		String sys_id = "";
		List<TicketResult> listOfUsers = new ArrayList<TicketResult>();
		Map<String, List<TicketResult>> result = new HashMap<String, List<TicketResult>>(); 
		Messages message = new Messages();
		List<String> usersList = Arrays.asList(userList.split("\\s*,\\s*"));
		for (String userName : usersList) {
			TicketResult ticketListForUsers = new TicketResult();
			List<TicketsData> tickets = new ArrayList<TicketsData>();
			String[] user = userName.split("--");
			String userId = user[1];
			//ABAP developers
			if(usersRole.equals("true")){
					sys_id = getSysId(userId);
					tickets = getChangeBysystemId(sys_id,userId);
				
			}
			else{
				tickets = employeeService.getTicketsBasedOnUsers(userId);
				List<SystemProperties> listOfStatus = employeeService.getValues("ticketStatus");
				for (TicketsData tickets2 : tickets) {
					
					String incidentState = tickets2.getStatus();
					for (SystemProperties systemProperties : listOfStatus) {
						
						if(incidentState.equals(systemProperties.getName())){
							tickets2.setStatus(systemProperties.getDescription());
						}
					}
				}
			}
			ticketListForUsers.setUserId(userId);
			if(tickets == null){
				if(message.getInformationMessage() != ""){
					message.setInformationMessage(message.getInformationMessage() + "No records found for user "+ userId +" , ");
				}else{
					message.setInformationMessage("No records found for user "+ userId+" , ");
				}
				
			}else{
				
				for (TicketsData tickets_db : tickets) {
					Date startDate1= tickets_db.getPlanStartDate();
					Date endDate1= tickets_db.getPlanEndDate();
					if(startDate1 != null && endDate1 != null){
						String startDate = df.format(startDate1.getTime());
						
						String endDate = df.format(endDate1.getTime());
						if(endDate.compareTo(lastWeek) < 0 ){
							ticketListForUsers.setPreviousWeek(ticketListForUsers.getPreviousWeek()+1);
							if(ticketListForUsers.getPreviousWeekIncidents() != null){
								ticketListForUsers.setPreviousWeekIncidents(ticketListForUsers.getPreviousWeekIncidents()+','+tickets_db.getTicket());
							}else{
								ticketListForUsers.setPreviousWeekIncidents(tickets_db.getTicket()+',');
							}
							
						}else if(endDate.compareTo(Week1) < 0){
							ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
							if(ticketListForUsers.getWeek1Incidents()!= null){
								ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
							}else{
								ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
							}
						}else if (endDate.compareTo(Week2) < 0){
							if(startDate.compareTo(Week1)<0){
								ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
								ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
								
								if(ticketListForUsers.getWeek1Incidents()!= null){
									ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
								}else{
									ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
									
								}
								if(ticketListForUsers.getWeek2Incidents()!= null){
									ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
								}else{
									ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
								}
							}else if(startDate.compareTo(Week2)<0){
								ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
								if(ticketListForUsers.getWeek2Incidents()!= null){
									ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
								}else{
									ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
								}
							}
							
							
							}else if(endDate.compareTo(Week3) < 0){
								if(startDate.compareTo(Week1)<0){
									ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									if(ticketListForUsers.getWeek1Incidents()!= null){
										ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
										
									}
									if(ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week2)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									if(ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week3)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek3()+1);
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
								}
							}else if(endDate.compareTo(Week4) < 0){
								if(startDate.compareTo(Week1)<0){
									ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									if(ticketListForUsers.getWeek1Incidents()!= null){
										ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
										
									}
									if(ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week2)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									if(ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week3)<0){
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									if(ticketListForUsers.getWeek3Incidents() != null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week4)<0){
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
								}
								
							}else if(endDate.compareTo(Week5) < 0){
								if(startDate.compareTo(Week1)<0){
									ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									if(ticketListForUsers.getWeek1Incidents()!= null){
										ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
										
									}
									if(ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week2)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									if(ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week3)<0){
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									if(ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if(ticketListForUsers.getWeek5Incidents() != null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week4)<0){
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									
									if(ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week5)<0){
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
								}
								
							}else if(endDate.compareTo(Week6) < 0){
								if(startDate.compareTo(Week1)<0){
									ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									if( ticketListForUsers.getWeek1Incidents()!= null){
										ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
										
									}
									if( ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week2)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									if( ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week3)<0){
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week4)<0){
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week5)<0){
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week6)<0){
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
								}
								
							}else if(endDate.compareTo(Week7) < 0){
								if(startDate.compareTo(Week1)<0){
									ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek1Incidents()!= null){
										ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
										
									}
									if( ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week2)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week3)<0){
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week4)<0){
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week5)<0){
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week6)<0){
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week7)<0){
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
								}
							}else{
								if(startDate.compareTo(Week1)<0){
									ticketListForUsers.setWeek1(ticketListForUsers.getWeek1()+1);
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek1Incidents()!= null){
										ticketListForUsers.setWeek1Incidents(ticketListForUsers.getWeek1Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek1Incidents(tickets_db.getTicket()+',');
										
									}
									if( ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week2)<0){
									ticketListForUsers.setWeek2(ticketListForUsers.getWeek2()+1);
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek2Incidents()!= null){
										ticketListForUsers.setWeek2Incidents(ticketListForUsers.getWeek2Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek2Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week3)<0){
									ticketListForUsers.setWeek3(ticketListForUsers.getWeek3()+1);
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek3Incidents()!= null){
										ticketListForUsers.setWeek3Incidents(ticketListForUsers.getWeek3Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek3Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week4)<0){
									ticketListForUsers.setWeek4(ticketListForUsers.getWeek4()+1);
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek4Incidents()!= null){
										ticketListForUsers.setWeek4Incidents(ticketListForUsers.getWeek4Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek4Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents() != null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week5)<0){
									ticketListForUsers.setWeek5(ticketListForUsers.getWeek5()+1);
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek5Incidents()!= null){
										ticketListForUsers.setWeek5Incidents(ticketListForUsers.getWeek5Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek5Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week6)<0){
									ticketListForUsers.setWeek6(ticketListForUsers.getWeek6()+1);
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek6Incidents()!= null){
										ticketListForUsers.setWeek6Incidents(ticketListForUsers.getWeek6Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek6Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week7)<0){
									ticketListForUsers.setWeek7(ticketListForUsers.getWeek7()+1);
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek7Incidents()!= null){
										ticketListForUsers.setWeek7Incidents(ticketListForUsers.getWeek7Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek7Incidents(tickets_db.getTicket()+',');
									}
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}else if(startDate.compareTo(Week8)<0){
									ticketListForUsers.setWeek8(ticketListForUsers.getWeek8()+1);
									if( ticketListForUsers.getWeek8Incidents()!= null){
										ticketListForUsers.setWeek8Incidents(ticketListForUsers.getWeek8Incidents()+','+tickets_db.getTicket());
									}else{
										ticketListForUsers.setWeek8Incidents(tickets_db.getTicket()+',');
									}
								}
							}
						}else{
							ticketListForUsers.setNoDueDate(ticketListForUsers.getNoDueDate()+1);
							if( ticketListForUsers.getIncidentWithNoDate()!= null){
								ticketListForUsers.setIncidentWithNoDate(ticketListForUsers.getIncidentWithNoDate()+','+tickets_db.getTicket());
							}else{
								ticketListForUsers.setIncidentWithNoDate(tickets_db.getTicket()+',');
							}
							
						}
					}
					ticketListForUsers.setPreviousDate(lastWeek);
					ticketListForUsers.setWeek1Date(Week1);
					ticketListForUsers.setWeek2Date(Week2);
					ticketListForUsers.setWeek3Date(Week3);
					ticketListForUsers.setWeek4Date(Week4);
					ticketListForUsers.setWeek5Date(Week5);
					ticketListForUsers.setWeek6Date(Week6);
					ticketListForUsers.setWeek7Date(Week7);
					ticketListForUsers.setWeek8Date(Week8);
					ticketListForUsers.setResult1(tickets);
					listOfUsers.add(ticketListForUsers);
					}
				
					
			}
		
			sessionBean.setTicketResult(listOfUsers);

			result.put("data", listOfUsers);
			
			
		
		return result;
	}
	
	 @RequestMapping(value = "/updateTicketsOfAllusers" ,method=RequestMethod.POST)
	 public  @ResponseBody String  runCronJob4(HttpServletRequest request, HttpServletResponse response){
	      
	       
		 	String userList = "";
		 	String output = "";
			userList = request.getParameter("userList") != null ? request.getParameter("userList") : null;
	       
			
			List<String> usersList = Arrays.asList(userList.split("\\s*,\\s*"));
			try{
				for (String userName : usersList) {
					
					String[] user = userName.split("--");
					String userId = user[1];
					
					String sysId = getSysId(userId);
					getTicketsBysystemId(sysId,userId,"cron");
				}
		       
			}
			catch(Exception e){
				output = "false";
			}
			
	      
			output = "true";
	        return output;
				
	   }
	
	
}
