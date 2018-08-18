package com.jwt.controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
public class EmployeeController {

	private static final Logger logger = Logger
			.getLogger(EmployeeController.class);

	public EmployeeController() {
		System.out.println("EmployeeController()");
	}

	
	@Autowired(required = true)
	private EmployeeService employeeService;
	


	@RequestMapping(value = "/view")
	public ModelAndView listEmployee(ModelAndView model) throws IOException {
		List<Employee> listEmployee = employeeService.getAllEmployees();
		for (Employee employee : listEmployee) {
			List<Questions> demo = employee.getQuestionList();
			for (Questions questions : demo) {
				System.out.println(questions.getQuestionTitle());
			}
		}
		model.addObject("listEmployee", listEmployee);
		model.setViewName("pages/home");
		return model;
	}

	@RequestMapping(value = "/newEmployee", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Employee employee = new Employee();
		
		
		model.addObject("employee", employee);
		model.setViewName("pages/EmployeeForm");
		return model;
	}

	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute Employee employee) {
		if (employee.getUserId() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			employeeService.addEmployee(employee);
		} else {
			employeeService.updateEmployee(employee);
		}
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(HttpServletRequest request) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		employeeService.deleteEmployee(employeeId);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(employeeId);
		ModelAndView model = new ModelAndView("pages/EmployeeForm");
		model.addObject("employee", employee);

		return model;
	}
	

}