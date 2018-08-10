package com.jwt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.controller.UserMangment.UserMangmentController;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
@RequestMapping(value="/tags")
public class TagsController {
	
	private static final Logger logger = Logger
			.getLogger(TagsController.class);
	
	public TagsController() {
		System.out.println("tagsController()"); 
	}
	

	@Autowired
	private sessionBean sessionBean;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/view")
	public ModelAndView view(ModelAndView model) throws IOException {
		
		List<Tag> tagList = new ArrayList<Tag>();
		tagList = employeeService.getTags("");
		model.addObject("tags", tagList);
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/TagsView");
		return model;
	}
	
	@RequestMapping(value = "/saveTag", method = RequestMethod.POST)
	public @ResponseBody String createQue(Tag tag) {
		
		 List<Tag> tagList = new ArrayList<Tag>();
		String tagName = tag.getTagName();
		 tagList = employeeService.getTags(tagName);
		
		
		if(tagList.isEmpty()){
			
			employeeService.createTag(tag); 
			return "tag created";
		}else{
			return "already exsits";
		}
	}
}
