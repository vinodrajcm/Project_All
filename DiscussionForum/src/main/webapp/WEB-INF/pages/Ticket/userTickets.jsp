<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

</head>
<body>
<div class="loader" style="display:none"></div>
<div class="container">
<h1>Ticket List</h1>
<div class="row">

<div class="col-sm-12">

<table id="userList" class="table display responsive "  style="width:100%;border: 1px solid #dee2e6;">
        <thead>
            <tr class="tr-head">
                <th>Ticket Number</th>
                <th>Description</th>
                <th>Status</th>
                <th>Ticket Created Date(yyyy-mm-dd)</th>
                <th>Start Date(yyyy-mm-dd)</th>
                <th>End Date(yyyy-mm-dd)</th>
                <th>Effort (In Days)</th>
                <th>Edit BY</th>
                <th>Edit</th>
            </tr>
        </thead>
        
        <tbody>
         <c:forEach var="TicketsData" items="${result}">
          <tr class="tr-header">
                <td>${TicketsData.ticket}</td>
                <td>${TicketsData.description}</td>
                <td>${TicketsData.status}</td>
                <td>${TicketsData.ticketCratedDate}</td>
                <td>${TicketsData.planStartDate}</td>
                <td>${TicketsData.planEndDate}</td>
                <td>${TicketsData.noHours}</td>
                <td>${TicketsData.updateBY}</td>
                <td><button type="button"  class="btn btn-danger" onclick="openModal(this)">Edit</button></td>
                
            </tr>
      </c:forEach>
              
        </tbody>
    
        <tfoot>
            
        </tfoot>
    </table>
</div>

</div>
</div>

<!-- The Modal -->
<div class="modal" id="vinodModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
 
 <div class="row">
 <div class="col-sm-6">
 	<fieldset disabled>
  <div class="form-group">
    <label for="ticketNo">Ticket No</label>
      <input type="text" class="form-control" id="ticketNo">
  </div>
  <div class="form-group">
    <label for="description">Description</label>
      <textarea class="form-control" rows="5"  id="description"></textarea>
  </div>
  <div class="form-group">
    <label for="status">Status</label>
      <input type="text" class="form-control" id="status">
  </div>
  <div class="form-group">
    <label for="createdDate">Created Date</label>
      <input type="text" class="form-control" id="createdDate">
  </div>
  
 </fieldset>
 </div>
 
 <div class="col-sm-6">
 
  <div class="form-group">
    <label for="planStartDate">Plan Start Date(MM-DD-yyyy)</label>
      <input  class="form-control" id="planStartDate"/>
  </div>
 
 <div class="form-group">
    <label for="planEndDate">Plan End Date(MM-DD-yyyy)</label>
      <input class="form-control" id="planEndDate"/>
  </div>
  <div class="form-group">
    <label for="noHours">Effort (In Days)</label>
      <input type="text" class="form-control" id="noHours">
  </div>
  
  <div class="form-group ">
    <div class="col-sm-10">
      <button class="btn btn-primary" id="ticketUpdate">SUBMIT</button>
    </div>
  </div>
 </div>

  
  </div>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
<script>

var tr;
var child ;

function dateFormate(date){
	 date = new Date(date);
	 year = date.getFullYear();
	 month = date.getMonth()+1;
	 dt = date.getDate();

	 if (dt < 10) {
	   dt = '0' + dt;
	 }
	 if (month < 10) {
	   month = '0' + month;
	 }

	 return month+'/' + dt + '/'+year;
	 
	 
}
function openModal(val){
 	
 	$('#vinodModal').modal('show');
 	tr =$(val).closest('tr')[0];
 	
 	child = tr.children;
 	var startDate = dateFormate(child[4].innerHTML != "" ? child[4].innerHTML :"");
 	var endDate = dateFormate(child[5].innerHTML != "" ? child[5].innerHTML :"");
 	
 	$("#ticketNo").val(child[0].innerHTML);
 	$("#description").val(child[1].innerHTML);
 	$("#status").val(child[2].innerHTML);
 	$("#createdDate").val(child[3].innerHTML);
 	$("#planStartDate").val(startDate);
 	$("#planEndDate").val(endDate);
 	$("#noHours").val(child[6].innerHTML);
 };
 

 
$(document).ready(function(){
	 //$(".loader").fadeIn();
	 
    var table = $('#userList').DataTable({
        lengthChange: false,
        
        fixedHeader: {
            header: false,
            footer: true
        }
    });
    
  $("#ticketUpdate").click(function(event){
	  
	    // get the form data
	    // there are many ways to get this data using jQuery (you can use the class or id also)
	    var formData = {
	    	'ticket' :$("#ticketNo").val(),
	        'planStartDate': $('#planStartDate').val(),
	        'planEndDate' : $('#planEndDate').val(),
	       	'noHours': $('#noHours').val()
	    };
	    $(".loader").fadeIn();
	    // process the form
	    $.ajax({
	        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
	        url         : '../ticketUpdate/updateTicketPlanDate', // the url where we want to POST
	        data        : formData, // our data object
	        //dataType    : 'json', // what type of data do we expect back from the server
	        encode          : true,
	        success: function (data) {
	        	
	        	$(".loader").fadeOut("slow");
	        	if(data == "false"){
	        		message.messageHandling("Something went wrong while submitting.","error","message_log");
	       			 return false;
	        	}
	        	child[4].innerHTML=$('#planStartDate').val();
	         	child[5].innerHTML=$('#planEndDate').val();
	         	child[6].innerHTML=$('#noHours').val();
	        	$('#vinodModal').modal('hide');
	        },
	        error: function () {
	        	$(".loader").fadeOut("slow");
	        	 message.messageHandling("Something went wrong while submitting","error","message_log");
	        } 
	    });
  });
 
    //$("#example thead").remove();
    /* 
    table.buttons().container()
        .appendTo( '#example_wrapper .col-md-6:eq(0)' ); */
});

$(window).on('load',function(){
	
	 $('#planEndDate').datepicker({
         uiLibrary: 'bootstrap4'
     });
	 
	 $('#planStartDate').datepicker({
      uiLibrary: 'bootstrap4'
  });
	
	//$(".loader").fadeOut("slow");
	
});	

</script>
</html>