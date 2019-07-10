package com.jwt.model;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;

@JsonAutoDetect(fieldVisibility = Visibility.NONE, setterVisibility = Visibility.ANY , getterVisibility = Visibility.NONE, isGetterVisibility = Visibility.NONE)
@JsonIgnoreProperties(ignoreUnknown = true)
public class SystemOutput {

	@JsonProperty("SYSTEM")
     private String system;
     
	@JsonProperty("STATUS")
	 private Status status;

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((system == null) ? 0 : system.hashCode());
		return result;
	}

	

	@Override
	public String toString() {
		return "System [system=" + system + ", status=" + status + "]";
	}
	 
	 

	}
	
	 

