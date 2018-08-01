	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/Header.jsp" />  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
		<script>
			$(document).ready(function() {
				$("#txtEditor").Editor();
			});
		</script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/editor.css">
<div class="container">
<form>
<h4 class="headerTitle">Ask Questions</h4>
<div class="row">

<div class="col-sm-1"></div>
<div class="col-sm-10">
  
	<label for="uname"><b>Title</b></label>
    <input type="text" placeholder="Enter Username" name="name" required>

    <label for="uname"><b>Body</b></label>
	<!-- textarea cols="200" rows="20" id="content" name="content"> 

	
	
    </textarea> -->
    <textarea name="content" id="txtEditor"></textarea> 
      <!-- <script type="text/javascript">
        CKEDITOR.replace( 'content' );
      </script> -->
      
       
      
      
    <button type="submit">Submit</button>
    
</div>
<div class="col-sm-1"></div>
</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
<script>
$(document).ready(function() {

    // process the form
    $('form').submit(function(event) {

        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
            'questionTitle'              : $('input[name=name]').val(),
            'questionDescription'             : $("#txtEditor").Editor("getText")
            
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : 'createQue', // the url where we want to POST
            data        : formData, // our data object
            dataType    : 'json', // what type of data do we expect back from the server
                        encode          : true
        })
            // using the done promise callback
            .done(function(data) {

                // log data to the console so we can see
                console.log(data); 

                // here we will handle errors and validation messages
            });

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

});

</script>
</html>