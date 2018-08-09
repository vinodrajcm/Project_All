package com.jwt.controller.Users;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.controller.UserMangment.UserMangmentController;
import com.jwt.model.Employee;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;
import com.google.gson.Gson;


@Controller
@RequestMapping(value = "/user")
public class userController {
	
	private static final Logger logger = Logger
			.getLogger(UserMangmentController.class);
	
	public userController() {
		System.out.println("userController()"); 
		
	}
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private sessionBean sessionBean;
	
	
	@RequestMapping(value = "/view")
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		ModelAndView model =new ModelAndView();
		
		
			List<Employee> listEmployee = employeeService.getAllEmployees();
			model.addObject("userDetails", sessionBean.getEmp());
			Gson gson = new Gson();
			//Here object is converted to json string
			String json = gson.toJson(listEmployee);
			model.addObject("listUsers", listEmployee);
			model.setViewName("pages/userManagment/viewUsers");
			//sessionBean.setEmp(demo);
			
		
		return model ;
	}
	
	@RequestMapping(value = "/userList")
	public ModelAndView auth(HttpServletRequest request, HttpServletResponse response,Employee employee) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		ModelAndView model =new ModelAndView();
		
		
			List<Employee> listEmployee = employeeService.getAllEmployees();
			//Employee demo = employeeService.authUser(employee);
			model.addObject("listEmployee", listEmployee);
			model.setViewName("pages/home");
			//sessionBean.setEmp(demo);
			
		
		return model ;
	}

}
