<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
</head>

<body>
<jsp:include page="../WEB-INF/pages/common/Header.jsp" />  
<div class="container">
	
	<div class="row">
	<div class="col-sm-1">
	</div>
		<div class="col-sm-9">
		  <div class="row hiw">
			<div class="col-md-4 about-df">
				User Experience Discussion Forum is a question and answer site for user experience researchers and experts.
			</div>
			<div class="col-md-3 question"> 
				<span class="desc"><b>Here's how it works:</b> </span>
				<div> Anybody can ask a question </div>
			</div>
			<div class="col-md-2 answer">
				<div> Anybody can answer</div>
			</div>
			<div class="col-md-3 best-answer">
				<div> The best answers are voted</div>
			</div>
			</div>	
		</div>	
		<div class="col-sm-2">
	</div>
	</div>
	<div class="row eoq">
		<div class="col-sm-9">
			<div class="eoq-desc"> <h1>Explore Our Questions</h1> </div>
			<div class="row"> 
				<div class="col-sm-8 explore-tags">
				
				<c:forEach var="tagList" items="${tagList}">
						<a href="../question/allView?keywordForSearch=tag:${tagList.tagName}" class="post-tag"
							title="Show questions relating to usability" rel="tag">${tagList.tagName}</a>
				</c:forEach>		
							<a class="more-tags _gps" href="../tags/view">more&nbsp;tags</a>
					</div>
				<div class="col-sm-4"> </div>
			</div>
			<div class="row quetion-list"> 
				<div class="col-sm-12 quetion-mini-list">
				
				<c:forEach var="questions" items="${questions}">
					<div class="question-summary narrow _gps" id="question-summary-119887">
					    <div onclick="window.location.href='../question/questionDetails?questionId=${questions.questionId}'" class="cp" style="font-weight: 600;">
					       	
					        <div class="votes">
					            <div class="mini-counts"><span title=" ${questions.likes} likes for the question">${questions.likes}</span></div>
					            <div>Likes</div>
					        </div>
					         
					            <div class="approved" style="display:none">${questions.status}</div>
					            
					        
					        <div class="status">
					            <div class="mini-counts"><span title=" ${questions.noAnswers} answers">${questions.noAnswers}</span></div>
					            <div>answers</div>
					        </div>
					        <div class="views">
					            <div class="mini-counts"><span title=" ${questions.hitCount} views">${questions.hitCount}</span></div>
					            <div>views</div>
					        </div>
					    </div>
					    <div class="summary">				        
					        <h3><a href="../question/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a></h3>
					        <div class="tags t-cards">
					            <c:forEach var="tags" items="${questions.tags}">
					                   <a href="../question/allView?keywordForSearch=tag:${tags.tagName}" class="post-tag" title="" rel="tag">${tags.tagName}</a> 
					            </c:forEach>
					        </div>
					        <div class="started">
					            <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">asked <span title="${questions.cratedDate}"class="relativetime">${questions.noDaysCreated}</span></a>
					            <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a> <span class="reputation-score" title="reputation score " dir="ltr">6,896</span>
					        </div>
					    </div>
					</div>
					
					</c:forEach>
					
				</div>
			</div>
		</div>
		<div class="col-sm-3 hq">
			<div class="eoq-hot-q-desc">Most Viewed Questions</div>
			
			<c:forEach var="questions" items="${topViewQuestion}">
            	<li class="fa fa-question-circle" title="Question_Icon"></li>
                <a class="eoq-ans" href="../question/questionDetails?questionId=${questions.questionId}" >
                  ${questions.questionTitle}
                </a>
			</c:forEach>
           
		</div>
	</div>
	
</div>
<jsp:include page="../WEB-INF/pages/common/footer.jsp" /> 
</body>
<script>

$(document).ready(function() {
$(window).on('load',function(){
	var votes = $('.votes');
	var lengthVotes = $('.votes').length;
	for(var i= 0;i<lengthVotes;i++){
		var count = votes[i].innerText;
		if(count.indexOf('0')>-1){
			votes[i].style="color:black";
			//votes[i].next().style="color:black";
		}
	}
	
	var status = $('.status');
	var lengthstatus = $('.status').length;
	for(var i= 0;i<lengthstatus;i++){
		var count = status[i].innerText;
		var approve_status = status[i].previousElementSibling.innerText;
		if(approve_status == "true"){
			status[i].style="color: white;background-color: rgb(71, 209, 71);border-radius: 1em";
		}else{
			if(count.indexOf('0')>-1){
				status[i].style="color:black";
				//votes[i].next().style="color:black";
			}else{
				status[i].style="color:#4ab471";
			}
		}
		
	}
	
	var views = $('.views');
	var lengthviews = $('.views').length;
	for(var i= 0;i<lengthviews;i++){
		var count = views[i].innerText;
		if(count.indexOf('0')>-1){
			views[i].style="color:black";
			//votes[i].next().style="color:black";
		}
	}
	
});

});


</script>
</html>