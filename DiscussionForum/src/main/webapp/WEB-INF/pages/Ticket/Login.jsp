<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ticket Update</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/resources/img/icon.gif">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/DiscussionForum.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reward.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/general.js"></script>
<script>
//process the form
$(document).ready(function() {
$('.login_button').click(function(event) {
	 
    // get the form data
    // there are many ways to get this data using jQuery (you can use the class or id also)
    var formData = {
    	'userId' :$('input[name=loginId]').val(),
        'password': $('input[name=password]').val()
    };
    $(".loader").fadeIn();
    // process the form
    $.ajax({
        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
        url         : '../ticketUpdate/TicketAuth', // the url where we want to POST
        data        : formData, // our data object
        //dataType    : 'json', // what type of data do we expect back from the server
        encode          : true,
        success: function (data) {
        	$(".loader").fadeOut("slow");
        	if(data == "false"){
        		message.messageHandling("Entered user id and password may be wrong / If new user please register.","error","message_log");
       			 return false;
        	}
        	
        	
        	window.location.href ="../ticketUpdate/getTickets";
        	        	
        
        		 
        	
        
        },
        error: function () {
        	$(".loader").fadeOut("slow");
        	 message.messageHandling("Something went wrong while submitting question","error","message_log");
        }
    });
    
        
});

});

</script>

</head>
<body>
<div class="loader" style="display:none"></div>
	<div class="container">
		
			<div class="headerTitle">Login Form</div>
			<div id="message_log">${result}</div>
			<div class="row">
				
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
				<b>*** Use Windows credentials to login ***</br></b>
					<div class="form-group">
						<label for="loginId">Login ID</label> <input type="text"
							class="form-control" id="login_Id" name="loginId"
							placeholder="Enter Login ID">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" name="password" id="password_"
							placeholder="Enter Password">
					</div>
					<button type="submit" class="btn btn-kenna login_button" style="width: 100%">Submit</button>
					

				</div>
				<div class="col-sm-4"></div>
			</div>
		
	</div>
	
</body>
</html>