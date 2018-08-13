package com.jwt.controller.home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;
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
		
		ModelAndView model2 = new ModelAndView();
		List<Questions> listOfQuestions = employeeService.getQuestions();
		for (Questions questions : listOfQuestions) {
			String questionTags = questions.getTag();
			java.util.List<String> items = Arrays.asList(questionTags.split("\\s*,\\s*"));
			List<Tag> tagList = new ArrayList<Tag>();
			for (String string : items) {
				if(!string.isEmpty()){
						
						tagList.addAll( employeeService.getTags(string));
						
				}
			}
			questions.setTags(tagList);
		}
		List<Tag> listOftags = employeeService.getTags("");
		if(listOftags.size() >10){
			listOftags = listOftags.subList(0, 10);
		}
		model2.addObject("tagList", listOftags);
		model2.addObject("questions",listOfQuestions);
		model2.addObject("userDetails", sessionBean.getEmp());
		model2.setViewName("index");
		return model2;
	}
	
	
	
	
	
}
