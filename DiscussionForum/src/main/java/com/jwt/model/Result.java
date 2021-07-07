package com.jwt.model;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Result {

    private String end_date;

    private String short_description;

    private String comments_and_work_notes;

    private String state;

    private String number;

    private String start_date;

    public String getEnd_date ()
    {
        return end_date;
    }

    public void setEnd_date (String end_date)
    {
        this.end_date = end_date;
    }

    public String getShort_description ()
    {
        return short_description;
    }

    public void setShort_description (String short_description)
    {
        this.short_description = short_description;
    }

    public String getComments_and_work_notes ()
    {
        return comments_and_work_notes;
    }

    public void setComments_and_work_notes (String comments_and_work_notes)
    {
        this.comments_and_work_notes = comments_and_work_notes;
    }

    public String getState ()
    {
        return state;
    }

    public void setState (String state)
    {
        this.state = state;
    }

    public String getNumber ()
    {
        return number;
    }

    public void setNumber (String number)
    {
        this.number = number;
    }

    public String getStart_date ()
    {
        return start_date;
    }

    public void setStart_date (String start_date)
    {
        this.start_date = start_date;
    }
    
    

    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comments_and_work_notes == null) ? 0 : comments_and_work_notes.hashCode());
		result = prime * result + ((end_date == null) ? 0 : end_date.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((short_description == null) ? 0 : short_description.hashCode());
		result = prime * result + ((start_date == null) ? 0 : start_date.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Result other = (Result) obj;
		if (comments_and_work_notes == null) {
			if (other.comments_and_work_notes != null)
				return false;
		} else if (!comments_and_work_notes.equals(other.comments_and_work_notes))
			return false;
		if (end_date == null) {
			if (other.end_date != null)
				return false;
		} else if (!end_date.equals(other.end_date))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		if (short_description == null) {
			if (other.short_description != null)
				return false;
		} else if (!short_description.equals(other.short_description))
			return false;
		if (start_date == null) {
			if (other.start_date != null)
				return false;
		} else if (!start_date.equals(other.start_date))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}

	@Override
    public String toString()
    {
        return "Result [ end_date = "+end_date+", short_description = "+short_description+", comments_and_work_notes = "+comments_and_work_notes+", state = "+state+", number = "+number+", start_date = "+start_date+"]";
    }
}
