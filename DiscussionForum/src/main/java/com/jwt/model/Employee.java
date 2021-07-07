package com.jwt.model;

import java.io.Serializable;
import java.util.Date;
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

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.google.gson.annotations.Expose;


@Entity
@Table(name = "USER_MASTER")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
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
	private Date createdDate;
	
	@Column(name="CREATED_BY")
	private String createdBy;
		
	@Column(name="ACTIVATION_FLAG")
	private String activationFlag;
	
	@Column(name="MODIFIED_BY")
	private String modifiedBy;
	
	@Column(name="MODIFIED_DATE")
	private Date modifiedDate;
	
	@Column(name="MANAGER")
	private String manager;
	
	@Column(name="USER_ROLE")
	private String userRole;
	
	@Column(name="VIEW_COUNT")
	private int count;
	
	private String point;
	
	@Column(name="LAST_LOGGED_IN")
	private Date lastLoggedIn;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

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
	@JsonIgnore
	public List<Questions> questionList;
	
	@OneToMany(targetEntity=Answers.class, mappedBy="emp",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JsonIgnore
	public List<Answers> answerList;
	
	@OneToMany(targetEntity=Tag.class, mappedBy="emp",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JsonIgnore
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


	public String getActivationFlag() {
		return activationFlag;
	}

	public void setActivationFlag(String activationFlag) {
		this.activationFlag = activationFlag;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Date getLastLoggedIn() {
		return lastLoggedIn;
	}

	public void setLastLoggedIn(Date lastLoggedIn) {
		this.lastLoggedIn = lastLoggedIn;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	

	@Override
	public String toString() {
		return "Employee [userId=" + userId + ", loginId=" + loginId + ", firstName=" + firstName + ", lastName="
				+ lastName + ", designation=" + designation + ", team=" + team + ", email=" + email + ", password="
				+ password + ", createdDate=" + createdDate + ", createdBy=" + createdBy + ", activationFlag="
				+ activationFlag + ", modifiedBy=" + modifiedBy + ", modifiedDate=" + modifiedDate + ", manager="
				+ manager + ", userRole=" + userRole + "]";
	}

		
}