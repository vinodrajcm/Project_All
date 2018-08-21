<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../common/Header.jsp" />  
<script src="${pageContext.request.contextPath}/resources/js/resource/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/resource/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/resource/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<style type="text/css">
.table-td{
	   border-bottom: 1px solid #0000003b !important;
	   border-top:none !important;
}
.cp{
	text-align: center;
    font-size: smaller;

}
.votes{
	font-size: 20px;
}
.votes div{
	font-size: 12px;
}
.status{
	font-size: 20px;
}
.status div{
	font-size: 12px;
}
div.b {
    //white-space: nowrap; 
    //width: 50px; 
    overflow: hidden;
    text-overflow: ellipsis; 
    //border: 1px solid #000000;
    font-size: small;
}
div.b * {
	font-size: small !important;
}
h3{
	font-size: 1em;
}
.views{
	margin-top: 15px;
}
.started{
	float: right;
}
.col-sm-8{
     overflow: hidden;
     overflow-x: auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="headerTitle">All Questions</div>
		<div class="row">
			<div class="col-sm-8">
				<table id="example" class="table">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="questions" items="${questions}">
							<tr>
								<td class="table-td">
									<div class="row quetion-list">

										<div class="col-sm-2">
											<div class="cp">
												<div class="votes">
													<span title=" ${questions.likes} vote">${questions.likes}</span>
													<div>votes</div>
												</div>
												<div class="approved" style="display:none">${questions.status}</div>
												<div class="status">
													<span title=" ${questions.noAnswers} answer">${questions.noAnswers}</span>
													<div>answers</div>
												</div>
												<div class="views">
													<div>${questions.hitCount}views</div>
												</div>
											</div>
										</div>
										<div class="col-sm-10">
											<div class="summary">
												<h3>
													<a
														href="../question/questionDetails?questionId=${questions.questionId}"
														id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
												</h3>
												<div class="b">${questions.questionDescription}</div>
												<div class="tags t-cards">
													<c:forEach var="tags" items="${questions.tags}">
														<a href="../question/allView?tag=${tags.tagName}"
															class="post-tag" title="" rel="tag">${tags.tagName}</a>
													</c:forEach>
												</div>

												<div class="started">
													<a
														href="#"
														class="started-link">Asked <span
														title="${questions.cratedDate}" class="relativetime">
															${questions.noDaysCreated}</span></a> <a href="#">${questions.emp.firstName}</a>
													<!-- <span class="reputation-score" title="reputation score "
														dir="ltr">6,896</span> -->
												</div>

											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>

					</tfoot>
				</table>
			</div>
			<div class="col-sm-4 hq">
				<div class="eoq-hot-q-desc">Most Viewed Questions</div>
				<c:forEach var="questions" items="${topViewQuestion}">
					<li class="fa fa-question-circle" title="Question_Icon"></li>
					<a class="eoq-ans"
						href="../question/questionDetails?questionId=${questions.questionId}">
						${questions.questionTitle} </a>
				</c:forEach>
			</div>
		</div>
	</div>

<script>
$(document).ready(function() {
    var table = $('#example').DataTable( {
        lengthChange: false,
        "searching": false
    });
    $("#example thead").remove();
    
    
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
    			status[i].style="color: white;background-color: rgb(104, 179, 104);border-radius: .5em;margin-left: 10%;margin-right: 10%";
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
<jsp:include page="../common/footer.jsp" />
</body>
</html>