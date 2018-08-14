package com.jwt.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Transient;

import org.hibernate.annotations.Type;
import org.junit.Ignore;

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
	
	@Column(name="LIKES")
	private int likes;
	
	@Column(name="DISLIKE")
	private int dislikes;
	
	@Column(name="NUM_ANSWERS")
	private int noAnswers;
	
	@Column(name="CREATED_DATE")
	private Date cratedDate;
	
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private Employee emp;
	
	@OneToMany(targetEntity=Answers.class, mappedBy="question",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public List<Answers> answerList;
	
	@Transient
	private List<Tag> tags;
	
	@Transient
	private String user_like_status;
	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

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

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}

	public int getNoAnswers() {
		return noAnswers;
	}

	public void setNoAnswers(int noAnswers) {
		this.noAnswers = noAnswers;
	}

	public Date getCratedDate() {
		return cratedDate;
	}

	public void setCratedDate(Date cratedDate) {
		this.cratedDate = cratedDate;
	}

	public String getUser_like_status() {
		return user_like_status;
	}

	public void setUser_like_status(String user_like_status) {
		this.user_like_status = user_like_status;
	}


	
	
}
