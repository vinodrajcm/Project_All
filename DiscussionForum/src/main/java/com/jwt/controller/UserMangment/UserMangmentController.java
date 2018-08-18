package com.jwt.controller.UserMangment;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.controller.EmployeeController;
import com.jwt.model.Employee;
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
		model.addObject("listEmployee", "");
		model.setViewName("pages/userManagment/Register");
		return model;
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.POST)
	public ModelAndView register(Employee employee) throws IOException {
		if (employee.getUserId() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			employeeService.addEmployee(employee);
		} else {
			employeeService.updateEmployee(employee);
		}
		ModelAndView model = new ModelAndView();
		model .addObject("Success", "Successfully done");
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "/auth")
	public @ResponseBody String auth(HttpServletRequest request, HttpServletResponse response,Employee employee) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		String status="false";
		ModelAndView model =new ModelAndView();
		if (sessionBean.setRequest(request)) {
			// prevent session fixation by reset the sessionId
			request.getSession().invalidate();
			request.getSession(true);
		}
		
			//List<Employee> listEmployee = employeeService.getAllEmployees();
			Employee employeeDetails = employeeService.authUser(employee);
			if(employeeDetails == null){
				status = "false";
			}else{
				sessionBean.setEmp(employeeDetails);
				status = "true";
			}
			
			
			//munirvc
		
			
			return status;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		
		request.getSession().invalidate();
		
		return new ModelAndView("redirect:/userMangment/login") ;
	}
	
	
}
