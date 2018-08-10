package com.jwt.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ANSWER_MASTER")
public class Answers {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ID")
	private int ansId;

	@Column(name="ANSWER_DETAILS", length = Integer.MAX_VALUE)
	private String detailAns;
	
	@Column(name="ANSWERED_DATE")
	private String ansDate;
	
	
	@ManyToOne
	@JoinColumn(name="ANSWERED_BY")
	private Employee emp;
	
	@ManyToOne
	@JoinColumn(name="QUESTION_ID")
	private Questions question;

	public int getAnsId() {
		return ansId;
	}

	public void setAnsId(int ansId) {
		this.ansId = ansId;
	}

	public String getDetailAns() {
		return detailAns;
	}

	public void setDetailAns(String detailAns) {
		this.detailAns = detailAns;
	}

	public String getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}


	public Questions getQuestion() {
		return question;
	}

	public void setQuestion(Questions question) {
		this.question = question;
	}
	
	
	
}
