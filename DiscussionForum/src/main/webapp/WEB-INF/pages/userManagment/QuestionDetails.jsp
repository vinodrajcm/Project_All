	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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


.icon{
	color:#479f37;
}
.icon2{
	color:#479f37;
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
<div class="headerTitle">${questionDetails.questionTitle}</div>
<div id="questionId" style="display:none">${questionDetails.questionId}</div>
<div class="row">

<div class="col-sm-9">
	<div class="row">
			<div class="col-sm-1 queLike">
			<div style="display:none" id="queLike_${questionDetails.questionId}">${questionDetails.user_like_status}</div>
					<i class="fa fa-thumbs-up like"></i>
					
					<div class="like_count">${questionDetails.likes}</div>
			</div>
			<div class="col-sm-11">${questionDetails.questionDescription}
			
			<div><a href="../question/view?questionId=${questionDetails.questionId}" id="${questionDetails.questionId}">improve this question</a></div>
				<div>Asked By ${questionDetails.emp.firstName} ${questionDetails.emp.lastName} </div>
			</div>
	</div>
	
	<div class="headerTitle"> Answers </div>
	<c:forEach var="answers" items="${ansList}">
	<div class="row">
	<div id="${answers.ansId}" style="display:none">${answers.ansId}</div>
			<div class="col-sm-1 queLike">
			<div id="ansLikeSatus_${answers.ansId}"  style="display:none" class="ansLike">${answers.user_like_status}</div>
					<i  id="ansLike_${answers.ansId}" class="fa fa-thumbs-up like"></i>
					
					<div class="like-count">${answers.total_likes}</div>
					<div id="approveSatus_${answers.ansId}"  style="display:none" class="approved">${answers.approve}</div>
					<i id="approve_${answers.ansId}" class="fa fa-check-circle approve" style="font-size:36px"></i>
			</div>
			<div class="col-sm-11 answerDiv">${answers.detailAns}
					<div><a href="../answer/editAns?answerId=${answers.ansId}" id="${answers.ansId}">improve this answer</a></div>
					<div>Answered By ${answers.emp.firstName} ${answers.emp.lastName} </div>
			</div>
		
	</div>
	</c:forEach>
	<div class="row">
	
	<div class="col-sm-12">
	<div class="headerTitle">Your Answer</div>
  	<div class="form-group">
    
    <textarea name="content" id="ansDescription"></textarea> 
    
    
  	</div>
  	</div>
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
            </ul>
	
    
</div>

</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
<script>
$(document).ready(function() {

	$(window).on('load',function(){
		
		
		var question = $('#queLike_${questionDetails.questionId}');
		var status = question[0].innerText;
			if(status == "true"){
				question.next().addClass('icon');
				//votes[i].next().style="color:black";
			}
			
		var ansList = $('.ansLike');		
		var lengthVotes = $('.ansLike').length;
		for(var i= 0;i<lengthVotes;i++){
			var text = ansList[i].innerText;
			if(text =="true"){
				var id = ansList[i].id;
				var id_new = '#'+id;
				$(id_new).next().addClass('icon');
			}
			
		}
		
		var approveAnsList = $('.approved');
		var lengthOfApprove = $('.approved').length;
		for(var i=0; i<lengthOfApprove;i++){
			var text = approveAnsList[i].innerText;
			if(text =="true"){
				var id = approveAnsList[i].id;
				var id_new = '#'+id;
				$(id_new).next().addClass('icon2');
			}
		}
		
	});
    // process the form
    $('form').submit(function(event) {
    	var quesId= $("#questionId").text();
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
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
   
    

	$(".like").click(function() {
							var main = this;
							var classes = $(main).attr('class');
							var divCount = main.nextElementSibling.innerText;
							var like = 0;
							if (classes.indexOf("icon") > -1) {
							} else {
								like = 1;
							}
							var ansId = 0;
							//submitting like or dislike for question
							if (main.id.indexOf("ansLike_") > -1) {
								ansId = main.id.replace(/ansLike_/g, '');

							}

							var questionId = $("#questionId").text();
							if (questionId == "") {
								questionId = 0;
							}
							var formData = {
								'questionId' : questionId,
								'like' : like,
								'answerId' : ansId
							};

							$.ajax({
								type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
								url : '../question/updateLikeDisLike', // the url where we want to POST
								data : formData, // our data object
								//dataType    : 'json', // what type of data do we expect back from the server
								encode : true,
								success : function(data) {
									//alert("success")
									if (classes.indexOf("icon") > -1) {
											divCount = parseInt(divCount) - 1;
											main.nextElementSibling.innerText = divCount;
											$(main).removeClass("icon");
										} else {
											$(main).addClass("icon");
											divCount = parseInt(divCount) + 1;
											main.nextElementSibling.innerText = divCount;
										}
								},
								error : function() {
									// alert('error happened');
								}
							});

							// stop the form from submitting the normal way and refreshing the page
							event.preventDefault();

						});

						$(".approve").click(function() {
							var main = this;
							var classes = $(main).attr('class');
							var status = "false";
							if (classes.indexOf("icon2") > -1) {

							} else {
								status = "true";
							}

							var ansId = 0;
							//submitting like or dislike for question
							if (main.id.indexOf("approve_") > -1) {
								ansId = main.id.replace(/approve_/g, '');

							}

							var questionId = $("#questionId").text();
							if (questionId == "") {
								questionId = 0;
							}
							var formData = {
								'question.questionId' : questionId,
								'ansId' : ansId,
								'approve' : status
							};

							$.ajax({
								type : 'POST', // define the type of HTTP verb we want to use (POST for our form)
								url : '../answer/approveAnswer', // the url where we want to POST
								data : formData, // our data object
								//dataType    : 'json', // what type of data do we expect back from the server
								encode : true,
								success : function(data) {
									//alert("success")
									if (classes.indexOf("icon2") > -1) {
											$(main).removeClass("icon2");
			
										} else {
											$(main).addClass("icon2");
											status = "true";
										}
								},
								error : function() {
									// alert('error happened');
								}
							});

							// stop the form from submitting the normal way and refreshing the page
							event.preventDefault();

						});

					});
</script>
</html>