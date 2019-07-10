<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>user Status</title>
<script
	src="${pageContext.request.contextPath}/resources/js/resource/jquery.min.js"></script>
</head>
<body>

	<h1>Check User is locked or not</h1>
	
  	User id:<br>
  	<input type="text" id="userId">
  	<br>
  	Choose the system to check:<br>
  	<select id="system">
  	<option value="D">Dev</option>
  	<option value="Q">Qality</option>
  	<option value="P">Production</option>
	</select>
  	<br><br>
  	
  	<div><h4 id="message"> </h4></div>
  	<button id="submit" onclick="submit()">submit</button>
 

</body>

<script>

function submit(){
	$("#message").text("system is loading please wait !!!!!");
	var userId = $('#userId').val();
	var system = $('#system').val();
	if(userId == "" || system ==""){
		alert('please fill all the fileds');
	}  
	else{
		var formData = {
		    	'userId' :userId,
		        'system': system
		    };
		
		  $.ajax({
		        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
		        url         : '../user/CheckUserLock', // the url where we want to POST
		        data        : formData, // our data object
		        //dataType    : 'json', // what type of data do we expect back from the server
		        encode          : true,
		        success: function (data) {
		        	$("#message").text("");
		        	$("#message").text(data);
		        },
		        error: function () {
		        	$(".loader").fadeOut("slow");
		        	 message.messageHandling("Something went wrong while submitting question","error","message_log");
		        }
		    });
	}
	
}

</script>
</html>