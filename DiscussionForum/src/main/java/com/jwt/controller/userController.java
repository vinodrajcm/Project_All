package com.jwt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.SystemProperties;
import com.jwt.model.Tag;
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
	@Autowired(required = true)
	private EmployeeService employeeService;
	
	@Autowired(required = true)
	private sessionBean sessionBean;
	
	
	
	@RequestMapping(value = "/view")
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		ModelAndView model =new ModelAndView();
		
			List<Employee> listEmployee = employeeService.getAllEmployees();
			
			List<Employee> listEmployee_new = new ArrayList<Employee>();
			
			for (Employee employee2 : listEmployee) {
				Employee user = new Employee();
				user = employeeService.getEmployee(employee2.getUserId());
				int totalPoints = 0;
				List<Questions> Questions = employeeService.getQuestionsForUserID(employee2.getUserId());
				List<Answers> ansList = new ArrayList<Answers>();
				
				ansList = user.getAnswerList();
				if(!Questions.isEmpty()){
					totalPoints = totalPoints + Questions.size() * 1;
				}
				if(!ansList.isEmpty()){
					totalPoints = totalPoints + ansList.size() * 1;
				}
				for (Questions questions2 : Questions) {
					int Likes = questions2.getLikes();
					totalPoints = totalPoints + Likes * 2;
				}
				
				for (Answers answers : ansList) {
				int Likes = answers.getTotal_likes();
				totalPoints = totalPoints + Likes * 5;
				String approve = answers.getApprove();
				
				if(approve != null && approve.equals("true")){
					totalPoints = totalPoints + answers.getPoints();
				}
			}
			employee2.setPoint(String.valueOf(totalPoints));
			listEmployee_new.add(employee2);
			}
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
			
			model.addObject("listUsers", listEmployee_new);
			model.setViewName("pages/userManagment/viewUsers");
			//sessionBean.setEmp(demo);
			
		
		return model ;
	}
	
	@RequestMapping(value = "/userEdit")
	public ModelAndView userEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		ModelAndView model =new ModelAndView();
		
			List<Employee> listEmployee = employeeService.getAllEmployees();
			//Employee demo = employeeService.authUser(employee);
			model.addObject("listEmployee", listEmployee);
			model.setViewName("pages/userManagment/EditUser");
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
		
		String lastLoggedIn = "";
		Date createdDate = user.getLastLoggedIn();
		
		if(createdDate ==null){
			lastLoggedIn = "No login Records";
		}else{
			Date now = new Date();
			
			long diff = now .getTime() - createdDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffSeconds = diff / 1000 % 60;
			if(diffDays != 0){
				lastLoggedIn = lastLoggedIn+ diffDays +" days ago";
			}else if(diffHours != 0   ){
				lastLoggedIn = lastLoggedIn + diffHours+" hours ago";
			}else if(diffMinutes !=0){
				lastLoggedIn = lastLoggedIn + diffMinutes+" minutes ago";
			}else{
				lastLoggedIn = lastLoggedIn +diffSeconds+" seconds ago";
			}
		}
		
		
		//update count in question table 
		int count = user.getCount() +1;
		user.setCount(count);
		employeeService.addEmployee(user);
		//get all the tags of selected user
		List<Answers> ansList = new ArrayList<Answers>();
		List<Questions> QuestionForAnswers = new ArrayList<Questions>();
		ansList = user.getAnswerList();
		for (Answers answers : ansList) {
			Questions que = new Questions();
			Date createdDate1 = answers.getAnsDate();
			Date now = new Date();
			long diff = now .getTime() - createdDate1.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffSeconds = diff / 1000 % 60;
			if(diffDays != 0){
				answers.setNoDaysAnswered(diffDays+" days ago");
			}else if(diffDays == 0 && diffHours != 0 && diffHours <= 23  ){
				answers.setNoDaysAnswered(diffHours+" hours ago");
			}else if(diffDays == 0 && diffHours == 0 && diffMinutes <=59){
				answers.setNoDaysAnswered(diffMinutes+" minutes ago");
			}else{
				answers.setNoDaysAnswered(diffSeconds+" seconds ago");
			}
			
			que = employeeService.questionDetails(answers.getQuestion().getQuestionId());
			
			answers.setQuestion(que);
			//QuestionForAnswers.add(que);
		}
		List<Tag> tags = employeeService.getTagsForUserId(user_Id);
		//tags = user.getTagList();
		List<Questions> Questions = employeeService.getQuestionsForUserID(user_Id);
		
		for (Questions questions : Questions) {
			
			Date createdDate1 = questions.getCratedDate();
			Date now = new Date();
			long diff = now .getTime() - createdDate1.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffSeconds = diff / 1000 % 60;
			if(diffDays != 0){
				questions.setNoDaysCreated(diffDays+" days ago");
			}else if(diffDays == 0 && diffHours != 0 && diffHours <= 23  ){
				questions.setNoDaysCreated(diffHours+" hours ago");
			}else if(diffDays == 0 && diffHours == 0 && diffMinutes <=59){
				questions.setNoDaysCreated(diffMinutes+" minutes ago");
			}else{
				questions.setNoDaysCreated(diffSeconds+" seconds ago");
			}
			
	
		}
		
		int totalPoints = 0;
		int totalGold = 0;
		int totalSilver =0;
		int totalBroze = 0;
		if(!Questions.isEmpty()){
			totalPoints = totalPoints + Questions.size() * 1;
		}
		if(!ansList.isEmpty()){
			totalPoints = totalPoints + ansList.size() * 1;
		}
		List<Object> gold_Question_Goldbadges = new ArrayList<Object>();
		List<Object> notable_Question_sliverbadges = new ArrayList<Object>();
		List<Object> bronze_Question_bronzebadges = new ArrayList<Object>();
		
		List<Object> Great_Question_Goldbadges = new ArrayList<Object>();
		List<Object> Good_Question_sliverbadges = new ArrayList<Object>();
		List<Object> Nice_Question_bronzebadges = new ArrayList<Object>();
		
		List<Object> Great_Answer_Goldbadges = new ArrayList<Object>();
		List<Object> Good_Answer_sliverbadges = new ArrayList<Object>();
		List<Object> Nice_Answer_bronzebadges = new ArrayList<Object>();
		
 		for (Questions questions2 : Questions) {
				int totalView = questions2.getHitCount();
				if(totalView > 100){
					
					gold_Question_Goldbadges.add(questions2);
					totalGold = totalGold +1;
				}else if(totalView > 75){
					
					notable_Question_sliverbadges.add(questions2);
					totalSilver = totalSilver +1;
				}else if(totalView > 50){
					//bronzebadges.add("Popular Question");
					bronze_Question_bronzebadges.add(questions2);
					totalBroze = totalBroze +1;
				}
				
				int Likes = questions2.getLikes();
				
				totalPoints = totalPoints + Likes * 2;
				
				if(Likes > 20){
					Great_Question_Goldbadges.add(questions2);
					totalGold = totalGold +1;
				}else if(Likes > 15){
					Good_Question_sliverbadges.add(questions2);
					totalSilver = totalSilver +1;
				}else if(Likes > 10){
					Nice_Question_bronzebadges.add(questions2);
					totalBroze = totalBroze +1;
				}
				
		}
		
		for (Answers answers : ansList) {
			int Likes = answers.getTotal_likes();
			totalPoints = totalPoints + Likes * 5;
			
			String approve = answers.getApprove();
			
			if(approve != null &&  approve.equals("true")){
				totalPoints = totalPoints + answers.getPoints();
			}
			
			if(Likes > 15){
				Great_Answer_Goldbadges.add(answers);
				totalGold = totalGold +1;
			}else if(Likes > 10){
				Good_Answer_sliverbadges.add(answers);
				totalSilver = totalSilver +1;
			}else if(Likes > 5){
				Nice_Answer_bronzebadges.add(answers);
				totalBroze = totalBroze +1;
			}
		}
		
		//Questions =user.getQuestionList();
		//get all the related answers from the particular question
		model.addObject("selectedUser", user);
		model.addObject("questions", Questions);
		model.addObject("tags", tags);
		model.addObject("QuestionForAnswers", ansList);
		model.addObject("totalPoint", totalPoints);
		model.addObject("totalGold", totalGold);
		model.addObject("totalSliver", totalSilver);
		model.addObject("totalBronze", totalBroze);
		model.addObject("popularQuestion",gold_Question_Goldbadges);
		model.addObject("notableQuestion",notable_Question_sliverbadges);
		model.addObject("famousQuestion", bronze_Question_bronzebadges);
		model.addObject("GreatQuestion", Great_Question_Goldbadges);
		model.addObject("goodQuestion", Good_Question_sliverbadges);
		model.addObject("niceQuestion",Nice_Question_bronzebadges);
	    model.addObject("greatAns",Great_Answer_Goldbadges);
		model.addObject("goodAns",Good_Answer_sliverbadges);
		model.addObject("niceAns",Nice_Answer_bronzebadges);
		model.addObject("lastLoggedIn", lastLoggedIn);
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/userDetails");
		
		return model;
	}
	
	@RequestMapping(value = "/editUser")
	public ModelAndView editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//List<Employee> listEmployee = employeeService.getAllEmployees();
		ModelAndView model =new ModelAndView();
		
		List<SystemProperties> listOfDep = employeeService.getValues("department");
		List<SystemProperties> listOfDesig = employeeService.getValues("designation");
		
		String strUserId = request.getParameter("userId");
		int userId = Integer.parseInt(strUserId);
		
		Employee user = new Employee();
		user = employeeService.getEmployee(userId);
		model.addObject("editUser", user);
		model.addObject("designation", listOfDesig);
		model.addObject("department",listOfDep );
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/EditUser");
			//sessionBean.setEmp(demo);
			
		
		return model ;
	}
	

}
