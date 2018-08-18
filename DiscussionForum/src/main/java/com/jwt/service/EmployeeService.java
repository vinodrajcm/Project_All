package com.jwt.service;

import java.util.List;

import com.jwt.dao.EmployeeDAO;
import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;
import com.jwt.model.likeDislike;

public interface EmployeeService {
	
	public void addEmployee(Employee employee);
	
	public List<Employee> getAllEmployees();

	public void deleteEmployee(Integer employeeId);

	public Employee getEmployee(int employeeid);

	public Employee updateEmployee(Employee employee);
	
	public Employee authUser(Employee employee);

	public List<Tag> getTagsForUserId(int userId);

	public List<Questions> getQuestionsForUserID(int UserID);

	void setEmployeeDAO(EmployeeDAO employeeDAO);
	
	public void addQuestion(Questions que);
	
	public  List<Questions> getQuestions(String unaswered, String tag);
	
	public List<Tag> getTags(String tag);
	
	public void createTag(Tag tag);
	
	public Questions questionDetails(int questionId);
	
	void updateLikeDisLike(likeDislike like);
	
	public void postAns(Answers ans);
	
	public List<Answers> getAnswers(int questionId);
	
	public Answers getAnswer(int answer_id);

}
