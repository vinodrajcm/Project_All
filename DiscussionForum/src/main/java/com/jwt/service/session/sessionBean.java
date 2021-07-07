package com.jwt.service.session;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jwt.model.Employee;
import com.jwt.model.TicketResult;

@Component(value = "sessionBean")
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class sessionBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext applicationContext;

	private List<TicketResult> ticketResult;
	
	private Employee emp;

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	
	
	public List<TicketResult> getTicketResult() {
		return ticketResult;
	}

	public void setTicketResult(List<TicketResult> ticketResult) {
		this.ticketResult = ticketResult;
	}

	/**
     * Sets the request. required to get SpringApplicationContext to reload various Beans.
     * 
     * @param request the new request
     * @return <code>true</code> if sessionBean object is created using serialisation. <br>
     *         <code>false</code> if created with browser request
     */
    public boolean setRequest(HttpServletRequest request) {
	boolean isSessionSerialized = false;
	synchronized (sessionBean.class) {
	    if (applicationContext == null) {
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
	    }
	}
	    return isSessionSerialized;
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((emp == null) ? 0 : emp.hashCode());
		result = prime * result + ((ticketResult == null) ? 0 : ticketResult.hashCode());
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
		sessionBean other = (sessionBean) obj;
		if (emp == null) {
			if (other.emp != null)
				return false;
		} else if (!emp.equals(other.emp))
			return false;
		if (ticketResult == null) {
			if (other.ticketResult != null)
				return false;
		} else if (!ticketResult.equals(other.ticketResult))
			return false;
		return true;
	}

	
	
	
}
