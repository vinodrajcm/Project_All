package com.jwt.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "USER_MASTER")
public class Employee implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="USER_ID")
	private int userId;

	@Column(name="LOGIN_ID",unique = true, nullable = false)
	private String loginId;
	
	@Column(name="FIRST_NAME",nullable = false)
	private String firstName ;
	
	@Column(name="LAST_NAME")
	private String lastName;
	
	@Column(name="DESGINATION")
	private String designation;
	
	@Column(name="TEAM") 
	private String team;
	
	@Column(name="EMAIL",unique = true, nullable = false) 
	private String email;

	@Column(name="PASSWORD") 
	private String password;
	
	@Column(name="CREATED_DATE")
	private String createdDate;
	
	@Column(name="CREATED_BY")
	private String createdBy;
		
	@Column(name="ACTIVATION_FLAG")
	private String activationFlag;
	
	@Column(name="MODIFIED_BY")
	private String modifiedBy;
	
	@Column(name="MODIFIED_DATE")
	private String modifiedDate;
	
	@Column(name="MANAGER")
	private String manager;
	
	@Column(name="USER_ROLE")
	private String userRole;
	
	
	
	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	@OneToMany(targetEntity=Questions.class, mappedBy="emp",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public List<Questions> questionList;
	
	
	@OneToMany(targetEntity=Answers.class, mappedBy="emp",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public List<Answers> answerList;
	
	@OneToMany(targetEntity=Tag.class, mappedBy="emp",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public List<Tag> tagList;
	
	
	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	public List<Answers> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<Answers> answerList) {
		this.answerList = answerList;
	}

	public List<Questions> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Questions> questionList) {
		this.questionList = questionList;
	}

	

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getActivationFlag() {
		return activationFlag;
	}

	public void setActivationFlag(String activationFlag) {
		this.activationFlag = activationFlag;
	}

		
}