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
import com.jwt.model.likeDislike;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;
import com.mysql.jdbc.StringUtils;
import com.sun.javafx.collections.MappingChange.Map;


@Controller
@RequestMapping(value = "/question")
public class QuestionController {

	private static final Logger logger = Logger
			.getLogger(QuestionController.class);
	
	public QuestionController() {
		System.out.println("askQuestionController()"); 
	}
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private sessionBean sessionBean;
	
	
	
	@RequestMapping(value = "/view",method=RequestMethod.GET)
	public ModelAndView askquestion(HttpServletRequest request, HttpServletResponse response,ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		String questionId = request.getParameter("questionId") == null ? "" : request.getParameter("questionId");
		Questions question = new Questions();
		if(!questionId.isEmpty()){
			//get the question details from data base
			int qunId = Integer.parseInt(questionId);
			question = employeeService.questionDetails(qunId);
			String questionTags = question.getTag();
			String quesDescription = question.getQuestionDescription();
			if(quesDescription != null && !quesDescription.isEmpty()){
				quesDescription = quesDescription.replace("'", "\\'");
				quesDescription = quesDescription.replaceAll("\r", "").replaceAll("\n", "");
			}
			question.setQuestionDescription(quesDescription);
			if(questionTags != null){
				java.util.List<String> items = Arrays.asList(questionTags.split("\\s*,\\s*"));
				List<Tag> tagList = new ArrayList<Tag>();
				for (String string : items) {
					if(!string.isEmpty()){
							tagList.addAll( employeeService.getTags(string));
					}
				}
				question.setTags(tagList);
			}
			
			model.addObject("questionDetails", question);
		}else{
			model.addObject("questionDetails", question);
		}
		
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/AskQuestions");
		return model;
	}
	
	@RequestMapping(value = "/allView",method=RequestMethod.GET)
	public ModelAndView allQuestion(HttpServletRequest request, HttpServletResponse response,ModelAndView model) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		String unaswered = request.getParameter("unaswered") == null ? "" : request.getParameter("unaswered");
		String tag = request.getParameter("tag") == null ? "" : request.getParameter("tag");
		
		ModelAndView model_return = new ModelAndView();
		List<Questions> listOfQuestions = employeeService.getQuestions(unaswered,tag);
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
		
		
		int employeeId;
		
		if(sessionBean.getEmp() == null){
			return "login_Failed";
			
		}
		employeeId = sessionBean.getEmp().getUserId();
		//Employee employee = employeeService.getEmployee(employeeId);
		Boolean tagCreationStatus = false;
		Employee employee = new Employee();
		employee.setUserId(employeeId);
		String questionTags = question.getTag();
		if(questionTags != ""){
			List<String> items = Arrays.asList(questionTags.split("\\s*,\\s*"));
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
		}
		question.setEmp(employee);
		if(question.getQuestionId() != 0){
			Questions question_db = new Questions();
			question_db = employeeService.questionDetails(question.getQuestionId());
			if(question_db != null){
				question_db.setQuestionTitle(question.getQuestionTitle());
				question_db.setQuestionDescription(question.getQuestionDescription());
				question_db.setTag(question.getTag());
				employeeService.addQuestion(question_db);
			}
		}else{
			question.setCratedDate(new Date());
			employeeService.addQuestion(question);
		}
		
		
		
		return "success";
		
		
	}
	
	
	
	
	
	@RequestMapping(value = "/updateLikeDisLike", method = RequestMethod.POST)
	public @ResponseBody String  updateLikeDisLike(HttpServletRequest request,likeDislike likeDislike) {
		if(sessionBean.getEmp() != null){
			if(sessionBean.getEmp().getUserId() !=0){
				
				if(likeDislike.getAnswerId() == 0){
					Questions question = new Questions();
					question = employeeService.questionDetails(likeDislike.getQuestionId());
					if(question !=null){
						int likeCount = question.getLikes();
						if(likeDislike.getLike() == 1){
							likeCount = likeCount+1;
						}else{
							likeCount = likeCount-1;
						}
						
						question.setLikes(likeCount);
						employeeService.addQuestion(question);
					}
				}else{
					Answers answer = new Answers();
					answer = employeeService.getAnswer(likeDislike.getAnswerId());
					if(answer != null){
						int likeCount = answer.getTotal_likes();
						if(likeDislike.getLike() == 1){
							likeCount = likeCount+1;
						}else{
							likeCount = likeCount-1;
						}
						answer.setTotal_likes(likeCount);
						employeeService.postAns(answer);
					}
					
				}
				likeDislike.setUserId(sessionBean.getEmp().getUserId());
				employeeService.updateLikeDisLike(likeDislike);
				
				
				
			}
		}else{
			return "PLease login";
		}
	
		return null;
		
	}
	
	
	
}
