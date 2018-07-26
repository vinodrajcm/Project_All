package com.jwt.controller.UserMangment;

import java.io.IOException;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.controller.EmployeeController;
import com.jwt.model.Employee;
import com.jwt.service.EmployeeService;

@Controller
public class UserMangmentController {

	private static final Logger logger = Logger
			.getLogger(UserMangmentController.class);
	
	public UserMangmentController() {
		System.out.println("LoginController()"); 
		
	}
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView model) throws IOException {
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
		if (employee.getId() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			employeeService.addEmployee(employee);
		} else {
			employeeService.updateEmployee(employee);
		}
		System.out.println("successful");
		return null;
	}

	@RequestMapping(value = "/auth")
	public ModelAndView auth(Employee employee) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();

		Employee demo = employeeService.authUser(employee);
		//model.setViewName("pages/userManagment/Login");
		if(demo == null ){
			System.out.println("un success");
		}else{
			
			System.out.println(demo.getId());
		}
		return null ;
	}
}
