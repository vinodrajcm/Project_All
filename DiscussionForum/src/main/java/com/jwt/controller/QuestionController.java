package com.jwt.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jwt.controller.UserMangment.UserMangmentController;
import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;
import com.sun.javafx.collections.MappingChange.Map;


@Controller
@RequestMapping(value = "/askQuestion")
public class QuestionController {

	private static final Logger logger = Logger
			.getLogger(UserMangmentController.class);
	
	public QuestionController() {
		System.out.println("askQuestionController()"); 
	}
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private sessionBean sessionBean;
	
	@RequestMapping(value = "/view")
	public ModelAndView askquestion(ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/AskQuestions");
		return model;
	}
	
	@RequestMapping(value = "/allView")
	public ModelAndView allQuestion(ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		ModelAndView model_return = new ModelAndView();
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
		model_return.addObject("tagList", listOftags);
		model_return.addObject("questions",listOfQuestions);
		model_return.addObject("userDetails", sessionBean.getEmp());
		model_return.setViewName("pages/userManagment/AllQuestions");
		return model_return;
	}
	
	@RequestMapping(value = "/questionDetails",method=RequestMethod.GET)
	public ModelAndView questionDetails(HttpServletRequest request, HttpServletResponse response,ModelAndView model) throws IOException {
		String questionId = request.getParameter("questionId");
		int qunId = Integer.parseInt(questionId);
	
		//get the question details from data base
		Questions question = employeeService.questionDetails(qunId);
		//update count in question table 
		int count = question.getHitCount()+1;
		question.setHitCount(count);
		employeeService.addQuestion(question);
		//get all the related answers from the particular question 
		List<Answers> ansList = employeeService.getAnswers(qunId);
		model.addObject("questionDetails", question);
		model.addObject("ansList", ansList);
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/QuestionDetails");
		return model;
	}
	
	@RequestMapping(value = "/createQue", method = RequestMethod.POST)
	public @ResponseBody String createQue(HttpServletRequest request,Questions question) {
		
		int employeeId = sessionBean.getEmp().getUserId();
		//Employee employee = employeeService.getEmployee(employeeId);
		Boolean tagCreationStatus = false;
		Employee employee = new Employee();
		employee.setUserId(employeeId);
		Questions qu = new Questions();
		qu.setQuestionTitle(question.getQuestionTitle());
		qu.setQuestionDescription(question.getQuestionDescription());
		qu.setTag(question.getTag());
		qu.setCratedDate(new Date());
		qu.setHitCount(0);
		qu.setLikes(0);
		qu.setDislikes(0);
		qu.setNoAnswers(0);
		String questionTags = question.getTag();
		java.util.List<String> items = Arrays.asList(questionTags.split("\\s*,\\s*"));
		for (String string : items) {
			if(!string.isEmpty()){
				
				//List<Tag> tagList = new ArrayList<Tag>();
				List<Tag> tagList = new ArrayList<Tag>();
				tagList = employeeService.getTags(string);
				
				
				if(!tagList.isEmpty()){
					tagCreationStatus=false;
				}else{
					tagCreationStatus=true;
					Tag tag = new Tag();
					tag.setTagName(string);
					employeeService.createTag(tag);
					
					
				}
			}
			
		}
		qu.setEmp(employee);
		
		employeeService.addQuestion(qu);
		/*RedirectView view = new RedirectView();
		view.setContextRelative(true);
		view.setUrl("/home/view");
		HashMap<String, String> demo = new HashMap<String , String>();
		*/
		//demo.put("Success", "true");
		return "success";
		//return new ModelAndView("redirect:/home");
		/*ModelAndView model= new ModelAndView();
		
		model.setViewName("index");
		return model;*/
		
	}
	
	
	@RequestMapping(value = "/postAns", method = RequestMethod.POST)
	public @ResponseBody String postAns(HttpServletRequest request,Answers answers) {
		int employeeId = sessionBean.getEmp().getUserId();
		Employee emp = new Employee();
		emp.setUserId(employeeId);
		answers.setEmp(emp);
		employeeService.postAns(answers);
		
		return "success";
	}
	
	
}
