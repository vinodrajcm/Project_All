	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		</style>
<div class="container">
<form autocomplete="off">
<div class="headerTitle">${questionDetails.questionTitle}</div>
<div id="questionId" style="display:none">${questionDetails.questionId}</div>
<div class="row">

<div class="col-sm-9">
	<div class="row">
			<div class="col-sm-1">points</div>
			<div class="col-sm-11">${questionDetails.questionDescription}
				<div>Asked By ${questionDetails.emp.firstName} ${questionDetails.emp.lastName} </div>
			</div>
	</div>
	<div class="headerTitle"> Answers </div>
	<c:forEach var="answers" items="${questionDetails.answerList}">
	<div class="row">
			<div class="col-sm-1">points</div>
			<div class="col-sm-11">${answers.detailAns}
					<div>Answered By ${answers.emp.firstName} ${answers.emp.lastName} </div>
			</div>
	</div>
	</c:forEach>
  	<div class="form-group">
    <label for="ansDescription" class="headerTitle">Your Answer</label>
    <textarea name="content" id="ansDescription"></textarea> 
  	</div>
    
    <button type="submit" class="btn btn-kenna">Post your Answer</button>
</div>
<div class="col-sm-3">
  
  <div class="eoq-hot-q-desc"> Hot Questions</div>
			<ul>
            <li>
            	<div class="favicon favicon-photo" title="Photography Stack Exchange"></div>
                <a href="https://photo.stackexchange.com/questions/100367/why-are-1-3-stop-apertures-uneven-numbers-apart" class="js-gps-track" data-gps-track="site.switch({ item_type:8, target_site:61 }); posts_hot_network.click({ item_type:2, location:8 })">
                    Why are 1/3 stop apertures uneven numbers apart?
                </a>

            </li>
            <li>
            	<div class="favicon favicon-photo" title="Photography Stack Exchange"></div>
                <a href="https://scifi.stackexchange.com/questions/192033/were-the-maquis-who-returned-on-voyager-punished-for-having-been-maquis" class="js-gps-track" data-gps-track="site.switch({ item_type:8, target_site:186 }); posts_hot_network.click({ item_type:2, location:8 })">
                    Were the Maquis who returned on Voyager punished for having been Maquis?
                </a>

            </li>
            <li>
            	<div class="favicon favicon-photo" title="Photography Stack Exchange"></div>
                <a href="https://academia.stackexchange.com/questions/114404/how-to-query-gender-in-a-multiple-choice-poll-survey" class="js-gps-track" data-gps-track="site.switch({ item_type:8, target_site:415 }); posts_hot_network.click({ item_type:2, location:8 })">
                    How to query gender in a multiple-choice poll/survey?
                </a>

            </li>
            </ul>
	
    
</div>

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
            'questionTitle'              : $('input[name=questionTitle]').val(),
            'questionDescription'             : $("#questionDescription").Editor("getText"),
            'tag':$('#tag-values').val()
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : '../askQuestion/createQue', // the url where we want to POST
            data        : formData, // our data object
            //dataType    : 'json', // what type of data do we expect back from the server
            encode          : true,
            success: function (data) {
            	console.log("demo");
                window.location.href ="../home/view";
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