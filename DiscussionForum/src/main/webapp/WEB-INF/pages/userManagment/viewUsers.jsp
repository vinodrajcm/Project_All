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

</style>
</head>
<body>
<div class="container">
<div class="headerTitle">Users</div>
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">

<table id="userList" class="table" style="width:100%">
        <thead style="display: none;">
            <tr>
                <th>User List</th>
                
            </tr>
        </thead>
        
        <tbody>
         <c:forEach var="listUsers" items="${listUsers}">
          <tr>
        
                <td class="table-td">
                		<div class="row profileHeader">
                				<div class="col-sm-2">
                					<img  class= "img-profile" alt="profile_pic" src="${pageContext.request.contextPath}/resources/img/02th-egg-person.png"></img>
                					 <div class="profileName">${listUsers.firstName} ${listUsers.lastName}</div> 
                				</div>
                				
                				<div class="col-sm-5">
                						<div class="profileDetail">Mail ID :  ${listUsers.email}</div>
                						<div class="profileDetail">Department :  ${listUsers.team}</div>
                				</div>
                				<div class="col-sm-5">
                						<div class="profileDetail">Designation :  ${listUsers.designation}</div>
                						 <div class="profileDetail">Team Lead :  ${listUsers.manager}</div>
                				
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
<div class="col-sm-2"></div>

</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	
	 // var complexObjectList = JSON.parse(${listUsers});
	  var paramOne =<c:out value="${listUsers}"/>
	  //var modelAttributeValue = [[${listUsers}]];
	  console.log(paramOne);
    var table = $('#userList').DataTable( {
        lengthChange: false,
        fixedHeader: {
            header: false,
            footer: true
        },
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