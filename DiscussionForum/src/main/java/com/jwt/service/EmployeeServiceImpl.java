package com.jwt.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.Tag;
import com.jwt.model.likeDislike;
import com.jwt.service.session.sessionBean;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Autowired
	private sessionBean sessionBean;

	@Override
	@Transactional
	public void addEmployee(Employee employee) {
		employeeDAO.addEmployee(employee);
	}

	@Override
	@Transactional
	public List<Employee> getAllEmployees() {
		return employeeDAO.getAllEmployees();
	}

	@Override
	@Transactional
	public void deleteEmployee(Integer employeeId) {
		employeeDAO.deleteEmployee(employeeId);
	}

	@Override
	@Transactional
	public Employee getEmployee(int empid) {
		return employeeDAO.getEmployee(empid);
	}

	@Override
	@Transactional
	public Employee updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return employeeDAO.updateEmployee(employee);
	}
	
	@Override
	@Transactional
	public Employee authUser(Employee employee) {
		return employeeDAO.authUser(employee);
	}
	
	@Override
	@Transactional
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	
	

	@Override
	@Transactional
	public List<Tag> getTagsForUserId(int userId){
		return this.employeeDAO.getTagsForUserId(userId);
	};

	@Override
	@Transactional
	public List<Questions> getQuestionsForUserID(int UserID){
		return this.employeeDAO.getQuestionsForUserID(UserID);
	};
	
	@Override
	@Transactional
	public void updateLikeDisLike(likeDislike like){
		this.employeeDAO.updateLikeDisLike(like);
	};
	
	@Override
	@Transactional
	public  List<Questions> getQuestions(String keywordForSearch){
		return employeeDAO.getQuestions(keywordForSearch);
	};
	
	@Override
	@Transactional
	public void addQuestion(Questions que) {
		// TODO Auto-generated method stub
		this.employeeDAO.addQuestion(que);
	};
	
	@Override
	@Transactional
	public List<Tag> getTags(String tag){
		
		return employeeDAO.getTags(tag);
	};
	
	@Override
	@Transactional
	public void createTag(Tag tag){
		
		Employee emp = new Employee();
		emp.setUserId(sessionBean.getEmp().getUserId());
		tag.setCreatedBY(sessionBean.getEmp().getFirstName());
		Date dNow = new Date();
		tag.setCreatedDate(dNow);
		tag.setEmp(emp);
		this.employeeDAO.createTag(tag);
	};

	@Override
	@Transactional
	public Questions questionDetails(int questionId){
		return this.employeeDAO.questionDetails(questionId);
	};
	
	@Override
	@Transactional
	public void postAns(Answers ans){
		// TODO Auto-generated method stub
				this.employeeDAO.postAns(ans);
	};
	
	@Override
	@Transactional
	public List<Answers> getAnswers(int questionId){
		return this.employeeDAO.getAnswers(questionId);
	};
	
	@Override
	@Transactional
	public Answers getAnswer(int answer_id){
		return this.employeeDAO.getAnswer(answer_id);
	};
	
	
}
