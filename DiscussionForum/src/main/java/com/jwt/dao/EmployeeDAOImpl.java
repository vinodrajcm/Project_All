package com.jwt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEmployee(Employee employee) {
		sessionFactory.getCurrentSession().saveOrUpdate(employee);

	}

	@SuppressWarnings("unchecked")
	public List<Employee> getAllEmployees() {

		return sessionFactory.getCurrentSession().createQuery("from Employee")
				.list();
	}

	@Override
	public void deleteEmployee(Integer employeeId) {
		Employee employee = (Employee) sessionFactory.getCurrentSession().load(
				Employee.class, employeeId);
		if (null != employee) {
			this.sessionFactory.getCurrentSession().delete(employee);
		}

	}

	public Employee getEmployee(int empid) {
		return (Employee) sessionFactory.getCurrentSession().get(
				Employee.class, empid);
	}
	
	public Employee authUser(Employee employee) {
		Employee emp = new Employee();
		 List<Employee> demo =  sessionFactory.getCurrentSession().createQuery("from Employee")
					.list();
		 
		 if(!demo.isEmpty()){
			 emp = demo.get(0);
		 }
		return emp;
	};
	
	public List<Questions> getQuestions(){
		
		List<Questions> demo =  sessionFactory.getCurrentSession().createQuery("from Questions")
				.list();
		return demo;
	};

	@Override
	public Employee updateEmployee(Employee employee) {
		sessionFactory.getCurrentSession().update(employee);
		return employee;
	};

	@Override
	public void addQuestion(Questions Que) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(Que);
	};
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tag> getTags(String tag){
		List<Tag> demo = new ArrayList<Tag>();
		if(tag ==""){
			demo =  sessionFactory.getCurrentSession().createQuery("from Tag")
					.list();
		}else{
			demo =  sessionFactory.getCurrentSession().createQuery("from Tag where tagName='"+tag+"'")
					.list();
		}
		
		return demo;
	};
	
	@Override
	public void createTag(Tag tag){
		// TODO Auto-generated method stub
				sessionFactory.getCurrentSession().saveOrUpdate(tag);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Questions questionDetails(int questionId){
		Questions demo = new Questions();
		List<Answers> demo2 = new ArrayList<Answers>();
		demo = (Questions) sessionFactory.getCurrentSession().get(Questions.class, questionId);
		if(!demo.equals(null)){
			demo2 = (List<Answers>) sessionFactory.getCurrentSession().get(Answers.class, questionId);
		}
		demo.setAnswerList(demo2);
		return demo;
	};

}