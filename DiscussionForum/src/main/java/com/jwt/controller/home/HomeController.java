package com.jwt.controller.home;

import java.io.IOException;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	private static final Logger logger = Logger
			.getLogger(HomeController.class);

	public HomeController() {
		System.out.println("EmployeeController()");
	}

	@Autowired
	private sessionBean sessionBean;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/view")
	public ModelAndView home() throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		//model.addObject("listEmployee", listEmployee);
		ModelAndView model2 = new ModelAndView();
		List<Questions> demo = employeeService.getQuestions();
		model2.addObject("questions",demo);
		model2.addObject("userDetails", sessionBean.getEmp());
		model2.setViewName("index");
		return model2;
	}
	
	
	
	
	
}
