<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/general.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/resource/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/resource/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/DiscussionForum.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
<style type="text/css">
.title{
	/*width: 100%; */
    text-align: center;
    /* margin: 2%; */
    padding: 1%;
    background: #4e4b48;
    color: #e4c966;
    font-size: x-large;
}
#userList_wrapper{
	width: 98%;
    margin-left: 1%;
    margin-top: 2%;
}
.tr-head{
	background-color: cadetblue;
}
</style>
</head>
<body>
	<div class="loader" style="display: none"></div>

	<div class="title">Ticket List<div id="logout" class="logout" style="float:right;"><a href="../ticketUpdate/logout" style="color: #ecce5e;">logout</a></div></div>

	<table id="userList" class="table display responsive "
		style="width: 100%; border: 1px solid #dee2e6;">
		<thead>
			<tr class="tr-head">
				<th>Ticket #</th>
				<th style="width: 300px;">Description</th>
				<th>Status</th>
				<th>Created Date<br>(Y-M-D)</th>
				<th>Start Date<br>(Y-M-D)</th>
				<th>End Date<br>(Y-M-D)</th>
				<th>Effort <br>(In Days)</th>
				<!-- <th>Edit BY</th> -->
				<th style="width: 250px;">Comments</th>
				<!-- <th>Add #Hours</th> -->
				
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
					<%-- <td>${TicketsData.updateBY}</td> --%>
					<td>${TicketsData.comments}</td>
					<!-- <td><button type="button" class="btn btn-info"
							 data-toggle="modal" data-target="#exampleModal">Add</button></td> -->
					<td><button type="button" class="btn btn-danger"
							onclick="openModal(this)">Edit</button></td>

				</tr>
			</c:forEach>

		</tbody>

		<tfoot>

		</tfoot>
	</table>
	
	
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update No of hours Spent on ticket day wise from start date to end date</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
    <thead class="thead-light">
      <tr>
        <th>Date</th>
        <th># hours</th>
        <th>Update</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>19-2-2019</td>
        <td> <input type="text" class="form-control" id="usr"></td>
        <td><button type="button" class="btn btn-info">Update</button></td>
      </tr>
    </tbody>
  </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

	<!-- The Modal -->
	<div class="modal" id="vinodModal">
		<div class="modal-dialog" style="max-width: 900px;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Ticket Details</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<div class="row">
						<table class="table display responsive ">
							<tr>
								<th>Change number</th>
								<th>Description</th>
								<th>Status</th>
								<th>Plan Start Date</th>
								<th>Plan End Date</th>
							</tr>
							<tr>
								<td id="changeNumber">No</td>
								<td id="discription">No</td>
								<td id="status">No</td>
								<td id="startDate">No</td>
								<td id="endDate">No</td>
							</tr>
						</table>
						<div class="col-sm-6">
							<fieldset disabled>

								<div class="form-group">
									<label for="ticketNo">Ticket No</label> <input type="text"
										class="form-control" id="ticketNo">
								</div>
								<div class="form-group">
									<label for="description">Description</label>
									<textarea class="form-control" rows="5" id="description"></textarea>
								</div>
								<div class="form-group">
									<label for="status">Status</label> <input type="text"
										class="form-control" id="statusTicket">
								</div>
								<div class="form-group">
									<label for="createdDate">Created Date</label> <input
										type="text" class="form-control" id="createdDate">
								</div>

							</fieldset>
						</div>

						<div class="col-sm-6">

							<div class="form-group">
								<label for="planStartDate">Plan Start Date(MM-DD-YYYY)</label> <input
									class="form-control" id="planStartDate" />
							</div>

							<div class="form-group">
								<label for="planEndDate">Plan End Date(MM-DD-YYYY)</label> <input
									class="form-control" id="planEndDate" />
							</div>
							<div class="form-group">
								<label for="noHours">Effort (In Days)</label> <input type="text"
									class="form-control" id="noHours">
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea2">Small textarea</label>
								<textarea class="form-control rounded-0" id="comments" rows="3"></textarea>
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
	<script>

var tr;
var child ;

function dateFormate(date){
	
	if(date==""){
		return "";
	}
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
 	$(".loader").fadeIn();
	 var formData = {
		    	'ticketNumber' :child[0].innerHTML
		    };
	
	 // process the form
	    $.ajax({
	        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
	        url         : '../ticketUpdate/getChangeDetails', // the url where we want to POST
	        data        : formData, // our data object
	        //dataType    : 'json', // what type of data do we expect back from the server
	        encode          : true,
	        success: function (data) {
	        	$(".loader").fadeOut("slow");
	        	if(data == ""){
	        		
		        	$("#changeNumber").text('no data');
		        	$("#discription").text('no data');
		        	$("#status").text('no data');
		        	$("#startDate").text('no data');
		        	$("#endDate").text('no data');
	        	}else{
	        		var obj = JSON.parse(data)
		        	var date = obj.response.result;
		        	$("#changeNumber").text(date.number);
		        	$("#discription").text(date.short_description);
		        	$("#status").text(date.state);
		        	$("#startDate").text(date.start_date);
		        	$("#endDate").text(date.end_date);
	        	}
	        	
	        	event.preventDefault();
	        },
	        error: function () {
	        	$(".loader").fadeOut("slow");
	        	 alert("Error");
	        }
	    });
	
 	
 	var startDate = dateFormate(child[4].innerHTML != "" ? child[4].innerHTML :"");
 	var endDate = dateFormate(child[5].innerHTML != "" ? child[5].innerHTML :"");
 	
 	$("#ticketNo").val(child[0].innerHTML);
 	$("#description").val(child[1].innerHTML);
 	$("#statusTicket").val(child[2].innerHTML);
 	$("#createdDate").val(child[3].innerHTML);
 	$("#planStartDate").val(startDate);
 	$("#planEndDate").val(endDate);
 	$("#noHours").val(child[6].innerHTML);
 	$("#comments").val(child[7].innerHTML);
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
	       	'noHours': $('#noHours').val(),
	       	'comments':$('#comments').val()
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
	         	child[7].innerHTML=$('#comments').val();
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
</body>

</html>