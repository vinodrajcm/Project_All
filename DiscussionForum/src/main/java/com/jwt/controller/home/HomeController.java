package com.jwt.controller.home;

import java.io.IOException;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	private static final Logger logger = Logger
			.getLogger(HomeController.class);

	public HomeController() {
		System.out.println("EmployeeController()");
	}

	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		//model.addObject("listEmployee", listEmployee);
		model.setViewName("index");
		return model;
	}
	
}
