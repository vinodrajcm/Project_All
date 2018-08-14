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
import javax.persistence.Transient;

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
	
	@Column(name="TOTAL_LIKES")
	private int total_likes;
	
	@Column(name="TOTAL_DISLIKES")
	private int total_dislikes;
	
	@Transient
	private String user_like_status;
	
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

	public int getTotal_likes() {
		return total_likes;
	}

	public void setTotal_likes(int total_likes) {
		this.total_likes = total_likes;
	}

	public int getTotal_dislikes() {
		return total_dislikes;
	}

	public void setTotal_dislikes(int total_dislikes) {
		this.total_dislikes = total_dislikes;
	}

	public String getUser_like_status() {
		return user_like_status;
	}

	public void setUser_like_status(String user_like_status) {
		this.user_like_status = user_like_status;
	}
	
	
	
}
