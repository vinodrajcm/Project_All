package com.jwt.dao;

import java.util.List;
import com.jwt.model.Employee;
import com.jwt.model.Questions;

public interface EmployeeDAO {

	public void addEmployee(Employee employee);
	
	public void addQuestion(Questions Que);

	public List<Employee> getAllEmployees();

	public void deleteEmployee(Integer employeeId);

	public Employee updateEmployee(Employee employee);

	public Employee getEmployee(int employeeid);
	
	public Employee authUser(Employee employee);
}
