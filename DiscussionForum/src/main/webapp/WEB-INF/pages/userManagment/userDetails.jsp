<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<jsp:include page="../common/Header.jsp" /> 
<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css"> -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">	
	
</head>
<style>
.img-profile{
	text-align:center;
	    margin-left: 26%;
}

.img{
	border: 1px solid;
    padding: 10px;
}
.userDetails{
	padding-left: 5%;
}
.ans-ques{
	text-align: center;
    margin-bottom:20px;
}
.text{
	 margin-left: 10%;
	 font-size: 13px;
}

.explore-tags{
	width: 40%;
    background-color: #f1f1f1;
    margin-left: 2%;
    float: left;
    margin-bottom: 2%;
    /* font-size: 25px; */
    padding: 5px;
}
.explore-tags:hover{
	color:white !important;
    background-color: #0000009c ;
    
}
a:hover{
color:black;
text-decoration:none;
}

.nav-tabs{
	float:right;
	border-bottom: none;
    font-weight: 400;
}
td{
    border-bottom: 1px solid #eff0f1;
    border-top: none !important;
}
.active_1{
color:black;
margin-right:12px;
margin-left:12px;
}


ul{ list-style-type: none; }

.NoQues{
    float: right;
    font-size: 12px;
    /* text-align: center; */
    margin-top: 2%;
}
.question-hyperlink{
	font-size: 13px;
    font-weight: 400;
    width: 79%;
    margin-bottom: 0;
}
.question_approved{
	float:left;
    border: 1px solid #b0b5b9;
    border-radius: 10px;
    padding: 2px;
    font-size: 12px;
    margin-right:10px;
    padding-left: 5px;
    padding-right: 5px;
     padding-top: 2px;
    padding-bottom: 2px;
    color:#b0b5b9;
}

.answer_approved{
	float:left;
    border: 1px solid #b0b5b9;
    border-radius: 10px;
    padding: 2px;
    font-size: 12px;
    margin-right:10px;
    padding-left: 5px;
    padding-right: 5px;
     padding-top: 2px;
    padding-bottom: 2px;
    color:#b0b5b9;
}

.green{
  color:#4ab471;
  border: 1px solid #4ab471;
}
.view{
	float: left;
    /* padding: 2px; */
    font-size: 12px;
    margin-right: 10px;
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 2px;
    padding-bottom: 2px;
    background-color: #ffd200;
}
.mar-top-2{
	margin-top: 2px;
}

.gold-header{
	text-align: center;
    padding: 10px;
    margin-bottom: 5%;
    background-color:gold;
        border: 1px solid;
}

.silver-header{
	text-align: center;
    padding: 10px;
    margin-bottom: 5%;
    background-color:#f1f1f1;
        border: 1px solid;
}

.bronze-header{
	text-align: center;
    padding: 10px;
        border: 1px solid;
    margin-bottom: 5%;
    background-color:#ad8c8c;
}
.border-right{
	border-right: 1px solid #eff0f1;

}
.mar-left-5px{
	margin-left:5px;
}
.mar-right-5px{
	margin-right:5px;
}
</style>
<body>


<div class="container">
<div class="headerTitle">User Profile</div>
  <div class="row">
    <div class="col-sm-3">
      <div class="img-profile">
      	<img alt="user_profile" src="../resources/img/02th-egg-person.png" width="100%">
      	 <div class="">${totalPoint} Points</div>
      </div>
     
      <div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
						<div class="points float_left"><i class="material-icons gold">star</i>${totalGold}</div>
						<div class="points float_left"><i class="material-icons silver">star</i>${totalSliver}</div>
						<div class="points float_left"><i class="material-icons bronze">star</i>${totalBronze}</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
	  </div>
    </div>
    <div class="col-sm-6">
      <div id="userId" style="display:none">${selectedUser.userId}</div>
      
      <ul>
		  <li><h4>User Name : ${selectedUser.firstName} ${selectedUser.lastName}</h4></li>
		  <li>Designation : ${selectedUser.designation}</li>
		  <li>Team : ${selectedUser.team}</li>
		  <li>Email ID : ${selectedUser.email}</li>
		
		</ul>
      
      
    </div>
    <div class="col-sm-3">
      <div class="row">
      	
      			<h3 class="col-sm-6 ans-ques">
      						${fn:length(selectedUser.answerList)}</br>
							Answers
      			</h3>
      			<h3 class="col-sm-6 ans-ques">
      					${fn:length(selectedUser.questionList)}</br>
						Questions
				</h3>
				
      </div>
      <div class="text">
      		<p><i class="fa fa-history mar-right-5px"></i>Member from ${selectedUser.createdDate}</br><i class="fa fa-eye mar-right-5px"></i> ${selectedUser.count} profile views</br><i class="fa fa-clock-o mar-right-5px"></i>Last seen ${lastLoggedIn}</p>
      		
      </div>
      
      
    </div>
  </div>
  
  <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-9">
      <h3 class="border-bottom-line"> Created Tags :</h3>
      <c:forEach var="tags" items="${tags}">
      		<div class="explore-tags">
      			<a href="../question/allView?keywordForSearch=tag:${tags.tagName}" class="post-tag"
							title="Show questions relating to usability" rel="tag">${tags.tagName}</a>
				<div class="NoQues">No of Questions Tagged : ${tags.count}</div>			
      		</div>
      </c:forEach>		
    </div>
  </div>
  <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-9">
   
		   <h3 class="border-bottom-line"> Posted Details :
		   		
		   		 <ul class="nav nav-tabs">
		    		<li class="nav-item">
		     		 <a class="active_1" id="questions" href="#question">Questions</a>
		    		</li>
		    		<li class="nav-item">
		      			<a class="" id="answers" href="#answer">Answers</a>
		    		</li>
		    
		  		</ul>
		   
		   </h3>
		  <!-- Nav tabs -->
		 
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div id="question" class="container tab-pane active">
		       <table id="questionList" class="table" style="width:100%;">
			        <thead style="display:none">
			            <tr>
			                <th></th>
			            </tr>
			        </thead>
			        <tbody>
			         <c:forEach var="questions" items="${questions}">
			          <tr>
			         
			              <td>
			              <div class="approved"  style="display:none">${questions.status}</div>
			              	<div class="question_approved" title="Green-approved else not approved">A</div>
			              	
			              	<div class="view" title="Number of Views">${questions.hitCount}</div>
			              	<div class="mar-top-2 float-left">
			                <a href="../question/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
					        </div>
					        <div class="started">
					          <a href="#" class="started-link">Asked <span title="${questions.cratedDate}" class="relativetime">
								${questions.noDaysCreated}</span></a>
			               </div>
			               </td>
			              
			            </tr>
			            </c:forEach> 
			        </tbody>
			        <tfoot>
			        </tfoot>
			    </table>
		    </div>
		    <div id="answer" class="container tab-pane fade">
		       <table id="answersList" class="table" style="width:100%;">
			        <thead style="display:none">
			            <tr>
			                <th></th>
			            </tr>
			        </thead>
			        <tbody>
			         <c:forEach var="ansList" items="${QuestionForAnswers}">
			          <tr>
			              <td>
			              	<div class="approved" style="display:none">${ansList.approve}</div>
			                <div class="answer_approved" title="Green-approved else not approved">A</div>
			              	 <div class="view" title="Number of Views">${ansList.question.hitCount}</div>
			              	<div class="mar-top-2 float-left">
			                <a href="../question/questionDetails?questionId=${ansList.question.questionId}#${ansList.ansId}" id="${ansList.ansId}" class="question-hyperlink">${ansList.question.questionTitle}</a>
					        </div>
					        <div class="started">
					            <a href="#" class="started-link">Answered <span title="${ansList.ansDate}" class="relativetime">
								${ansList.noDaysAnswered}</span></a>
					            
					        </div> 
			               </td>
			            </tr>
			            </c:forEach>
			        </tbody>
			        <tfoot>
			        </tfoot>
			    </table>
		    </div>
		    
		  </div>
		
    </div>
  </div>
  
   <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-9">
    <h3 class="border-bottom-line"> Badges :</h3>
    <div class="row">
    <div class="col-sm-4 border-right">
      <div class="gold-header">Gold <br> ${totalGold}</div>
      <c:forEach var="popularQuestion" items="${popularQuestion}">
      		<a href="../question/questionDetails?questionId=${popularQuestion.questionId}" title="Gold badge: Read the entire tour page" >
			<div class="points"> <i class="material-icons gold">star</i>Famous Question</div></a> 
      </c:forEach>
       <c:forEach var="GreatQuestion" items="${GreatQuestion}">
      		<a href="../question/questionDetails?questionId=${GreatQuestion.questionId}" title="Gold badge: Read the entire tour page" >
			<div class="points"> <i class="material-icons gold">star</i>Great Question</div></a> 
      </c:forEach>
       <c:forEach var="greatAns" items="${greatAns}">
      		<a href="../question/questionDetails?questionId=${greatAns.question.questionId}#${greatAns.ansId}" title="Gold badge: Read the entire tour page" >
			<div class="points"> <i class="material-icons gold">star</i>Great Answer</div></a> 
      </c:forEach>
    </div>
    <div class="col-sm-4 border-right">
      <div class="silver-header">Silver <br> ${totalSliver}</div>
      <c:forEach var="notableQuestion" items="${notableQuestion}">
      		<a href="../question/questionDetails?questionId=${notableQuestion.questionId}" title="Silver badge: Read the entire tour page">
      		<div class="points">  <i class="material-icons silver">star</i>Notable Question</div></a>
      </c:forEach>
       <c:forEach var="goodQuestion" items="${goodQuestion}">
      		<a href="../question/questionDetails?questionId=${goodQuestion.questionId}" title="Silver badge: Read the entire tour page">
      		<div class="points">  <i class="material-icons silver">star</i>Good Question</div></a>
      </c:forEach>
       <c:forEach var="goodAns" items="${goodAns}">
      		<a href="../question/questionDetails?questionId=${goodAns.question.questionId}#${goodAns.ansId}" title="Silver badge: Read the entire tour page">
      		<div class="points">  <i class="material-icons silver">star</i>Good Answer</div></a>
      </c:forEach>
    </div>
    <div class="col-sm-4">
      <div class="bronze-header">Bronze <br> ${totalBronze}</div>
      <c:forEach var="famousQuestion" items="${famousQuestion}">
      			<a href="../question/questionDetails?questionId=${famousQuestion.questionId}"  title="bronze badge: Read the entire tour page" >
      			<div class="points"> <i class="material-icons bronze">star</i>Popular Question</div></a>
      </c:forEach>
      <c:forEach var="niceQuestion" items="${niceQuestion}">
      			<a href="../question/questionDetails?questionId=${niceQuestion.questionId}"  title="bronze badge: Read the entire tour page" >
      			<div class="points"> <i class="material-icons bronze">star</i>Nice Question</div></a>
      </c:forEach>
       <c:forEach var="niceAns" items="${niceAns}">
      			<a href="../question/questionDetails?questionId=${niceAns.question.questionId}#${niceAns.ansId}"  title="bronze badge: Read the entire tour page">
      			<div class="points"> <i class="material-icons bronze">star</i>Nice Answer</div></a>
      </c:forEach>
    </div>
    
  </div>
  </div>
  
</div>
</div>
<script>
$(document).ready(function(){
	$(".nav .nav-item").click(function(){
		
		var que_class = $('#questions').attr('class');
		if(que_class == "active_1"){
			$("#questions").removeClass("active_1");
			   $("#answers").addClass("active_1");
		}else{
			$("#questions").addClass("active_1");
			   $("#answers").removeClass("active_1");
		}
		
	});
	
	
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
    var table = $('#questionList').DataTable({
        lengthChange: false,
        "searching": false,
        fixedHeader: {
            header: false,
            footer: true
        },
        buttons: []
    });
    var table = $('#answersList').DataTable({
        lengthChange: false,
        "searching": false,
        fixedHeader: {
            header: false,
            footer: true
        },
        buttons: []
    });
 
    
    table.buttons().container()
        .appendTo( '#example_wrapper .col-md-6:eq(0)' );
});


$(window).on('load',function(){
	var votes = $('.question_approved');
	var lengthVotes = votes.length;
	for(var i= 0;i<lengthVotes;i++){
		var approve_status = votes[i].previousElementSibling.innerText;
		if(approve_status == "true"){
			votes[i].style.backgroundColor="rgb(104, 179, 104)";
			votes[i].style.color="#ffffff";
			
		}
	}
	
	var votes = $('.answer_approved');
	var lengthVotes = votes.length;
	for(var i= 0;i<lengthVotes;i++){
		var approve_status = votes[i].previousElementSibling.innerText;
		if(approve_status == "true"){
			votes[i].style.backgroundColor="rgb(104, 179, 104)";
			votes[i].style.color="#ffffff";
			
		}
	}
	
	
	
	
});
</script>


</body>
<jsp:include page="../common/footer.jsp" /> 
</html>