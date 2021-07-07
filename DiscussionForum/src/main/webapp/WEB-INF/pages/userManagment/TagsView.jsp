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
<!-- <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script> -->

<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
 <link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
	
	<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<style type="text/css">
.table-td{
	border-top: 1px solid #0000 !important;
}
.profileHeader{

    border: 1px solid #7a827ea8;
    padding: 1%;
}

.img-profile{
	   // height: 80%;
	margin-left:20%;   
    width: 50%;
}

.profileDetail{
margin: 1%;
}
.profileName{
	    //width: 50%;
    text-align: center;
}

.profileHeader:hover{
background-color: #ffd2004a;
}

#userList_filter input:active, 
#userList_filter input:focus {
	
	 color: #495057;
    background-color: #fff;
    border-color: #dcb12e;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.55);
     	
}

.page-item.active .page-link {
    z-index: 1;
    color: #fff;
    background-color: #ffd200;
    border-color: #ffd200;
}
.page-link:focus {
    //z-index: 2;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(255, 210, 0, 0.35);
}
.page-link{
	color:black;
}

.page-link:hover {
    z-index: 2;
    color: #ffd200;
    text-decoration: none;
    background-color: #e9ecef;
    border-color: #dee2e6;
}


.tr-head th{
    font-weight: 500;
}

</style>
</head>
<body>
<div class="container">
<div class="headerTitle">All Available Tags</div>
<div class="row">

<div class="col-sm-12">

<table id="tagList"  class="table display responsive nowrap" style="width:100%;border: 1px solid #dee2e6;">
        <thead>
            <tr>
               
                <th>Tag Name</th>
                 <th class="displayNone">ID</th>
                <th>No Questions Tagged</th>
                <th>Created By</th>
                <th>Created Date</th>
                
            </tr>
        </thead>
        
        <tbody>
         <c:forEach var="tags" items="${tags}">
          <tr class="tr-header">
        
                
                <td><a href="../question/allView?keywordForSearch=tag:${tags.tagName}">${tags.tagName}</a></td>
                <td class="displayNone">${tags.tagId}</td>
                <td>${tags.count}</td>
                <td>${tags.createdBY}</td>
                <td>${tags.createdDate}</td>
                
                    
            </tr>
      </c:forEach>
              
        </tbody>
    
        <tfoot>
            
        </tfoot>
    </table>
</div>

</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	
	 
    var table = $('#tagList').DataTable({
    	lengthChange: false,
        responsive: true,
        fixedHeader: {
            header: false,
            footer: true
        }
    });
 
    //$("#example thead").remove();
    
  /*   table.buttons().container()
        .appendTo( '#example_wrapper .col-md-6:eq(0)' );*/
} ); 

</script>

</body>
 <jsp:include page="../common/footer.jsp" /> 
</html>
