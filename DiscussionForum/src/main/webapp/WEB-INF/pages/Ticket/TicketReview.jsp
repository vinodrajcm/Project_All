<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Weekly Update</title>
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

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
   <link href="${pageContext.request.contextPath}/resources/css/DiscussionForum.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reward.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/general.js"></script>
  <style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
  float:right;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
  height: auto;
    overflow: hidden;
    overflow-y: scroll;
    max-height: 300px;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}

.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
.occupied{
	background-color: greenyellow;
}
.nowork{
	background-color: red;
}
.modal-dialog {
	max-width: 1200px !important;
}
</style>
</head>
<body>

<div class="loader" style="display:none"></div>
<div class=" text-center">
  <h1>Weekly Status Report of user</h1>
</div>
  
<div class="">
  <div class="row">
    <div class="col-sm-3">
      
    </div>
    <div class="col-sm-6">
		<form autocomplete="off">
		<div class="autocomplete" style="width:80%;">
			<input id="myInput" type="text" name="userName" placeholder="Type user name and press enter to search ">
		</div>
		</form>
    </div>
   
    <div class="col-sm-3">
     
    </div>
  </div>
  
  <div class="row" style="margin-top: 2%;">
    <div class="col-sm-3">
      
    </div>
     <div class="col-sm-6">
		<form autocomplete="off">
		<div class="autocomplete" style="width:80%;">
			<input id="users" type="text" name="users" placeholder="Selected Users">
			
		</div>
		
		<button id="submit" type="button">Submit</button>
		</form>
		<div style="margin-top: 2%;"> If you need to check change request due date check this: <input type="checkbox" id="myCheck" > </div>
		
    </div>
   
    <div class="col-sm-3">
     
    </div>
  </div>
  
 
  
  <div class="row" style="margin-top: 5%;">
  <div class="col-sm-12">
  	<table class="table table-bordered" id="myTable">
    <thead>
      <tr>
     	<th id="userId">User Id</th>
      	<th id="perviousheader">Pervious Week</th>
        <th id="week1header">Week 1</th>
        <th id="week2header">Week 2</th>
        <th id="week3header">Week 3</th>
        <th id="week4header">Week 4</th>
        <th id="week5header">Week 5</th>
        <th id="week6header">Week 6</th>
        <th id="week7header">Week 7</th>
        <th id="week8header">Week 8</th>
        <th id="week9header">No Date Tickets</th>
      </tr>
    </thead>
    <tbody>
  
      
    </tbody>
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
        <h4 class="modal-title">Ticket Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
<!-- Modal body -->
<div class="modal-body">
 
 <div class="row">
 		<table class="table table-bordered" id="myTableVinod">
    <thead>
      <tr>
     	<th id="userId">User Id</th>
      	<th id="ticket">ticket</th>
        <th id="status">status</th>
        <th id="ticketCratedDate">ticket Crated Date</th>
        <th id="planStartDate">plan Start Date</th>
        <th id="planEndDate">plan End Date</th>
        <th id="description">description</th>
        <th id="createdDate">Updated On</th>
        <th id="noHours">No Days</th>
        <th id="comments">Comments</th>
      </tr>
    </thead>
    <tbody>
  
      
    </tbody>
  </table>
  
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
var user_ticket;

function formatDate (input) {
	  var datePart = input.split("-");
	  var year = datePart[0]; // get only two digits
	  var month = datePart[1];
	  var day = datePart[2];
	
	  return day+'/'+month+'/'+year;
	}

	
function getTicketDetails(listOfTickets,ticketNo){
	for(var i=0; i<listOfTickets.length;i++){
		if(listOfTickets[i].ticket == ticketNo){
			return listOfTickets[i];
		}
	}
}



function getval(cel,row) {

	
	var tab = document.getElementById("myTable");
	var index = cel.closest("tr").rowIndex;
	var userId = tab.rows[index].cells[0].innerHTML;
	
	var tickets =user_ticket;
	
	var ticketsObj = JSON.parse(tickets);
	
	var popUpList = [];
	
	var selectedTicketObj ;
	
	for(var i=0;i<ticketsObj.length;i++){
		if(ticketsObj[i].userId == userId){
			selectedTicketObj = ticketsObj[i]
		}
	}
	var listOfTickets = selectedTicketObj.result1;
   if(cel.cellIndex == 1){
	   var tickets = selectedTicketObj.previousWeekIncidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 2){
	   var tickets = selectedTicketObj.week1Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   console.log(ticketDetails);
			   
			   popUpList = popUpList.concat(ticketDetails)
			   console.log(popUpList);
		   }
	   }
	   
   }else if(cel.cellIndex == 3){
	   var tickets = selectedTicketObj.week2Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 4){
	   var tickets = selectedTicketObj.week3Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 5){
	   var tickets = selectedTicketObj.week4Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 6){
	   var tickets = selectedTicketObj.week5Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 7){
	   var tickets = selectedTicketObj.week6Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 8){
	   var tickets = selectedTicketObj.week7Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 9){
	   var tickets = selectedTicketObj.week8Incidents;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }else if(cel.cellIndex == 10){
	   var tickets = selectedTicketObj.incidentWithNoDate;
	   var ticketsarray = tickets.split(',');
	   
	   for(var i=0;i<ticketsarray.length;i++){
		   if(ticketsarray[i] != ""){
			   var ticketNo = ticketsarray[i];
			   var ticketDetails = getTicketDetails(listOfTickets,ticketNo);
			   popUpList.push(ticketDetails);
		   }
	   }
	   
   }
console.log(popUpList);

$('#vinodModal').modal('show');




var table = document.getElementById("myTableVinod");

var len = $("#myTableVinod thead tr").length;

if(len >1){
	for (var i=1 ; i<len ; i++){
		$("#myTableVinod thead tr")[1].remove();
	}
}

	for(var i=0;i<popUpList.length;i++){
    	
		var row = table.insertRow(i+1);
		
		row.insertCell(0).innerHTML=popUpList[i].updateBY != undefined ? popUpList[i].updateBY :"empty";
	    row.insertCell(1).innerHTML=popUpList[i].ticket != undefined? popUpList[i].ticket :"empty";
	 	row.insertCell(2).innerHTML=popUpList[i].status != undefined ? popUpList[i].status:"empty";
	    row.insertCell(3).innerHTML=popUpList[i].ticketCratedDate != undefined ? popUpList[i].ticketCratedDate :"empty";
	 	row.insertCell(4).innerHTML=popUpList[i].planStartDate != undefined ?popUpList[i].planStartDate :"empty";
	    row.insertCell(5).innerHTML=popUpList[i].planEndDate != undefined ? popUpList[i].planEndDate:"empty";
		row.insertCell(6).innerHTML=popUpList[i].description != undefined ? popUpList[i].description:"empty";
		row.insertCell(7).innerHTML=popUpList[i].createdDate != undefined ? popUpList[i].createdDate:"empty";
		row.insertCell(8).innerHTML=popUpList[i].noHours != undefined ? popUpList[i].noHours:"empty";
		row.insertCell(9).innerHTML=popUpList[i].comments != undefined ? popUpList[i].comments:"empty";
		
		
	}



}
	
$(document).ready(function() {
	
	$("#submit").click(function(){
		var data = $("#users").val();
		var role = "";
		
		var len = $("#myTable thead tr").length;
		
		var checked = document.getElementById("myCheck").checked;
		
		if(len >1){
			for (var i=1 ; i<len ; i++){
				$("#myTable thead tr")[1].remove();
			}
		}
		
		
		var formData = {
	               'userList':data,
	               'usersRole':checked
	           };
		 $(".loader").fadeIn(); 
	   // process the form
	       $.ajax({
	           type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
	           url         : '../ticketUpdate/getReport', // the url where we want to POST
	           data        : formData, // our data object
	           //dataType    : 'json', // what type of data do we expect back from the server
	           encode          : true,
	           success: function (data) {
	           	console.log(data.data);
	           	user_ticket =JSON.stringify(data.data);
	           	$.cookie('tickets', user_ticket);
	           	$("#perviousheader").text("Pervious Week : \n Before -"+new Date(data.data[0].previousDate).toDateString().replace("Sun",""));
	           	$("#week1header").text("Week 1 : \n"+new Date(data.data[0].previousDate).toDateString().replace("Sun","") +' - '+new Date(data.data[0].week1Date).toDateString().replace("Sun",""));
	           	$("#week2header").text("Week 2 :\n"+new Date(data.data[0].week1Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week2Date).toDateString().replace("Sun",""));
	           	$("#week3header").text("Week 3 :\n"+new Date(data.data[0].week2Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week3Date).toDateString().replace("Sun",""));
	           	$("#week4header").text("Week 4 :\n"+new Date(data.data[0].week3Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week4Date).toDateString().replace("Sun",""));
	           	$("#week5header").text("Week 5 :\n"+new Date(data.data[0].week4Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week5Date).toDateString().replace("Sun",""));
	           	$("#week6header").text("Week 6 :\n"+new Date(data.data[0].week5Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week6Date).toDateString().replace("Sun",""));
	           	$("#week7header").text("Week 7 :\n"+new Date(data.data[0].week6Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week7Date).toDateString().replace("Sun",""));
           		$("#week8header").text("Week 8 :\n"+new Date(data.data[0].week7Date).toDateString().replace("Sun","")+' - '+new Date(data.data[0].week8Date).toDateString().replace("Sun",""));
           		$("#week9header").text("No Date Tickets");
           		var table = document.getElementById("myTable");
	           	for(var i=0;i<data.data.length;i++){
			        	
	           		var row = table.insertRow(i+1);
	           		
	           		row.insertCell(0).innerHTML=data.data[i].userId;
	           	    row.insertCell(1).innerHTML=data.data[i].previousWeek;
	           	 	row.insertCell(2).innerHTML=data.data[i].week1;
	           	    row.insertCell(3).innerHTML=data.data[i].week2;
	           	 	row.insertCell(4).innerHTML=data.data[i].week3;
	           	    row.insertCell(5).innerHTML=data.data[i].week4;
	           		row.insertCell(6).innerHTML=data.data[i].week5;
	           		row.insertCell(7).innerHTML=data.data[i].week6;
	           		row.insertCell(8).innerHTML=data.data[i].week7;
	           		row.insertCell(9).innerHTML=data.data[i].week8;
	           		row.insertCell(10).innerHTML=data.data[i].noDueDate;
	           		
	           		var Cells = row.getElementsByTagName("td");
	           		if(data.data[i].previousWeek > 0){
	           			Cells[1].style="background-color:red";
	           		}else{
	           			Cells[1].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week1 > 0){
	           			Cells[2].style="background-color:red";
	           		}else{
	           			Cells[2].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week2 > 0){
	           			Cells[3].style="background-color:red";
	           		}else{
	           			Cells[3].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week3 > 0){
	           			Cells[4].style="background-color:red";
	           		}else{
	           			Cells[4].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week4 > 0){
	           			Cells[5].style="background-color:red";
	           		}else{
	           			Cells[5].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week5 > 0){
	           			Cells[6].style="background-color:red";
	           		}else{
	           			Cells[6].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week6 > 0){
	           			Cells[7].style="background-color:red";
	           		}else{
	           			Cells[7].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week7 > 0){
	           			Cells[8].style="background-color:red";
	           		}else{
	           			Cells[8].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].week8 > 0){
	           			Cells[9].style="background-color:red";
	           		}else{
	           			Cells[9].style="background-color:yellowgreen";
	           		}
	           		if(data.data[i].noDueDate > 0){
	           			Cells[10].style="background-color:yellow";
	           		}else{
	           			Cells[10].style="background-color:yellowgreen";
	           		}
	           		
	           	    
	           	}
	           	
	           	
	           	var tbl = document.getElementById("myTable");

	           	if (tbl != null) {

	           	    for (var i = 0; i < tbl.rows.length; i++) {

	           	        for (var j = 0; j < tbl.rows[i].cells.length; j++)

	           	            tbl.rows[i].cells[j].onclick = function () { getval(this); };

	           	    }

	           	}
	            $(".loader").fadeOut(); 
	           },
	           error: function () {
	               alert('error happened');
	           }
	       });
		
		
	});
});

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("keydown", function(e) {
	  
	  if (e.keyCode == 13) {
		  var cmp = this;
		  
	      var a, b, i, val = this.value;
		  
	      var formData = {
	               'user':val
	           };
	      $(".loader").fadeIn();
	   // process the form
	       $.ajax({
	           type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
	           url         : '../ticketUpdate/userSearch', // the url where we want to POST
	           data        : formData, // our data object
	           //dataType    : 'json', // what type of data do we expect back from the server
	           encode          : true,
	           success: function (data) {
	           	//console.log(data);
	           	var obj = JSON.parse(data);
	           	var arr = obj.response.result;
	           	var newArrString = "";
	            $(".loader").fadeOut();
	           	if(typeof arr.length == "undefined"){
	           		var user_name = arr.user_name;
	           		var name = arr.name;
	           		newArrString= newArrString+name+"--"+user_name+",";
	           		
	           	}
	           	else{
	           		for (i = 0; i < arr.length; i++) {
	               		var user_name = arr[i].user_name;
	               		var name = arr[i].name;
	               		newArrString= newArrString+name+"--"+user_name+",";
	               	}
	           	}
	           	newArrString = newArrString.split(',');
	            /*close any already open lists of autocompleted values*/
	 	       closeAllLists();
	 	       if (!val) { return false;}
	 	       currentFocus = -1;
	 	       /*create a DIV element that will contain the items (values):*/
	 	       a = document.createElement("DIV");
	 	       a.setAttribute("id", cmp.id + "autocomplete-list");
	 	       a.setAttribute("class", "autocomplete-items");
	 	       /*append the DIV element as a child of the autocomplete container:*/
	 	       cmp.parentNode.appendChild(a);
	 	       /*for each item in the array...*/
	 	       for (i = 0; i < newArrString.length; i++) {
	 	    	  if (!newArrString[i]) { return false;}
	 	           /*create a DIV element for each matching element:*/
	 	           b = document.createElement("DIV");
	 	           /*make the matching letters bold:*/
	 	           display_val = newArrString[i].replace(val, "<strong>"+val+"</strong>");
	 	           b.innerHTML = display_val;
	 	          /*  b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
	 	           b.innerHTML += arr[i].substr(val.length); */
	 	           /*insert a input field that will hold the current array item's value:*/
	 	           b.innerHTML += "<input type='hidden' value='" + newArrString[i] + "'>";
	 	           /*execute a function when someone clicks on the item value (DIV element):*/
	 	           b.addEventListener("click", function(e) {
	 	               /*insert the value for the autocomplete text field:*/
	 	               	var tag = this.getElementsByTagName("input")[0].value;
	 	             	
			    		var selectedUser = $("#users").val();
			    		selectedUser = tag +','+selectedUser;
			    		
			    		$("#users").val(selectedUser);
	 	               /*close the list of autocompleted values,
	 	               (or any other open lists of autocompleted values:*/
	 	               closeAllLists();
	 	           });
	 	           a.appendChild(b);
	 	      
	 	       }
	           },
	           error: function () {
	               alert('error happened');
	           }
	       });
		  
	  }
	  
       });
	  
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
  }

/*An array containing all the country names in the world:*/
var countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>
</html>