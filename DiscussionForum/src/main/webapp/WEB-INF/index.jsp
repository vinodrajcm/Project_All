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
	
	<div class="row hiw">
			<div class="col-sm-3 about-df">
				User Experience Discussion Forum is a question and answer site for user experience researchers and experts.
			</div>
			<div class="col-sm-3 question"> 
				<span class="desc"><b>Here's how it works:</b> </span>
				<div> Anybody can ask a question </div>
			</div>
			<div class="col-sm-3 answer">
				<div> Anybody can answer </div>
			</div>
			<div class="col-sm-3 best-answer">
				<div> The best answers are voted up and rise to the top </div>
			</div>
	</div>
	<div class="row eoq">
		<div class="col-sm-9">
			<div class="eoq-desc"> <h1>Explore Our Questions</h1> </div>
			<div class="row"> 
				<div class="col-sm-8 explore-tags">
				
				<c:forEach var="tagList" items="${tagList}">
						<a href="../question/allView?tag=${tagList.tagName}" class="post-tag"
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
					        <h3><a href="../question/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">"${questions.questionTitle}"</a></h3>
					        <div class="tags t-cards">
					            <c:forEach var="tags" items="${questions.tags}">
					                   <a href="../question/allView?tag=${tags.tagName}" class="post-tag" title="" rel="tag">${tags.tagName}</a> 
					            </c:forEach>
					        </div>
					        <div class="started">
					            <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">answered <span title="2018-07-30 07:42:05Z" class="relativetime">6 hours ago</span></a>
					            <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a> <span class="reputation-score" title="reputation score " dir="ltr">6,896</span>
					        </div>
					    </div>
					</div>
					
					</c:forEach>
					
				</div>
			</div>
		</div>
		<div class="col-sm-3 hq">
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
		if(count.indexOf('0')>-1){
			status[i].style="color:black";
			//votes[i].next().style="color:black";
		}else{
			status[i].style="color:#4ab471";
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