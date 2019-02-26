<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ticket Update</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/ico"
	href="${pageContext.request.contextPath}/resources/img/icon.gif">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/DiscussionForum.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet">	
<script
	src="${pageContext.request.contextPath}/resources/js/resource/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/resource/bootstrap.min.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/js/general.js"></script>
<style>
.loginDiv{
	margin-top:10%;
	padding-bottom: 3%;
    background-color: #f3c809;
    -webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
body{
	//background-color: #DDDDDD;
}
</style>
</head>
<body>
	<div class="loader" style="display: none"></div>
	<div class="container">
		<marquee behavior="scroll" direction="left" style="color: red;">New Changes --- You can login by pressing enter key after filling up userId and password</marquee>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 loginDiv">
			<div class="headerTitle" style="text-align: center;border-bottom: 1px solid #343a40;">Sign in</div>
			<div id="message_log">${result}</div>
				<div style="width: 100%;text-align: center;font-weight: 700;margin-bottom: 5%;margin-top: 2%;">*** Use Windows credentials to login ***</br></div>
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
				<button type="submit" class="btn btn-kenna login_button"
					style="width: 100%;margin-top: 5%;">Submit</button>


			</div>
			<div class="col-sm-4"></div>
		</div>

	</div>

</body>

<script>
//process the form
$(document).ready(function() {
	
function formSubmit(){
	var loginID = $('input[name=loginId]').val();
	var password = $('input[name=password]').val();
	//check empty values entered
	if( loginID == "" || password =="" ){
		message.messageHandling("Please enter user id and password","error","message_log");
		return false;
	}
    // get the form data
    // there are many ways to get this data using jQuery (you can use the class or id also)
    var formData = {
    	'userId' :loginID,
        'password': password
    };
    
    $(".loader").fadeIn();//loading symbol
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
        	//once user got autheticated we are redirecting it to get tickets based on logged in user id
        	window.location.href ="../ticketUpdate/getTickets";
        },
        error: function () {
        	$(".loader").fadeOut("slow");
        	 message.messageHandling("Something went wrong while submitting question","error","message_log");
        }
    });
}	
	
$('.login_button').click(function(event) {
	formSubmit();
});

$('body').keypress(function (e) {
	 var key = e.which;
	 if(key == 13)  // the enter key code
	  {
		 formSubmit();
	  }
	});

});

</script>

</html>