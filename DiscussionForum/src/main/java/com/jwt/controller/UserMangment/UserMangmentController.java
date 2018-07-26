package com.jwt.controller.UserMangment;

import java.io.IOException;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.controller.EmployeeController;
import com.jwt.model.Employee;

@Controller
public class UserMangmentController {

	private static final Logger logger = Logger
			.getLogger(UserMangmentController.class);
	
	public UserMangmentController() {
		System.out.println("LoginController()");
	}
	
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

}
