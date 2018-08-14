package com.jwt.service;

import java.util.List;

import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;

public interface EmployeeService {
	
	public void addEmployee(Employee employee);
	
	public void addQuestion(Questions que);
	
	public void postAns(Answers ans);

	public List<Employee> getAllEmployees();

	public void deleteEmployee(Integer employeeId);

	public Employee getEmployee(int employeeid);

	public Employee updateEmployee(Employee employee);
	
	public Employee authUser(Employee employee);
	
	public  List<Questions> getQuestions(String unaswered, String tag);
	
	public List<Tag> getTags(String tag);
	
	public void createTag(Tag tag);
	
	public Questions questionDetails(int questionId);
	
	public List<Answers> getAnswers(int questionId);

	public List<Tag> getTagsForUserId(int userId);

	public List<Questions> getQuestionsForUserID(int UserID);

	public Answers getAnswer(int answer_id);
}
