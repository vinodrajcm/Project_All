<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

</head>
<body>
<div class="container">
<div class="headerTitle">Registered Users</div>
<div class="row">

<div class="col-sm-12">

<table id="userList" class="table display responsive nowrap"  style="width:100%;border: 1px solid #dee2e6;">
        <thead>
            <tr class="tr-head">
                <th>Login ID</th>
                <th class="displayNone">User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Mail ID</th>
                <th>Department</th>
                <th class="displayNone"></th>
            </tr>
        </thead>
        
        <tbody>
         <c:forEach var="listUsers" items="${listUsers}">
          <tr class="tr-header">
                <td><a href="../user/userDetails?userId=${listUsers.userId}">${listUsers.loginId}</a></td>
                <td class="displayNone" >${listUsers.userId}</td>
                <td>${listUsers.firstName}</td>
                <td>${listUsers.lastName}</td>
                <td>${listUsers.email}</td>
                <td>${listUsers.team}</td>
                <td class="displayNone" ><a>Delete</a> <a>Edit</a></td>
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
$(document).ready(function(){
	
    var table = $('#userList').DataTable({
        lengthChange: false,
        responsive: true,
        fixedHeader: {
            header: false,
            footer: true
        }
    });
 
    //$("#example thead").remove();
    /* 
    table.buttons().container()
        .appendTo( '#example_wrapper .col-md-6:eq(0)' ); */
});

</script>

</body>
 <jsp:include page="../common/footer.jsp" /> 
</html>
