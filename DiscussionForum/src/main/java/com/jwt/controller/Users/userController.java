package com.jwt.controller.Users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
			que = employeeService.questionDetails(answers.getQuestion().getQuestionId());
			QuestionForAnswers.add(que);
		}
		List<Tag> tags = employeeService.getTagsForUserId(user_Id);
		//tags = user.getTagList();
		List<Questions> Questions = employeeService.getQuestionsForUserID(user_Id);
		
		int totalPoints = 0;
		int totalGold = 0;
		int totalSilver =0;
		int totalBroze = 0;
		if(!Questions.isEmpty()){
			totalPoints = totalPoints + Questions.size() * 1;
		}
		if(!QuestionForAnswers.isEmpty()){
			totalPoints = totalPoints + QuestionForAnswers.size() * 1;
		}
		List<String> Goldbadges = new ArrayList<String>();
		List<String> sliverbadges = new ArrayList<String>();
		List<String> bronzebadges = new ArrayList<String>();
 		for (Questions questions2 : Questions) {
				int totalView = questions2.getHitCount();
				if(totalView > 15){
					Goldbadges.add("Famous Question");
					totalGold = totalGold +1;
				}else if(totalView > 10){
					sliverbadges.add("Notable Question");
					totalSilver = totalSilver +1;
				}else if(totalView > 5){
					bronzebadges.add("Popular Question");
					totalBroze = totalBroze +1;
				}
				
				int Likes = questions2.getLikes();
				
				totalPoints = totalPoints + Likes * 2;
				
				if(Likes > 3){
					Goldbadges.add("Great Question");
					totalGold = totalGold +1;
				}else if(Likes > 2){
					sliverbadges.add("Good Question");
					totalSilver = totalSilver +1;
				}else if(Likes > 1){
					bronzebadges.add("Nice Question");
					totalBroze = totalBroze +1;
				}
				
		}
		
		for (Answers answers : ansList) {
			int Likes = answers.getTotal_likes();
			totalPoints = totalPoints + Likes * 2;
			
			String approve = answers.getApprove();
			
			if(approve == "true"){
				totalPoints = totalPoints + 20;
			}
			
			if(Likes > 3){
				Goldbadges.add("Great Answer");
				totalGold = totalGold +1;
			}else if(Likes > 2){
				sliverbadges.add("Good Answer");
				totalSilver = totalSilver +1;
			}else if(Likes > 1){
				bronzebadges.add("Nice Answer");
				totalBroze = totalBroze +1;
			}
		}
		
		//Questions =user.getQuestionList();
		//get all the related answers from the particular question
		model.addObject("selectedUser", user);
		model.addObject("questions", Questions);
		model.addObject("tags", tags);
		model.addObject("QuestionForAnswers", QuestionForAnswers);
		model.addObject("totalPoint", totalPoints);
		model.addObject("totalGold", totalGold);
		model.addObject("totalSliver", totalSilver);
		model.addObject("totalBronze", totalBroze);
		model.addObject("goldMedal", Goldbadges);
		model.addObject("silverMedal", sliverbadges);
		model.addObject("bronzeMedal", bronzebadges);
		model.addObject("lastLoggedIn", lastLoggedIn);
		model.addObject("userDetails", sessionBean.getEmp());
		model.setViewName("pages/userManagment/userDetails");
		return model;
	}
	

}
