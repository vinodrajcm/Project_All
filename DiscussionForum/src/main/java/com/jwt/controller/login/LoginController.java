package com.jwt.controller.login;

import java.io.IOException;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.controller.EmployeeController;
import com.jwt.model.Employee;

@Controller
public class LoginController {

	private static final Logger logger = Logger
			.getLogger(LoginController.class);
	
	public LoginController() {
		System.out.println("LoginController()");
	}
	
	@RequestMapping(value = "/")
	public ModelAndView login(ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		model.addObject("listEmployee", "");
		model.setViewName("pages/userManagment/Login");
		return model;
	}

}
