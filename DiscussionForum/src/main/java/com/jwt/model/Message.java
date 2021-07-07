package com.jwt.model;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;

@JsonAutoDetect(fieldVisibility = Visibility.NONE, setterVisibility = Visibility.ANY , getterVisibility = Visibility.NONE, isGetterVisibility = Visibility.NONE)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Message {

	@JsonProperty("TYPE")
	 private String TYPE;
	@JsonProperty("ID")
	 private String ID;
	@JsonProperty("NUMBER")
	 private String NUMBER;
	@JsonProperty("MESSAGE")
	 private String MESSAGE;
	@JsonProperty("LOG_NO")
	 private String LOG_NO;
	@JsonProperty("LOG_MSG_NO")
	 private String LOG_MSG_NO;
	@JsonProperty("MESSAGE_V1")
	 private String MESSAGE_V1;
	@JsonProperty("MESSAGE_V2")
	 private String MESSAGE_V2;
	@JsonProperty("MESSAGE_V3")
	 private String MESSAGE_V3;
	@JsonProperty("MESSAGE_V4")
	 private String MESSAGE_V4;
	@JsonProperty("PARAMETER")
	 private String PARAMETER;
	@JsonProperty("ROW")
	 private String ROW;
	@JsonProperty("FIELD")
	 private String FIELD;
	@JsonProperty("SYSTEM")
	 private String SYSTEM;


	 // Getter Methods 

	 public String getTYPE() {
	  return TYPE;
	 }

	 public String getID() {
	  return ID;
	 }

	 public String getNUMBER() {
	  return NUMBER;
	 }

	 public String getMESSAGE() {
	  return MESSAGE;
	 }

	 public String getLOG_NO() {
	  return LOG_NO;
	 }

	 public String getLOG_MSG_NO() {
	  return LOG_MSG_NO;
	 }

	 public String getMESSAGE_V1() {
	  return MESSAGE_V1;
	 }

	 public String getMESSAGE_V2() {
	  return MESSAGE_V2;
	 }

	 public String getMESSAGE_V3() {
	  return MESSAGE_V3;
	 }

	 public String getMESSAGE_V4() {
	  return MESSAGE_V4;
	 }

	 public String getPARAMETER() {
	  return PARAMETER;
	 }

	 public String getROW() {
	  return ROW;
	 }

	 public String getFIELD() {
	  return FIELD;
	 }

	 public String getSYSTEM() {
	  return SYSTEM;
	 }

	 // Setter Methods 

	 public void setTYPE(String TYPE) {
	  this.TYPE = TYPE;
	 }

	 public void setID(String ID) {
	  this.ID = ID;
	 }

	 public void setNUMBER(String NUMBER) {
	  this.NUMBER = NUMBER;
	 }

	 public void setMESSAGE(String MESSAGE) {
	  this.MESSAGE = MESSAGE;
	 }

	 public void setLOG_NO(String LOG_NO) {
	  this.LOG_NO = LOG_NO;
	 }

	 public void setLOG_MSG_NO(String LOG_MSG_NO) {
	  this.LOG_MSG_NO = LOG_MSG_NO;
	 }

	 public void setMESSAGE_V1(String MESSAGE_V1) {
	  this.MESSAGE_V1 = MESSAGE_V1;
	 }

	 public void setMESSAGE_V2(String MESSAGE_V2) {
	  this.MESSAGE_V2 = MESSAGE_V2;
	 }

	 public void setMESSAGE_V3(String MESSAGE_V3) {
	  this.MESSAGE_V3 = MESSAGE_V3;
	 }

	 public void setMESSAGE_V4(String MESSAGE_V4) {
	  this.MESSAGE_V4 = MESSAGE_V4;
	 }

	 public void setPARAMETER(String PARAMETER) {
	  this.PARAMETER = PARAMETER;
	 }

	 public void setROW(String ROW) {
	  this.ROW = ROW;
	 }

	 public void setFIELD(String FIELD) {
	  this.FIELD = FIELD;
	 }

	 public void setSYSTEM(String SYSTEM) {
	  this.SYSTEM = SYSTEM;
	 }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((FIELD == null) ? 0 : FIELD.hashCode());
		result = prime * result + ((ID == null) ? 0 : ID.hashCode());
		result = prime * result + ((LOG_MSG_NO == null) ? 0 : LOG_MSG_NO.hashCode());
		result = prime * result + ((LOG_NO == null) ? 0 : LOG_NO.hashCode());
		result = prime * result + ((MESSAGE == null) ? 0 : MESSAGE.hashCode());
		result = prime * result + ((MESSAGE_V1 == null) ? 0 : MESSAGE_V1.hashCode());
		result = prime * result + ((MESSAGE_V2 == null) ? 0 : MESSAGE_V2.hashCode());
		result = prime * result + ((MESSAGE_V3 == null) ? 0 : MESSAGE_V3.hashCode());
		result = prime * result + ((MESSAGE_V4 == null) ? 0 : MESSAGE_V4.hashCode());
		result = prime * result + ((NUMBER == null) ? 0 : NUMBER.hashCode());
		result = prime * result + ((PARAMETER == null) ? 0 : PARAMETER.hashCode());
		result = prime * result + ((ROW == null) ? 0 : ROW.hashCode());
		result = prime * result + ((SYSTEM == null) ? 0 : SYSTEM.hashCode());
		result = prime * result + ((TYPE == null) ? 0 : TYPE.hashCode());
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
		Message other = (Message) obj;
		if (FIELD == null) {
			if (other.FIELD != null)
				return false;
		} else if (!FIELD.equals(other.FIELD))
			return false;
		if (ID == null) {
			if (other.ID != null)
				return false;
		} else if (!ID.equals(other.ID))
			return false;
		if (LOG_MSG_NO == null) {
			if (other.LOG_MSG_NO != null)
				return false;
		} else if (!LOG_MSG_NO.equals(other.LOG_MSG_NO))
			return false;
		if (LOG_NO == null) {
			if (other.LOG_NO != null)
				return false;
		} else if (!LOG_NO.equals(other.LOG_NO))
			return false;
		if (MESSAGE == null) {
			if (other.MESSAGE != null)
				return false;
		} else if (!MESSAGE.equals(other.MESSAGE))
			return false;
		if (MESSAGE_V1 == null) {
			if (other.MESSAGE_V1 != null)
				return false;
		} else if (!MESSAGE_V1.equals(other.MESSAGE_V1))
			return false;
		if (MESSAGE_V2 == null) {
			if (other.MESSAGE_V2 != null)
				return false;
		} else if (!MESSAGE_V2.equals(other.MESSAGE_V2))
			return false;
		if (MESSAGE_V3 == null) {
			if (other.MESSAGE_V3 != null)
				return false;
		} else if (!MESSAGE_V3.equals(other.MESSAGE_V3))
			return false;
		if (MESSAGE_V4 == null) {
			if (other.MESSAGE_V4 != null)
				return false;
		} else if (!MESSAGE_V4.equals(other.MESSAGE_V4))
			return false;
		if (NUMBER == null) {
			if (other.NUMBER != null)
				return false;
		} else if (!NUMBER.equals(other.NUMBER))
			return false;
		if (PARAMETER == null) {
			if (other.PARAMETER != null)
				return false;
		} else if (!PARAMETER.equals(other.PARAMETER))
			return false;
		if (ROW == null) {
			if (other.ROW != null)
				return false;
		} else if (!ROW.equals(other.ROW))
			return false;
		if (SYSTEM == null) {
			if (other.SYSTEM != null)
				return false;
		} else if (!SYSTEM.equals(other.SYSTEM))
			return false;
		if (TYPE == null) {
			if (other.TYPE != null)
				return false;
		} else if (!TYPE.equals(other.TYPE))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Message [TYPE=" + TYPE + ", ID=" + ID + ", NUMBER=" + NUMBER + ", MESSAGE=" + MESSAGE + ", LOG_NO="
				+ LOG_NO + ", LOG_MSG_NO=" + LOG_MSG_NO + ", MESSAGE_V1=" + MESSAGE_V1 + ", MESSAGE_V2=" + MESSAGE_V2
				+ ", MESSAGE_V3=" + MESSAGE_V3 + ", MESSAGE_V4=" + MESSAGE_V4 + ", PARAMETER=" + PARAMETER + ", ROW="
				+ ROW + ", FIELD=" + FIELD + ", SYSTEM=" + SYSTEM + "]";
	}
	 
}
