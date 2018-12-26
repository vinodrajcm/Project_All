package com.jwt.model;

public class ChangeDetail {
	
	    private Response response;

	    public Response getResponse ()
	    {
	        return response;
	    }

	    public void setResponse (Response response)
	    {
	        this.response = response;
	    }

	    
	    @Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((response == null) ? 0 : response.hashCode());
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
			ChangeDetail other = (ChangeDetail) obj;
			if (response == null) {
				if (other.response != null)
					return false;
			} else if (!response.equals(other.response))
				return false;
			return true;
		}

		@Override
	    public String toString()
	    {
	        return "ChangeDetail [response = "+response+"]";
	    }
}
