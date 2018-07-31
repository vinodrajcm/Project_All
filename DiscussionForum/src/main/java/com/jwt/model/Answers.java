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

	@Column(name="ANSWER_DETAILS")
	private String detailAns;
	
	@Column(name="ANSWERED_DATE")
	private String ansDate;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="RATING")
	private String rating;
	
	@Column(name="LIKE")
	private String like;
	
	@Column(name="DISLIKE")
	private String dislike;
	
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	public String getDislike() {
		return dislike;
	}

	public void setDislike(String dislike) {
		this.dislike = dislike;
	}

	public Questions getQuestion() {
		return question;
	}

	public void setQuestion(Questions question) {
		this.question = question;
	}
	
	
	
}
