package com.jwt.service;

import java.util.List;

import com.jwt.model.Employee;
import com.jwt.model.Questions;

public interface EmployeeService {
	
	public void addEmployee(Employee employee);
	
	public void addQuestion(Questions que);

	public List<Employee> getAllEmployees();

	public void deleteEmployee(Integer employeeId);

	public Employee getEmployee(int employeeid);

	public Employee updateEmployee(Employee employee);
	
	public Employee authUser(Employee employee);
}
