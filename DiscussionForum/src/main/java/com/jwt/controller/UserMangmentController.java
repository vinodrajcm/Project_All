package com.jwt.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.Session;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Employee;
import com.jwt.model.SystemProperties;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
@RequestMapping(value="/userMangment")
public class UserMangmentController {

	private static final Logger logger = Logger
			.getLogger(UserMangmentController.class);
	
	public UserMangmentController() {
		System.out.println("LoginController()"); 
	}
	@Autowired(required = true)
	private EmployeeService employeeService;
	
	@Autowired(required = true)
	private sessionBean sessionBean;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
			model.addObject("listEmployee", "");
			model.setViewName("pages/userManagment/Login");
		return model;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView register(ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		
		List<SystemProperties> listOfDep = employeeService.getValues("department");
		List<SystemProperties> listOfDesig = employeeService.getValues("designation");
		
		model.addObject("listEmployee", "");
		model.addObject("designation", listOfDesig);
		model.addObject("department",listOfDep );
		model.setViewName("pages/userManagment/Register");
		return model;
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.POST)
	public  @ResponseBody Map<String , Object>  register(HttpServletRequest request, HttpServletResponse response,Employee employee) throws IOException {
		Map<String, Object> output= new HashMap<String, Object>();
		if (employee.getUserId() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			Employee employeeDetails = employeeService.authUser(employee);
			if(employeeDetails.getUserId() != 0){
				output.put("sucess", "false");
				output.put("message", "Login id is already in use please you different login Id");
				return output;
			}else{
				Employee emplyeeDe = employeeService.getUserBasedOnEmail(employee.getEmail());
				if(emplyeeDe.getUserId() != 0){
					output.put("sucess", "false");
					output.put("message", "Email already registered please use diferent email ID");
					return output;
				}
				
			}
			employee.setCreatedDate(new Date());
			employeeService.addEmployee(employee);
			
			
			output.put("sucess", "true");
			output.put("message", "User Successfully Registered you can login in now");
			return output;
		} else {
			employee.setModifiedDate(new Date());
			employeeService.updateEmployee(employee);
			
			output.put("sucess", "true");
			output.put("message", "User Successfully updated");
			return output;
		}
		
		
	}

	@RequestMapping(value = "/auth", method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> auth(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		Employee employee = new Employee();
		String userId = request.getParameter("userId") == null ? "" : request.getParameter("userId");
		String password = request.getParameter("password") == null ? "" : request.getParameter("password");
		employee.setLoginId(userId);
		employee.setPassword(password);
		Map<String, Object> output= new HashMap<String, Object>();
		String status = "false";
		ModelAndView model =new ModelAndView();
		if (sessionBean.setRequest(request)) {
			// prevent session fixation by reset the sessionId
			request.getSession().invalidate();
			request.getSession(true);
		}
		
			//List<Employee> listEmployee = employeeService.getAllEmployees();
			Employee employeeDetails = employeeService.authUser(employee);
			if(employeeDetails == null || employeeDetails.getUserId() == 0){
				status = "false";
			}else{
				sessionBean.setEmp(employeeDetails);
				employeeDetails.setLastLoggedIn(new Date());
				employeeService.updateEmployee(employeeDetails);
				status = "true";
			}
			
			String jsonStr = null;
			ObjectMapper mapper = new ObjectMapper();
			try {
	            // get Employee object as a json string
				jsonStr = mapper.writeValueAsString(employeeDetails);
	            //System.out.println(jsonStr);
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			output.put("success",status);
			
			output.put("employee", jsonStr);
			
			//munirvc
		
			
			return output;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		
		request.getSession().invalidate();
		
		return new ModelAndView("redirect:/userMangment/login") ;
	}
	
	
	@RequestMapping(value = "/ediuser")
	public ModelAndView ediuser(ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		
		List<SystemProperties> listOfDep = employeeService.getValues("department");
		List<SystemProperties> listOfDesig = employeeService.getValues("designation");
		
		model.addObject("listEmployee", "");
		model.addObject("designation", listOfDesig);
		model.addObject("department",listOfDep );
		model.setViewName("pages/userManagment/EditUser");
		return model;
	}
	
	
}
