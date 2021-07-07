	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<jsp:include page="../common/Header.jsp" />  
	<link href="${pageContext.request.contextPath}/resources/css/home.css" rel=stylesheet>
</head>
<body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
		
		<script>
			$(document).ready(function() {
				$("#ansDescription").Editor();
				
			});
		</script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/editor.css">
		<style>
			.btn-group a{
					color:#ffd200;
			}
			.btn-group a:HOVER{
					color:white;
			}
			
			.text-container {
			  //display: inline-block;
			  position: relative;
			  //overflow: hidden;
			}
			.clearBtn {
			  position: absolute;
			  top: 0;
			  margin-top: 1%;
			  transition: right 0.2s;
			}
			.show {
			  right: 5px;
			}
			.close-tag{
			  font-size: 8px;
              margin-left: 5px;
			}
			.tags-textfield{
				    border: none !important;
				    box-shadow: none !important;
				    outline: 0 !important;
				    padding: 0 !important;
				    margin: 5px 3px 0;
				    background-color: transparent !important;
				    height: 25px;
				    width: 100%;
			}
			
			.queLike .fa {
    				font-size: 30px;
    				cursor: pointer;
    				user-select: none;
				}

.queLike .fa:hover {
  color: #ffd200;
}
.icon{
	color: #ffd200;
}
.queLike div{
	    width: 100%;
    text-align: center;
}
.answerDiv{
	border-bottom: 1px solid #ababab;
    padding-bottom: 5%;
    margin-bottom: 2%;
}
		</style>
<div class="container">
<form autocomplete="off">

<div id="questionId" style="display:none">${answer.question.questionId}</div>
<div id="answer_id" style="display:none">${answer.ansId}</div>
<div class="row">

<div class="col-sm-9">
	
	<div class="headerTitle">Edit Answer</div>
  	<div class="form-group">
    <textarea name="content" id="ansDescription"></textarea> 
    </div>
    <button type="submit" class="btn btn-kenna">Post your edited Answer</button>
</div>
<div class="col-sm-3">
  

	
    
</div>

</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
<script>
$(document).ready(function() {

	$(window).on('load',function(){
	    //load description for editing if exsists
		var div = '${answer.detailAns}';
		$("#ansDescription").Editor("setText",div);
		
});
    // process the form
    $('form').submit(function(event) {
		
    	var quesId= $("#questionId").text();
    	var ansId = $("#answer_id").text();
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
        	'ansId' : ansId,
            'question.questionId'   : quesId,
            'detailAns'             : $("#ansDescription").Editor("getText")
            
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : '../answer/postAns', // the url where we want to POST
            data        : formData, // our data object
            //dataType    : 'json', // what type of data do we expect back from the server
            encode          : true,
            success: function (data) {
            	console.log("demo");
                window.location.href ="../question/questionDetails?questionId="+$("#questionId").text();
            },
            error: function () {
                alert('error happened');
            }
        });
        
            

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

});



</script>
</html>