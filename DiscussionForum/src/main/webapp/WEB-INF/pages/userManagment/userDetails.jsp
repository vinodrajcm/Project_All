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
</head>
<style>
.img-profile{
	text-align:center;
	    /* margin: 10%; */
    /*background-color: #f1f1f1;*/
    /* margin-right: 5%; */
    /* padding-left: 20%; */
    margin-left: 5%;
    margin-right: 5%;
}
.points{
	text-align:center;
}
.gold{
	    padding: 5px;
    background-color: gold;
    border: 1px solid #a9a4a4;
    margin-left: 5px;
}
.sliver{
	    padding: 5px;
    background-color: #f1f1f1;
    border: 1px solid #a9a4a4;
    margin-left: 5px;
}
.bronze{
	    padding: 5px;
    background-color: #ad8c8c;
    border: 1px solid #a9a4a4;
        margin-left: 5px;
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
    font-size: 20px;
    margin-bottom:20px;
}
.text{
	    margin-left: 10%;
}

.explore-tags{
	/*width: 10%; */
    background-color: #c1c1c1;
    text-align: center;
    margin-left: 2%;
    float: left;
    margin-bottom: 2%;
    border-radius: 10px;
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

</style>
<body>


<div class="container">
<div class="headerTitle">User Profile</div>
  <div class="row">
    <div class="col-sm-3">
      <div class="img-profile">
      	<img alt="user_profile" src="../resources/img/02th-egg-person.png" width="200">
      	
      </div>
      <div class="points">200 Points</div>
      <div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
						<div class="gold float_left">&#x2606; 2</div>
						<div class="sliver float_left">&#x2606; 33</div>
						<div class="bronze float_left">&#x2606; 4</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
	  </div>
    </div>
    <div class="col-sm-6">
      <div id="userId" style="display:none">${selectedUser.userId}</div>
      <h3>User Name : ${selectedUser.firstName} ${selectedUser.lastName}</h3>
      <p>Designation : ${selectedUser.designation}</br>Team : ${selectedUser.team}</br>Team Lead : ${selectedUser.manager}</p>
    </div>
    <div class="col-sm-3">
      <div class="row">
      	
      			<div class="col-sm-6 ans-ques">
      						${fn:length(selectedUser.answerList)}</br>
							answers
      			</div>
      			<div class="col-sm-6 ans-ques">
      					${fn:length(selectedUser.questionList)}</br>
						questions
				</div>
				
      </div>
      <div class="text">
      		<p> Member for 3 years, 6 months</br> ${selectedUser.count} profile views</br>Last seen 2 days ago</p>
      </div>
      
      
    </div>
  </div>
  
  <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-9">
      <div class="headerTitle"> Created Tags :</div>
      <c:forEach var="tags" items="${tags}">
      		<div class="explore-tags">
      			<a href="# ${tags.tagName}" class="post-tag"
							title="Show questions relating to usability" rel="tag">${tags.tagName}</a>
      		</div>
      </c:forEach>		
    </div>
  </div>
  <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-9">
      <div class="container mt-3">
		   <div class="headerTitle"> Posted Details :</div>
		  <br>
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs">
		    <li class="nav-item">
		      <a class="nav-link active" href="#questions">Asked Questions</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#answers">Answered Questions</a>
		    </li>
		    
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div id="questions" class="container tab-pane active"><br>
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
			                <a href="../askQuestion/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
					        <div class="started">
					        <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">answered <span title="2018-07-30 07:42:05Z" class="relativetime">6 hours ago</span></a>
					         <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a> <span class="reputation-score" title="reputation score " dir="ltr">6,896</span>
			               </div>
			               </td>
			              
			            </tr>
			            </c:forEach> 
			        </tbody>
			        <tfoot>
			        </tfoot>
			    </table>
		    </div>
		    <div id="answers" class="container tab-pane fade"><br>
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
			                
			                <a href="../askQuestion/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
					        <div class="started">
					            <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">answered <span title="2018-07-30 07:42:05Z" class="relativetime">6 hours ago</span></a>
					            <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a> <span class="reputation-score" title="reputation score " dir="ltr">6,896</span>
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
  </div>
  
   <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-9">
    <div class="headerTitle"> Badges :</div>
    <div class="row">
    <div class="col-sm-4">
      <div class="gold">Gold</div>
    </div>
    <div class="col-sm-4">
      <div class="sliver">Silver</div>
    </div>
    <div class="col-sm-4">
      <div class="bronze">Bronze</div>
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
        fixedHeader: {
            header: false,
            footer: true
        },
        buttons: []
    });
    var table = $('#answersList').DataTable({
        lengthChange: false,
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