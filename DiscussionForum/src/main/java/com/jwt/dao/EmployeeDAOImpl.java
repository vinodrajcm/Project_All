package com.jwt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.collection.internal.PersistentBag;
import org.junit.Assert;
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
		
				if(employee.getUserId() == 0){
					sessionFactory.getCurrentSession().save(employee);
				}else{
					sessionFactory.getCurrentSession().update(employee);
				}
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

	@SuppressWarnings("unchecked")
	@Override
	public Employee getEmployee(int empid) {
		Employee employee =  (Employee) sessionFactory.getCurrentSession().get(
				Employee.class, empid);
		List<Tag> tagList =  sessionFactory.getCurrentSession().createQuery("from Tag where emp='"+empid+"'").list();
		//Assert.assertTrue(tagList instanceof PersistentBag);
		employee.setTagList(tagList);
		List<Questions> questionsList = sessionFactory.getCurrentSession().createQuery("from Questions where emp='"+empid+"'").list();
		//Assert.assertTrue(questionsList instanceof PersistentBag);
		employee.setQuestionList(questionsList);
		List<Answers> answerList = sessionFactory.getCurrentSession().createQuery("from Answers where emp='"+empid+"'").list();
		//Assert.assertTrue(answerList instanceof PersistentBag);
		employee.setAnswerList(answerList);
		return employee;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Employee authUser(Employee employee) {
		Employee emp = new Employee();
		 List<Employee> demo =  sessionFactory.getCurrentSession().createQuery("from Employee where loginId='"+employee.getLoginId()+"'").list();
					;
		 
		 if(!demo.isEmpty()){
			 emp = demo.get(0);
		 }
		return emp;
	};
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Questions> getQuestions(String unaswered, String tag){
		List<Questions> questionList = new ArrayList<Questions>();
		if(tag != null && tag != "" && unaswered.equals("true")){
			questionList =  sessionFactory.getCurrentSession().createQuery("from Questions where status=null").list();
		}else if(tag != null && tag != ""){
			questionList =  sessionFactory.getCurrentSession().createQuery("from Questions where tag like '%"+tag+"%'").list();
		}else{
			questionList =  sessionFactory.getCurrentSession().createQuery("from Questions").list();
		}
		if(!questionList.isEmpty()){
			for (Questions questions : questionList) {
				Query query = sessionFactory.getCurrentSession().createQuery("select count(ansId) from Answers where question="+questions.getQuestionId()+"");
				Long i;
				i =   (Long) query.uniqueResult();
				Integer count = (int) (long) i;
				questions.setNoAnswers(count);
			}
		}
		return questionList;
	};

	@Override
	public Employee updateEmployee(Employee employee) {
		sessionFactory.getCurrentSession().update(employee);
		return employee;
	};

	@Override
	public void addQuestion(Questions Que) {
		// TODO Auto-generated method stub
		if(Que.getQuestionId() == 0){
			sessionFactory.getCurrentSession().save(Que);
		}else{
			sessionFactory.getCurrentSession().update(Que);
		}
		
	};
	@Override
	public void postAns(Answers ans){
		// TODO Auto-generated method stub
		if(ans.getAnsId() == 0){
			sessionFactory.getCurrentSession().save(ans);
		}else{
			sessionFactory.getCurrentSession().update(ans);
		}
		//update number of answers in questions table 
		
		Query query = sessionFactory.getCurrentSession().createQuery("select count(ansId) from Answers where question="+ans.getQuestion().getQuestionId()+"");
		Long i;
		i =   (Long) query.uniqueResult();
		Integer count = (int) (long) i;
		Questions question = new Questions();
		question = questionDetails(ans.getQuestion().getQuestionId());
		question.setNoAnswers(count);
		addQuestion(question);
				
	}
	
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
		//List<Answers> demo2 = new ArrayList<Answers>();
		demo = (Questions) sessionFactory.getCurrentSession().get(Questions.class, questionId);
		/*if(!demo.equals(null)){
			//demo2 = (List<Answers>) sessionFactory.getCurrentSession().get(Answers.class, questionId);
			
			
		}
		demo.setAnswerList(demo2);*/
		return demo;
	};
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Answers> getAnswers(int questionId){
		
		return sessionFactory.getCurrentSession().createQuery("from Answers where question="+questionId+"").list();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tag> getTagsForUserId(int userId){
		List<Tag> tagList =  sessionFactory.getCurrentSession().createQuery("from Tag where emp='"+userId+"'").list();
		return tagList;
	};
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Questions> getQuestionsForUserID(int UserID){
		
		List<Questions> questionsList = sessionFactory.getCurrentSession().createQuery("from Questions where emp='"+UserID+"'").list();
		return questionsList;
		
	
	};
	
	@SuppressWarnings("unchecked")
	@Override
	public Answers getAnswer(int answer_id){
		Answers answer = (Answers) sessionFactory.getCurrentSession().get(Answers.class, answer_id);
		return answer;
		
	};

}