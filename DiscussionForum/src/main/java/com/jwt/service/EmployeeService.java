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
	
	public  List<Questions> getQuestions();
	
	public List<Tag> getTags(String tag);
	
	public void createTag(Tag tag);
	
	public Questions questionDetails(int questionId);
	
	public List<Answers> getAnswers(int questionId);
}
