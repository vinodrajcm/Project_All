<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

    // process the form
    $.ajax({
        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
        url         : '../userMangment/auth', // the url where we want to POST
        data        : formData, // our data object
        //dataType    : 'json', // what type of data do we expect back from the server
        encode          : true,
        success: function (data) {
        	var status = data.success;
        	var obj = JSON.parse(data.employee)
        	if(status == "false"){
        		 message.messageHandling("Entered user id and password may be wrong / If new user please register.","error","message_log");
        		 return false;
        	}
        	$("#loginModel").modal('hide');
        	$('.login').empty();
        	
        	//var user_id = ${userDetails.userId};
        	
        	var logout = '<div class="btn-group">'+
        					'<a style="color:black" href="#" id="userName" class="btn" >welcome: '+obj.loginId+'</a>'+
							'<a href="../userMangment/logout" id="Logout" class="btn btn-kenna">Logout</a>'+
						'</div>';
        	
			$('.login').html(logout);
        	
        	 event.preventDefault();
           // window.location.href ="../home/view";
        },
        error: function () {
        	 message.messageHandling("Something went wrong while submitting question","error","message_log");
        }
    });
    
        

    // stop the form from submitting the normal way and refreshing the page
    event.preventDefault();
});

});

</script>
<body>

<!-- The Modal -->
<div class="modal" id="loginModel">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Login</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
		<div id="message_log"></div>
      <!-- Modal body -->
      <div class="modal-body">
     
       	<div class="form-group">
		    <label for="loginId">Login ID</label>
		    <input type="text" class="form-control" id="loginId" name="loginId" placeholder="Enter Login ID" required>
		  </div>
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
		  </div> 
		  <button class="btn btn-kenna login_button">login</button>
		  <div class="form-group">
		    <label>
		        <span class="psw">Forgot <a href="#">password?</a></span>
		    </label>
		  </div> 
		
      </div>
	
      <!-- 
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div> -->

    </div>
  </div>
</div>


	<div class="container-fluid container-fluid-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<!-- Links -->
					<h5 class="text-uppercase">User Experience</h5>

					<ul class="list-unstyled">
						<li><a class="headerText" href="#!">About Us</a></li>
						<li><a class="headerText" href="#!">Help</a></li>
						<li><a class="headerText" href="#!">Feedback</a></li>
						<li><a class="headerText" href="#!">Contact</a></li>
					</ul>

				</div>

				<div class="col-sm-4"></div>

				<div class="col-sm-4">
					<!-- Links -->
					<div class="address">
						<h5 class="text-uppercase">Company</h5>
						<h6>
							Kennametal Shared Services Pvt Ltd.<br> I Unit 3,4,5 and 6, 5th Floor I
							ITPB,<br> Navigator Building, <br> Bangalore.560066 <br> <a
								class="headerText" href="#!">www.kennametal.com</a>

						</h6>
					</div>


				</div>

			</div>


		</div>

	</div>
</body>
