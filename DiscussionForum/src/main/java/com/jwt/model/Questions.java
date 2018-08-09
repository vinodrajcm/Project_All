package com.jwt.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name = "QUESTION_MASTER")
public class Questions implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1606576963870031586L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="QUESTION_ID")
	private int questionId;
	
	@Column(name="QUESTION_TITLE")
	private String questionTitle;
	
	@Column(name="QUESTION_DESC", length = Integer.MAX_VALUE)
	private String questionDescription;
	
	@Column(name="TAG")
	private String tag;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="COUNT")
	private int hitCount;
	
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private Employee emp;
	
	@OneToMany(targetEntity=Answers.class, mappedBy="question",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public List<Answers> answerList;
	
	
	
	public List<Answers> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<Answers> answerList) {
		this.answerList = answerList;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionDescription() {
		return questionDescription;
	}

	public void setQuestionDescription(String questionDescription) {
		this.questionDescription = questionDescription;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	
}
