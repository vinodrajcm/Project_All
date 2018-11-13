package com.jwt.service;

import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.jwt.dao.EmployeeDAO;
import com.jwt.model.Answers;
import com.jwt.model.Employee;
import com.jwt.model.Questions;
import com.jwt.model.SystemProperties;
import com.jwt.model.Tag;
import com.jwt.model.TicketHistory;
import com.jwt.model.TicketResult;
import com.jwt.model.TicketsData;
import com.jwt.model.likeDislike;
import com.jwt.service.session.sessionBean;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	private static final String			LOCATION	= "LDAPUtility";
	public static String				CONTEXT		= "com.sun.jndi.ldap.LdapCtxFactory";
	static String						LDAP_HOST;
	static String						LDAP_BASE;
	static String						LDAP_AUTH_TYPE;
	static String						LDAP_SEC_PRINCIPAL;
	static String						LDAP_SEC_CREDENTIAL;
	static String						LDAP_ATTRIBUTES_STRING;
	static String						LDAP_ATTRIBUTES_PROPERTY;
	static String 						LDAP_DOMAIN;
	
	
	public static void initializeProperties() {
		LDAP_BASE = "DC=kmt,DC=kmtl,DC=com";
		LDAP_AUTH_TYPE = "simple";
		LDAP_ATTRIBUTES_STRING = "givenName,sn,mail,distinguishedName,sAMAccountName";
		LDAP_ATTRIBUTES_PROPERTY = "setFirstName,setLastName,setEmail,setDistinguishedAttribute,setLoginId";
		LDAP_DOMAIN = "KMT";
	}
	
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
	
	@Override
	@Transactional
	public List<SystemProperties> getValues(String key){
		return this.employeeDAO.getValues(key);
	};
	
	@Override
	@Transactional
	public Employee getUserBasedOnEmail(String email){
		return this.employeeDAO.getUserBasedOnEmail(email);
	};
	
	@Override
	@Transactional
	public boolean getUserAuthenticated(String userId, String password){
		
		try {
			
			initializeProperties();
			
			return getUserAuthenticated(userId, password, "ldap://naldap.kmt.kmtl.com", LDAP_AUTH_TYPE);
			
		} catch (Exception e) {
			
			return false;
		}
		
	};
	
	
	@SuppressWarnings("unchecked") 
	public static boolean getUserAuthenticated(String userID, String password, String ldapHost, String ldapAuthType) {
		
		boolean objReturn = false;
		
		try {
			
			initializeProperties();
			
			Hashtable env = new Hashtable(11);
			env.put(Context.INITIAL_CONTEXT_FACTORY , CONTEXT);
			env.put(Context.PROVIDER_URL , ldapHost);
			env.put(Context.SECURITY_AUTHENTICATION , ldapAuthType);
			userID = LDAP_DOMAIN + "\\" + userID;
			env.put(Context.SECURITY_PRINCIPAL , userID);
			env.put(Context.SECURITY_CREDENTIALS , password);
			
			DirContext ctx = new InitialDirContext(env);
			
			objReturn = true;
			
			ctx.close();
			
		} catch (NamingException e) {
			//ErrorProcessor.processAppError(e ,LOCATION , "getUserAuthenticated : userID : " + userID);
			
			System.out.println("Exception" + e.toString());
			objReturn = false;
		} catch (Exception e) {
			//ErrorProcessor.processAppError(e ,LOCATION , "getUserAuthenticated : userID : " + userID);
			System.out.println("Exception" + e.toString());
			objReturn = false;
		}
		return objReturn;
	}
	@Override
	@Transactional
	public List<TicketsData> updateTicketsDataBase(List<TicketsData> ticketList,String userId){
		return this.employeeDAO.updateTicketsDataBase(ticketList,userId);
		
	};
	
	@Override
	@Transactional
	public String updateTicketPlanDate(TicketHistory ticket){
		return this.employeeDAO.updateTicketPlanDate(ticket);
	};
	
	@Override
	@Transactional
	public List<TicketsData> getTicketsBasedOnUsers(String userId){
		return this.employeeDAO.getTicketsBasedOnUsers(userId);
	};
}
