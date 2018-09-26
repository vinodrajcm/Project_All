<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<jsp:include page="../common/Header.jsp" />  
<script src="${pageContext.request.contextPath}/resources/js/resource/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/resource/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/resource/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<style>
div.dataTables_wrapper div.dataTables_filter label{
	font-weight: bold;
    white-space: nowrap;
    /* text-align: left; */
    width: 90%;
    margin-top: 10px;
    margin-bottom: 10px;

}
div.dataTables_wrapper div.dataTables_filter {
text-align:left;
}
div.dataTables_wrapper div.dataTables_filter input {
    margin-left: 0.5em;
    display: inline-block;
     width: 100%;
}

</style>
</head>
<body>
	<div class="container">
		
		<div class="row">
			<div class="col-sm-9">
			<div class="headerTitle">All Questions</div>
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

										<div class="col-sm-2" style="padding-right: 5%;">
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
													<a href="../question/questionDetails?questionId=${questions.questionId}"
														id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a>
												</h3>
												<div class="b mar-top-bottom">${questions.questionDescription}</div>
												<div class="tags t-cards">
													<c:forEach var="tags" items="${questions.tags}">
														<a href="../question/allView?keywordForSearch=tag:${tags.tagName}"
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
			<div class="col-sm-3 hq">
				<div class="title_withoutborder">${fn:length(questions)}</div>
				<div>questions</div>
				<div class="title_withoutborder">Tags to Search</div>
						<c:forEach var="tagList" items="${tagList}">
						<div class="tags">
						<a href="../question/allView?keywordForSearch=tag:${tagList.tagName}" class="post-tag"
							title="Show questions relating to usability" rel="tag">${tagList.tagName}</a>
						</div>	
						</c:forEach>
							
						<a class="more-tags _gps" href="../tags/view">more&nbsp;tags</a>
			
				<div class="eoq-hot-q-desc title_withoutborder">Most Viewed Questions</div>
				<c:forEach var="questions" items="${topViewQuestion}">
					
					<a class="fa fa-question-circle eoq-ans"
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
        //"searching": false
    });
    $("#example thead").remove();
    
});


$(window).on('load',function(){
	var votes = $('.votes');
	var lengthVotes = $('.votes').length;
	for(var i= 0;i<lengthVotes;i++){
		var count = votes[i].innerText;
		if(count.indexOf('0')>-1){
			votes[i].style.color="black";
			//votes[i].next().style="color:black";
		}
	}
	
	var status = $('.status');
	var lengthstatus = $('.status').length;
	for(var i= 0;i<lengthstatus;i++){
		var count = status[i].innerText;
		var approve_status = status[i].previousElementSibling.innerText;
		if(approve_status == "true"){
			status[i].style.color="white";
			status[i].style.backgroundColor="rgb(104, 179, 104)";
			status[i].style.borderRadius= ".5em";
		}else{
			if(count.indexOf('0')>-1){
				status[i].style.color="black";
			}else{
				status[i].style.color="#4ab471";
		}
		
	}
	}
	var views = $('.views');
	var lengthviews = $('.views').length;
	for(var i= 0;i<lengthviews;i++){
		var count = views[i].innerText;
		if(count.indexOf('0')>-1){
			views[i].style.color="black";
			//votes[i].next().style="color:black";
		}
	}
	
});
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>