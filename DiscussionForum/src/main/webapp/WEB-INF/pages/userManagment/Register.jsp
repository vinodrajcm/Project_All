<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>
<jsp:include page="../common/Header.jsp" />  
<div class="container">
<h4 class="headerTitle">Register Form</h4>
<form action="registerNewUser"  method="post">
<div class="row">

<div class="col-sm-4">
	<label for="name"><b>First Name</b></label>
    <input type="text" placeholder="Enter FirstName" name="firstName" required>
	
	<label for="name"><b>Last Name</b></label>
    <input type="text" placeholder="Enter FirstName" name="lastName" required>
    
    <label for="name"><b>User name</b></label>
    <input type="text" placeholder="Enter Username" name="name" required>
    
    </div>
<div class="col-sm-4">
 

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    
    <label for="psw"><b>Confirm Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    
    <label for="email"><b>Mail ID</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
        
  
    

</div>
<div class="col-sm-4">
 <label for="designation"><b>Designation</b></label>
    <input type="text" placeholder="Enter Designation" name="designation" required>
    
    <label for="team"><b>Team</b></label>
    <input type="text" placeholder="Enter Team" name="team" required>
    
    <label for="manager"><b>Manager Name</b></label>
    <input type="text" placeholder="Enter Managername" name="manager" required>
	  <button type="submit">Register</button>
</div>


</div>
</div>
    </form>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>