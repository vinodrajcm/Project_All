package com.jwt.controller.Users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jwt.controller.UserMangment.UserMangmentController;
import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;


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
			/*int i=0;
			List<List<Employee>> listEmployeeNew = new ArrayList<List<Employee>>();
			List<Employee> temp =  new ArrayList<Employee>();
			for (Employee employee : listEmployee) {
				if(i<4 ){
					temp.add(employee);
					i++;
				}else{
					listEmployeeNew.add(temp);
					temp = new ArrayList<Employee>();
					i=0;
				}
			}
			if(i!=0){
				
				int rem = 4-i;
				for(int j =0;j<rem;j++){
					Employee tempNew =  new Employee();
					temp.add(tempNew);
				}
				listEmployeeNew.add(temp);
			}*/
			
			model.addObject("userDetails", sessionBean.getEmp());
			//Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
			//String json = gson.toJson(listEmployee);
			//System.out.println(json);
			ObjectMapper mapper = new ObjectMapper();
			//Object to JSON in String
			String jsonInString = mapper.writeValueAsString(listEmployee);
			
			System.out.println(jsonInString);
			model.addObject("listUsersJson", jsonInString);
			
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
	
	@RequestMapping(value = "/userDetails",method=RequestMethod.GET)
	public ModelAndView userDetails(HttpServletRequest request, HttpServletResponse response,ModelAndView model) throws IOException {
		String userId = request.getParameter("userId");
		int user_Id = Integer.parseInt(userId);
	
		//get the user Details from the data base 
		Employee user = new Employee();
		user = employeeService.getEmployee(user_Id);
		//update count in question table 
		int count = user.getCount() +1;
		user.setCount(count);
		employeeService.addEmployee(user);
		//get all the related answers from the particular question 
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/userDetails");
		return model;
	}
	

}
