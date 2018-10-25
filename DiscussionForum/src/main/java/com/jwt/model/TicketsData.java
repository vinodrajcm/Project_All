package com.jwt.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TICKET_MASTER")
public class TicketsData {
	
	private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ID")
	private int ticketId;
	
	@Column(name="TICKET")
	private String ticket;
	
	@Column(name="UPDATE_BY")
	private String updateBY;
	
	@Column(name="PLAN_START_DATE")
	private Date planStartDate;
	
	@Column(name="PLAN_END_DATE")
	private Date planEndDate;
	
	@Column(name="NO_HOURS_WORK")
	private String noHours;
	
	@Column(name="CREATED_DATE")
	private Date createdDate;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="TICKET_CREATED_DATE")
	private String ticketCratedDate;
	
	@Column(name="COMMENTS")
	private String comments;

	public int getTicketId() {
		return ticketId;
	}

	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getUpdateBY() {
		return updateBY;
	}

	public void setUpdateBY(String updateBY) {
		this.updateBY = updateBY;
	}

	public Date getPlanStartDate() {
		return planStartDate;
	}

	public void setPlanStartDate(Date planStartDate) {
		this.planStartDate = planStartDate;
	}

	public Date getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(Date planEndDate) {
		this.planEndDate = planEndDate;
	}

	public String getNoHours() {
		return noHours;
	}

	public void setNoHours(String noHours) {
		this.noHours = noHours;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTicketCratedDate() {
		return ticketCratedDate;
	}

	public void setTicketCratedDate(String ticketCratedDate) {
		this.ticketCratedDate = ticketCratedDate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	

}
