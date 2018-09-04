<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
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
}
.points{
	text-align:center;
}
.gold{
	padding: 5px;
    color: gold;
    background-color:rgb(52, 58, 64);
    border: 1px solid #a9a4a4;
    margin-left: 5px;
    text-align: center;
}
.sliver{
	    padding: 5px;
	    background-color:rgb(52, 58, 64);
    color: #f1f1f1;
    border: 1px solid #a9a4a4;
    margin-left: 5px;
    text-align: center;
}
.bronze{
	    padding: 5px;
	    background-color:rgb(52, 58, 64);
    color: #ad8c8c;
    border: 1px solid #a9a4a4;
        margin-left: 5px;
        text-align: center;
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
.answer{
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
    border: 1px solid gold;
    margin-bottom: 5%;
    background-color:gold;
}

.silver-header{
	text-align: center;
    padding: 10px;
    border: 1px solid #f1f1f1;
    margin-bottom: 5%;
    background-color:#f1f1f1;
}

.bronze-header{
	text-align: center;
    padding: 10px;
    border: 1px solid #ad8c8c;
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
      	
      </div>
      <div class="points">${totalPoint} Points</div>
      <div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
						<div class="gold float_left"> &#x2606; ${totalGold}</div>
						<div class="sliver float_left">&#x2606; ${totalSliver}</div>
						<div class="bronze float_left">&#x2606; ${totalBronze}</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
	  </div>
    </div>
    <div class="col-sm-6">
      <div id="userId" style="display:none">${selectedUser.userId}</div>
      
      <ul>
		  <li><h4>User Name : ${selectedUser.firstName} ${selectedUser.lastName}</h4></li>
		  <li>Designation : ${selectedUser.designation}</li>
		  <li>Team : ${selectedUser.team}</li>
		  <li>Team Lead : ${selectedUser.manager}</li>
		
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
				<div class="NoQues">No of Questions Tagged :</div>			
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
		     		 <a class="active_1" href="#questions">Questions</a>
		    		</li>
		    		<li class="nav-item">
		      			<a class="" href="#answers">Answers</a>
		    		</li>
		    
		  		</ul>
		   
		   </h3>
		  <!-- Nav tabs -->
		 
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div id="questions" class="container tab-pane active">
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
			              	<div class="answer" title="Approved or not">A</div>
			              	<div class="approved"></div>
			              	<div class="view" title="Number of Views">0</div>
			              	<div class="mar-top-2">
			                <a href="../question/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
					        </div>
					        <div class="started">
					        <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">answered <span title="2018-07-30 07:42:05Z" class="relativetime">6 hours ago</span></a>
					         <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a>
			               </div>
			               </td>
			              
			            </tr>
			            </c:forEach> 
			        </tbody>
			        <tfoot>
			        </tfoot>
			    </table>
		    </div>
		    <div id="answers" class="container tab-pane fade">
		       <table id="answersList" class="table" style="width:100%;">
			        <thead style="display:none">
			            <tr>
			                <th></th>
			            </tr>
			        </thead>
			        <tbody>
			         <c:forEach var="questions" items="${QuestionForAnswers}">
			          <tr>
			              <td>
			                <div class="answer">A</div>
			              	<div class="approved"></div>
			              	<div class="view">0</div>
			                <a href="../question/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
					        <div class="started">
					            <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">answered <span title="2018-07-30 07:42:05Z" class="relativetime">6 hours ago</span></a>
					            <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a>
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
      <c:forEach var="goldMedal" items="${goldMedal}">
      		<a href="/help/badges/88/informed?userid=62099" title="Gold badge: Read the entire tour page" class="gold">&#x2606;${goldMedal}</a> 
      </c:forEach>
    </div>
    <div class="col-sm-4 border-right">
      <div class="silver-header">Silver <br> ${totalSliver}</div>
      <c:forEach var="silverMedal" items="${silverMedal}">
      		<a href="/help/badges/88/informed?userid=62099" title="Silver badge: Read the entire tour page" class="sliver">&#x2606;${silverMedal}</a>
      </c:forEach>
    </div>
    <div class="col-sm-4">
      <div class="bronze-header">Bronze <br> ${totalBronze}</div>
      <c:forEach var="bronzeMedal" items="${bronzeMedal}">
      			<a href="/help/badges/88/informed?userid=62099" title="bronze badge: Read the entire tour page" class="bronze">&#x2606;${bronzeMedal}</a>
      </c:forEach>
    </div>
    
  </div>
  </div>
  
</div>
</div>
<script>
$(document).ready(function(){
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
</script>


</body>
<jsp:include page="../common/footer.jsp" /> 
</html>