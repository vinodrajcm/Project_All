<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../common/Header.jsp" />
<script>
//process the form
$(document).ready(function() {
$('.login_button').click(function(event) {
	 
	var userId = $('input[name=loginId]').val();
	var password = $('input[name=password]').val();
	if(userId == "" && password ==""){
		message.messageHandling("Please enter your user id and password","error","message_log_modal");
		return false;
	}
	
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
        url         : '../userMangment/auth', // the url where we want to POST
        data        : formData, // our data object
        //dataType    : 'json', // what type of data do we expect back from the server
        encode          : true,
        success: function (data) {
        	var status = data.success;
        	$(".loader").fadeOut("slow");
        	var obj = $.parseJSON(data.employee);
        	if(status == "false"){
        		 message.messageHandling("Entered user id and password may be wrong / If new user please register.","error","message_log");
        		 return false;
        	}
        	//$("#loginModel").modal('hide');
        	$('.login').empty();
        	
        	//var user_id = ${userDetails.userId};
        	
        	var logout = '<div class="btn-group">'+
					        '<a style="color:black" href="#" id="userName" class="btn" >welcome: '+obj.loginId+'</a>'+
							'<a href="../userMangment/logout" id="Logout" class="btn btn-kenna">Logout</a>'+
						'</div>';
        	
			$('.login').html(logout);
        	
            window.location.href ="../home/view";
        },
        error: function () {
        	$(".loader").fadeOut("slow");
        	 message.messageHandling("Something went wrong while submitting question","error","message_log");
        }
    });
    
        

    // stop the form from submitting the normal way and refreshing the page
    event.preventDefault();
});

$("#forgotPassword").on("click",function(){
	var userId = $('input[name=loginId]').val();
	if(userId == ""){
		message.messageHandling("Please enter your user id","error","message_log");
		return false;
	}
	var formData = {
	    	'userId' : userId
	    };
	$(".loader").fadeIn();
	
	// process the form
    $.ajax({
        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
        url         : '../userMangment/forgotPassword', // the url where we want to POST
        data        : formData, // our data object
        //dataType    : 'json', // what type of data do we expect back from the server
        encode          : true,
        success: function (data) {
        	var status = data.success;
        	$(".loader").fadeOut();
        	if(status == "false"){
        		 message.messageHandling("Entered user id  may be wrong","error","message_log");
        		 return false;
        	}else{
        		message.messageHandling("Your password sent to your mail id Please check","success","message_log");
        	}
        },
        error: function () {
        	$(".loader").fadeOut("slow");
        	 message.messageHandling("Something went wrong while submitting question","error","message_log");
        }
    });
	
 	// stop the form from submitting the normal way and refreshing the page
    event.preventDefault();
	
});



});

</script>

</head>
<body>

	<div class="container">
		
			<div class="headerTitle">Login Form</div>
			<div id="message_log"></div>
			<div class="row">
				
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
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
					<div class="form-group">
						<label> <span class="psw">Forgot <a href="#" id="forgotPassword">password?</a></span>
						</label>
					</div>

				</div>
				<div class="col-sm-4"></div>
			</div>
		
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>