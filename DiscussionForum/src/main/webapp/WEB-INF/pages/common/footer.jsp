<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<script>
//process the form
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
        	//console.log("demo");
        	if(data == "true"){
        		 message.messageHandling("Entered user id and password may be wrong / If new user please register.","error");
        	}
        	 event.preventDefault();
           // window.location.href ="../home/view";
        },
        error: function () {
        	 message.messageHandling("Something went wrong while submitting question","error","");
        }
    });
    
        

    // stop the form from submitting the normal way and refreshing the page
    event.preventDefault();
});

</script>
<body>




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
