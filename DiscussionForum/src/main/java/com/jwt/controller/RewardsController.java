package com.jwt.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Questions;
import com.jwt.model.Tag;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
@RequestMapping(value = "/reward")
public class RewardsController {

	
	private static final Logger logger = Logger
			.getLogger(AnswerController.class);
	
	public RewardsController() {
		System.out.println("RewardsController()"); 
	}
	

	@Autowired
	private sessionBean sessionBean;
	
	@Autowired(required = true)
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/view")
	public ModelAndView view(ModelAndView model) throws IOException {
		
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/common/RewardDetails");
		return model;
	}
	
	@RequestMapping(value = "/tour")
	public ModelAndView help(ModelAndView model) throws IOException {
		
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/common/Help");
		return model;
	}
	
	
}
