<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<jsp:include page="../common/Header.jsp" />  
<div class="container">
<div class="headerTitle">Register Form</div>
<div id="message_log"></div>
<form id="myForm" name="register" autocomplete="off">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-4">
 <div class="form-group">
    <label for="firstName">First Name</label>
   <div data-tip="Enter only Alphanumeric with out space">
    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name">
 </div>
    
 
  </div>
  <div class="form-group">
    <label for="lastName">Last Name</label>
    <div data-tip="Enter only Alphanumeric with out space">
    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name">
    </div>
  </div>
  <div class="form-group">
    <label for="loginId">Login ID</label>
    <div data-tip="Enter only Alphanumeric with out space">
    <input type="text" class="form-control" id="login_Id" name="loginId" placeholder="Enter Login ID">
    </div>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <div data-tip="Enter [7 to 15 characters which contain at least one numeric digit and a special character]">
    <input type="password" class="form-control" name="password" id="password_id" placeholder="Enter Password">
    </div>
  </div>
  
</div>
<div class="col-sm-4">

<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <div data-tip="Enter vaild emial id">
    <input type="email" class="form-control" id="exampleInputEmail1"  name="email" aria-describedby="emailHelp" placeholder="Enter email">
    </div>
  </div>
  <div class="form-group">
    <label for="team">Select Department</label>
    <select class="form-control" name="department" id="team">
    <option value="">Please select</option>
     <c:forEach var="department" items="${department}">
      <option value="${department.name}">${department.name}</option>
      </c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label for="designation">Select Designation</label>
    <select class="form-control" name="designation" id="designation">
    <option value="">Please select</option>
     <c:forEach var="designation" items="${designation}">
      <option value="${designation.name}">${designation.name}</option>
      </c:forEach>
    </select>
  </div>
  
  <div class="form-group">
    
    <button type="submit" class="btn btn-kenna" style="width: 100%;margin-top: 2em;">Submit</button>
  </div> 
 </div> 
</form>   
  
</div>
</div>
</div>
<script>

// process the form

$(document).ready(function() {
	 $('form').submit(function(event) {
		   var firstName = document.forms["register"]["firstName"].value;
		    if (firstName == "") {
		    	 message.messageHandling("Please enter First Name","error","message_log");
		        return false;
		    }else{
		    	var letterNumber = /^[0-9a-zA-Z]+$/;
			   	 if(!(firstName.match(letterNumber))){
			   		 message.messageHandling("Please enter only alphanumeric in first Name","error","message_log");
			   	   return false;
			   	  }
		    }
		    
		    var lastName = document.forms["register"]["lastName"].value;
		    if (lastName == "") {
		    	 message.messageHandling("Please enter Last Name","error","message_log");
		        return false;
		    }else{
		    	var letterNumber = /^[0-9a-zA-Z]+$/;
		   	 	if(!(lastName.match(letterNumber))) 
		   	  	{
		   		 message.messageHandling("Please enter only alphanumeric in Last Name","error","message_log");
		   	  	 return false;
		   	  	}
		    }
		    //Input Password and Submit [7 to 15 characters which contain at least one numeric digit and a special character]
		    var password = document.forms["register"]["password"].value;
		    if (password == "") {
		    	 message.messageHandling("Please enter Password","error","message_log");
		        return false;
		    }else{
		    	var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
		   	 	if(!(password.match(paswd)))
		   	 	 {
		   		 message.messageHandling("Enter [7 to 15 characters which contain at least one numeric digit and a special character]","error","message_log");
		   	   return false;
		   	  	}
		    }
		    
		    var email = document.forms["register"]["email"].value;
		    if (email == "") {
		    	 message.messageHandling("Please enter mail","error","message_log");
		        return false;
		    }else{
		    	 var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		    	  if(!(email.match(mailformat))) 
		    	   {
		    		 message.messageHandling("Enter Valid Mail","error","message_log");
		    	   return false;
		    	   }
		    }
		    
		    var email = document.forms["register"]["email"].value;
		    if (email == "") {
		    	 message.messageHandling("Please enter mail","error","message_log");
		        return false;
		    }else{
		    	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   	 if(!(email.match(mailformat))) 
		   	  {
		   		 message.messageHandling("Enter Valid Mail","error","message_log");
		   	   return false;
		   	  }
		    }
		    
		    var department = document.forms["register"]["department"].value;
		    if (department == "") {
		    	 message.messageHandling("Please select deparment","error","message_log");
		        return false;
		    }
		    
		    var designation = document.forms["register"]["designation"].value;
		    if (designation == "") {
		    	 message.messageHandling("Please select designation","error","message_log");
		        return false;
		    } 
		    
			//var myForm = $('form').serialize();
				$(".loader").fadeIn();
		    // process the form
		    $.ajax({
		        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
		        url         : '../userMangment/registerNewUser', // the url where we want to POST
		        data        : $('#myForm').serialize(), // our data object
		        //dataType    : 'json', // what type of data do we expect back from the server
		        encode          : true,
		        success: function (data) {
		        	var status = data.sucess;
		        	$(".loader").fadeOut("slow");
		        	if(status == "false"){
		       		 message.messageHandling(data.message,"error","message_log");
		       		 return false;
		       	}
		        	message.messageHandling(data.message,"success","message_log");
		        	document.getElementById("myForm").reset();
		        },
		        error: function () {
		        	$(".loader").fadeOut("slow");
		        	 message.messageHandling("Something went wrong while Signing Up Please contact to developer","error","message_log");
		        }
		    });
		    
		        

		    // stop the form from submitting the normal way and refreshing the page
		    event.preventDefault();
	 });

}); 

</script>

<jsp:include page="../common/footer.jsp" />  
</body>
</html>