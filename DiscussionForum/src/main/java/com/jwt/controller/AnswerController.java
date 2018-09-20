package com.jwt.controller;

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

import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.service.EmployeeService;
import com.jwt.service.session.sessionBean;

@Controller
@RequestMapping(value = "/answer")
public class AnswerController {

	private static final Logger logger = Logger
			.getLogger(AnswerController.class);
	
	public AnswerController() {
		System.out.println("answerController()"); 
	}
	

	@Autowired(required = true)
	private sessionBean sessionBean;
	
	@Autowired(required = true)
	private EmployeeService employeeService;
	

	
	@RequestMapping(value = "/postAns", method = RequestMethod.POST)
	public @ResponseBody String postAns(HttpServletRequest request,Answers answers) {
		
		
		if(sessionBean.getEmp() == null){
			return "login_Failed";
		}
		
		if(answers.getAnsId() != 0){
			Answers answer_db = new Answers();
			answer_db = employeeService.getAnswer(answers.getAnsId());
			answer_db.setDetailAns(answers.getDetailAns());
			employeeService.postAns(answer_db);
		}
		else{
			int employeeId = sessionBean.getEmp().getUserId();
			Employee emp = new Employee();
			emp.setUserId(employeeId);
			answers.setEmp(emp);
			answers.setAnsDate(new Date());
			employeeService.postAns(answers);
		}
		
		
		
		return "success";
	}
	
	
	@RequestMapping(value = "/approveAnswer", method = RequestMethod.POST)
	public @ResponseBody String  approveAnswer(HttpServletRequest request,Answers answer) {
		Questions question = new Questions();
		if(sessionBean.getEmp() == null){
			return "login_Failed";
			
		}else{
			if(answer.getQuestion().getQuestionId() != 0){
				question = employeeService.questionDetails(answer.getQuestion().getQuestionId());
				if(!question.getEmp().getLoginId().equals(sessionBean.getEmp().getLoginId())){
					return "approved_failed";
				}
				
			}
		}
		
		Answers answer_new = new Answers();
		if(answer.getAnsId() != 0){
			
			answer_new = employeeService.getAnswer(answer.getAnsId());
			if(answer.getApprove().equals("true")){
				answer_new.setApprove("true");
			}else{
				answer_new.setApprove("");
			}
			employeeService.postAns(answer_new);
			
		}
		String approve_status ="";
		if(answer_new.getQuestion().getQuestionId() != 0){
			
			List<Answers> answerList = employeeService.getAnswers(question.getQuestionId());
			if(!answerList.isEmpty()){
				for (Answers answers : answerList) {
					approve_status  = answers.getApprove();
				}
			}
			if(approve_status.equals("true")){
				question.setStatus("true");
				
			}else{
				question.setStatus("");
			}
			employeeService.addQuestion(question);
		}
		
		return "success";
		
	}
	
	@RequestMapping(value = "/editAns", method = RequestMethod.GET)
	public ModelAndView editAns(HttpServletRequest request,Answers answers,ModelAndView model) {
		String answerId = request.getParameter("answerId") == null ? "" : request.getParameter("answerId");
		int answer_id = Integer.parseInt(answerId);
		Answers ans =  employeeService.getAnswer(answer_id);
		String ansDescription = ans.getDetailAns();
		if(!ansDescription.isEmpty()){
			ansDescription = ansDescription.replace("'", "\\'");
			ansDescription = ansDescription.replaceAll("\r", "").replaceAll("\n", "");
		}
		ans.setDetailAns(ansDescription);
		model.addObject("answer", ans);
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/editAnswer");
		
		return model;
	}
}
