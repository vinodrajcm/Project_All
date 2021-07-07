package com.jwt.model;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;

@JsonAutoDetect(fieldVisibility = Visibility.NONE, setterVisibility = Visibility.ANY , getterVisibility = Visibility.NONE, isGetterVisibility = Visibility.NONE)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Status {

	 @JsonProperty("WRNG_LOGON")
	 private String wrongLock;
	
	 @JsonProperty("LOCAL_LOCK")
	 private String localLock;
	
	 @JsonProperty("GLOB_LOCK")
	 private String globalLock;
	
	 @JsonProperty("NO_USER_PW")
	 private String noUserPassword;
	
	public String getWrongLock() {
		return wrongLock;
	}
	public void setWrongLock(String wrongLock) {
		this.wrongLock = wrongLock;
	}
	public String getLocalLock() {
		return localLock;
	}
	public void setLocalLock(String localLock) {
		this.localLock = localLock;
	}
	public String getGlobalLock() {
		return globalLock;
	}
	public void setGlobalLock(String globalLock) {
		this.globalLock = globalLock;
	}
	public String getNoUserPassword() {
		return noUserPassword;
	}
	public void setNoUserPassword(String noUserPassword) {
		this.noUserPassword = noUserPassword;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((globalLock == null) ? 0 : globalLock.hashCode());
		result = prime * result + ((localLock == null) ? 0 : localLock.hashCode());
		result = prime * result + ((noUserPassword == null) ? 0 : noUserPassword.hashCode());
		result = prime * result + ((wrongLock == null) ? 0 : wrongLock.hashCode());
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
		Status other = (Status) obj;
		if (globalLock == null) {
			if (other.globalLock != null)
				return false;
		} else if (!globalLock.equals(other.globalLock))
			return false;
		if (localLock == null) {
			if (other.localLock != null)
				return false;
		} else if (!localLock.equals(other.localLock))
			return false;
		if (noUserPassword == null) {
			if (other.noUserPassword != null)
				return false;
		} else if (!noUserPassword.equals(other.noUserPassword))
			return false;
		if (wrongLock == null) {
			if (other.wrongLock != null)
				return false;
		} else if (!wrongLock.equals(other.wrongLock))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Status [wrongLock=" + wrongLock + ", localLock=" + localLock + ", globalLock=" + globalLock
				+ ", noUserPassword=" + noUserPassword + "]";
	}


	 
}
