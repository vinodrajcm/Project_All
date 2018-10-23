package com.jwt.model;

import java.util.Date;
import java.util.List;

public class TicketResult {
	
	String userId ;
	
	int previousWeek;
	
	String previousDate;
	
	String previousWeekIncidents;
	
	String incidentWithNoDate;
	
	String week1Incidents;
	
	String week2Incidents;
	
	String week3Incidents;
	
	String week4Incidents;
	
	String week5Incidents;
	
	String week6Incidents;
	
	String week7Incidents;
	
	String week8Incidents;
	
	int week1;
	
	int noDueDate;
	
	String week1Date;
	
	int week2;
	
	String week2Date;
	
	int week3;
	
	String week3Date;
	
	int week4;
	
	String week4Date;
	
	int week5;
	
	String week5Date;
	
	int week6;
	
	String week6Date;
	
	int week7;
	
	String week7Date;
	
	int week8;
	
	String week8Date;
	
	Messages message;
	
	List<Tickets> result;
	
	List<TicketsData> result1;
	
	

	public String getPreviousDate() {
		return previousDate;
	}

	public void setPreviousDate(String previousDate) {
		this.previousDate = previousDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPreviousWeek() {
		return previousWeek;
	}

	public void setPreviousWeek(int previousWeek) {
		this.previousWeek = previousWeek;
	}

	public int getWeek1() {
		return week1;
	}

	public void setWeek1(int week1) {
		this.week1 = week1;
	}

	public String getWeek1Date() {
		return week1Date;
	}

	public void setWeek1Date(String week1Date) {
		this.week1Date = week1Date;
	}

	public int getWeek2() {
		return week2;
	}

	public void setWeek2(int week2) {
		this.week2 = week2;
	}

	public String getWeek2Date() {
		return week2Date;
	}

	public void setWeek2Date(String week2Date) {
		this.week2Date = week2Date;
	}

	public int getWeek3() {
		return week3;
	}

	public void setWeek3(int week3) {
		this.week3 = week3;
	}

	public String getWeek3Date() {
		return week3Date;
	}

	public void setWeek3Date(String week3Date) {
		this.week3Date = week3Date;
	}

	public int getWeek4() {
		return week4;
	}

	public void setWeek4(int week4) {
		this.week4 = week4;
	}

	public String getWeek4Date() {
		return week4Date;
	}

	public void setWeek4Date(String week4Date) {
		this.week4Date = week4Date;
	}

	public int getWeek5() {
		return week5;
	}

	public void setWeek5(int week5) {
		this.week5 = week5;
	}

	public String getWeek5Date() {
		return week5Date;
	}

	public void setWeek5Date(String week5Date) {
		this.week5Date = week5Date;
	}

	public int getWeek6() {
		return week6;
	}

	public void setWeek6(int week6) {
		this.week6 = week6;
	}

	public String getWeek6Date() {
		return week6Date;
	}

	public void setWeek6Date(String week6Date) {
		this.week6Date = week6Date;
	}

	public int getWeek7() {
		return week7;
	}

	public void setWeek7(int week7) {
		this.week7 = week7;
	}

	public String getWeek7Date() {
		return week7Date;
	}

	public void setWeek7Date(String week7Date) {
		this.week7Date = week7Date;
	}

	public int getWeek8() {
		return week8;
	}

	public void setWeek8(int week8) {
		this.week8 = week8;
	}

	public String getWeek8Date() {
		return week8Date;
	}

	public void setWeek8Date(String week8Date) {
		this.week8Date = week8Date;
	}

	public Messages getMessage() {
		return message;
	}

	public void setMessage(Messages message) {
		this.message = message;
	}

	public List<Tickets> getResult() {
		return result;
	}

	public void setResult(List<Tickets> result) {
		this.result = result;
	}

	public List<TicketsData> getResult1() {
		return result1;
	}

	public String getPreviousWeekIncidents() {
		return previousWeekIncidents;
	}

	public void setPreviousWeekIncidents(String previousWeekIncidents) {
		this.previousWeekIncidents = previousWeekIncidents;
	}

	public String getIncidentWithNoDate() {
		return incidentWithNoDate;
	}

	public void setIncidentWithNoDate(String incidentWithNoDate) {
		this.incidentWithNoDate = incidentWithNoDate;
	}

	public String getWeek1Incidents() {
		return week1Incidents;
	}

	public void setWeek1Incidents(String week1Incidents) {
		this.week1Incidents = week1Incidents;
	}

	public String getWeek2Incidents() {
		return week2Incidents;
	}

	public void setWeek2Incidents(String week2Incidents) {
		this.week2Incidents = week2Incidents;
	}

	public String getWeek3Incidents() {
		return week3Incidents;
	}

	public void setWeek3Incidents(String week3Incidents) {
		this.week3Incidents = week3Incidents;
	}

	public String getWeek4Incidents() {
		return week4Incidents;
	}

	public void setWeek4Incidents(String week4Incidents) {
		this.week4Incidents = week4Incidents;
	}

	public String getWeek5Incidents() {
		return week5Incidents;
	}

	public void setWeek5Incidents(String week5Incidents) {
		this.week5Incidents = week5Incidents;
	}

	public String getWeek6Incidents() {
		return week6Incidents;
	}

	public void setWeek6Incidents(String week6Incidents) {
		this.week6Incidents = week6Incidents;
	}

	public String getWeek7Incidents() {
		return week7Incidents;
	}

	public void setWeek7Incidents(String week7Incidents) {
		this.week7Incidents = week7Incidents;
	}

	public String getWeek8Incidents() {
		return week8Incidents;
	}

	public void setWeek8Incidents(String week8Incidents) {
		this.week8Incidents = week8Incidents;
	}

	public int getNoDueDate() {
		return noDueDate;
	}

	public void setNoDueDate(int noDueDate) {
		this.noDueDate = noDueDate;
	}

	public void setResult1(List<TicketsData> result1) {
		this.result1 = result1;
	}

	

	

}
