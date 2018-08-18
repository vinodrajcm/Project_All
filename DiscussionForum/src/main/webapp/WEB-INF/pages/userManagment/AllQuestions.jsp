<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../common/Header.jsp" />  
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
     overflow: hidden ;
    overflow-x: auto;
}
</style>
</head>
<body>
<div class="container">
<div class="headerTitle">All Questions</div>
<div class="row">

<div class="col-sm-8">
<table id="example" class="table" >
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
					            <div>vote</div>
					        </div>
					        <div class="status">
					            <span title=" ${questions.noAnswers} answer">${questions.noAnswers}</span>
					            <div>answers</div>
					        </div>
					        <div class="views">
					            <div>${questions.hitCount} views</div>
					        </div>
					    </div>
					</div>
					<div class="col-sm-10">
						<div class="summary">				        
					        <h3><a href="../question/questionDetails?questionId=${questions.questionId}" id="${questions.questionId}" class="question-hyperlink">${questions.questionTitle}</a></h3>
					        <div class="b">${questions.questionDescription}</div>
					        <div class="tags t-cards">
					            <c:forEach var="tags" items="${questions.tags}">
					                   <a href="../question/allView?tag=${tags.tagName}" class="post-tag" title="" rel="tag">${tags.tagName}</a> 
					            </c:forEach>
					        </div>
					        
							<div class="started">
					            <a href="/questions/119887/can-a-card-have-lozenges/?lastactivity" class="started-link">Asked <span title="2018-07-30 07:42:05Z" class="relativetime">6 hours ago</span></a>
					            <a href="/users/103321/pectoralis-major">${questions.emp.firstName}</a> <span class="reputation-score" title="reputation score " dir="ltr">6,896</span>
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
<div class="col-sm-4">
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

<script type="text/javascript">
$(document).ready(function() {
    var table = $('#example').DataTable( {
        lengthChange: false,
        "searching": false,
        buttons: []
    } );
 
    $("#example thead").remove();
    
    table.buttons().container()
        .appendTo( '#example_wrapper .col-md-6:eq(0)' );
} );

</script>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>