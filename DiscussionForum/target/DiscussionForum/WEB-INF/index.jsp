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
						<a href="/?tags=usability" class="post-tag"
							title="Show questions relating to usability" rel="tag">usability</a>
						<a href="/?tags=website-design" class="post-tag"
							title="Show questions relating to website-design" rel="tag">website-design</a>
							<a href="/?tags=forms" class="post-tag"
							title="Show questions relating to forms" rel="tag">forms</a>
							<a href="/?tags=gui-design" class="post-tag "
							title="Show questions relating to gui-design" rel="tag">gui-design</a>
							<a href="/?tags=mobile" class="post-tag "
							title="Show questions relating to mobile" rel="tag">mobile</a>
							<a href="/?tags=interaction-design" class="post-tag "
							title="Show questions relating to interaction-design" rel="tag">interaction-design</a>
							<a href="/?tags=user-behavior" class="post-tag "
							title="Show questions relating to user-behavior" rel="tag">user-behavior</a>
							<a href="/?tags=navigation" class="post-tag "
							title="Show questions relating to navigation" rel="tag">navigation</a>
							<a href="/?tags=buttons" class="post-tag "
							title="Show questions relating to buttons" rel="tag">buttons</a>
							<a href="/?tags=user-expectation" class="post-tag "
							title="Show questions relating to user-expectation" rel="tag">user-expectation</a> 
							<a class="more-tags _gps" href="/tags">more&nbsp;tags</a>
					</div>
				<div class="col-sm-4"> </div>
			</div>
			<div class="row quetion-list"> 
				<div class="col-sm-12 quetion-mini-list">
				
				<c:forEach var="questions" items="${questions}">
					<div class="question-summary narrow _gps" id="question-summary-119887">
					    <div onclick="window.location.href='/questions/119887/can-a-card-have-lozenges'" class="cp">
					        <div class="votes">
					            <div class="mini-counts"><span title="1 vote">1</span></div>
					            <div>vote</div>
					        </div>
					        <div class="status answered">
					            <div class="mini-counts"><span title="1 answer">1</span></div>
					            <div>answer</div>
					        </div>
					        <div class="views">
					            <div class="mini-counts"><span title="78 views">78</span></div>
					            <div>views</div>
					        </div>
					    </div>
					    <div class="summary">				        
					        <h3><a href="../askQuestion/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">"${questions.questionTitle}"</a></h3>
					        <div class="tags t-cards">
					            <a href="/questions/tagged/cards" class="post-tag" title="" rel="tag">${questions.tag}</a> 
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
</html>