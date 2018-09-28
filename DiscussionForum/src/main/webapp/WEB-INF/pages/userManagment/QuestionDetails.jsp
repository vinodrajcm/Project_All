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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/editor.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/queDetails.css">
<div class="container">
<form autocomplete="off">
<div class="headerTitle">${questionDetails.questionTitle}</div>
<div class="alert_placeholder" id="alert_placeholder"></div>
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
			<div class="tags t-cards margin-top-2per">
			<c:forEach var="tags" items="${questionDetails.tags}">
				<a href="../question/allView?keywordForSearch=tag:${tags.tagName}" class="post-tag" title="" rel="tag">${tags.tagName}</a>
			</c:forEach>
			</div>
			
			<div class="margin-top-2per"><a class="" href="../question/view?questionId=${questionDetails.questionId}" id="${questionDetails.questionId}">improve this question</a></div>
			
			<div class="started float-right">
			<a href="#" class="started-link">Asked <span title="${questionDetails.cratedDate}" class="relativetime">
					${questionDetails.noDaysCreated}</span></a>
					<div id="createdUserId" class="displayNone"> ${questionDetails.emp.userId} </div>
					 <a href="../user/userDetails?userId=${questionDetails.emp.userId}">${questionDetails.emp.firstName}</a>
													<!-- <span class="reputation-score" title="reputation score "
														dir="ltr">6,896</span> -->
			</div>	
			</div>
			
	</div>
	
	<div class="headerTitle"> Answers </div>
	<c:forEach var="answers" items="${ansList}">
	<div class="row" id="${answers.ansId}" >
	<div style="display:none">${answers.ansId}</div>
			<div class="col-sm-1 queLike">
			<div id="ansLikeSatus_${answers.ansId}"  style="display:none" class="ansLike">${answers.user_like_status}</div>
					<i  id="ansLike_${answers.ansId}" class="fa fa-thumbs-up like"></i>
					
					<div class="like-count"  title="likes">${answers.total_likes}</div>
					<div id="approveSatus_${answers.ansId}"  style="display:none" class="approved">${answers.approve}</div>
					<i id="approve_${answers.ansId}" class="fa fa-check-circle approve"></i>
					<div class=""  title="Points">${answers.points}</div>
			</div>
			
		     <div class="col-sm-11 answerDiv">${answers.detailAns}
					<div class="margin-top-2per"><a href="../answer/editAns?answerId=${answers.ansId}" id="${answers.ansId}">improve this answer</a></div>
						<div class="started float-right">
						<a href="#" class="started-link">Answered <span title="${answers.ansDate}" class="relativetime">
								${answers.noDaysAnswered}</span></a> <a href="#">by ${answers.emp.firstName} ${answers.emp.lastName} </a>
													<!-- <span class="reputation-score" title="reputation score "
														dir="ltr">6,896</span> -->
					</div>
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
<div class="col-sm-3 hq">
  		<div>
  			<div>Asked : ${questionDetails.noDaysCreated}</div>
  			<div>Asked By: ${questionDetails.emp.firstName}</div>
  		</div>
  		<div class="eoq-hot-q-desc title_withoutborder">Tags Related Questions</div>
				<c:forEach var="questions" items="${tagsRelatedQues}">
					
					<a class="fa fa-question-circle eoq-ans"
						href="../question/questionDetails?questionId=${questions.questionId}">
						${questions.questionTitle} </a>
				</c:forEach>
				
				
  		<div class="eoq-hot-q-desc title_withoutborder">Most Viewed Questions</div>
				<c:forEach var="questions" items="${topViewQuestion}">
					<a class="fa fa-question-circle eoq-ans"
						href="../question/questionDetails?questionId=${questions.questionId}">
						${questions.questionTitle} </a>
				</c:forEach>
	
    
</div>

</div>
</form>
</div>

<!-- The Modal -->
<div class="modal" id="approveModel">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Approve</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
		<div id="message_log"></div>
      <!-- Modal body -->
      <div class="modal-body">
     
       	<div class="form-group">
       		<div id=""></div>
       		<input type="text" id="answer_approveId" style="display: none;" value="">
		    <label for="points">Number of Points to give for this Answer:</label>
 				 <select class="form-control" id="points">
  					  <option>5</option>
  					  <option>10</option>
  					  <option>15</option>
   					  <option>20</option>
  				</select>
		  </div>
		  
		  <button class="btn btn-kenna approve_button">Approve</button>
      </div>
	
      <!-- 
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div> -->

    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
<script src="${pageContext.request.contextPath}/resources/js/Question.js"></script>
<script>
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
	
	$("img").css("width","100%");
	
});

</script>
</html>