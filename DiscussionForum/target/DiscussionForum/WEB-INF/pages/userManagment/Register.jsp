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
<div class="headerTitle">Register Form</div>
<form action="registerNewUser"  method="post">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-4">
 <div class="form-group">
    <label for="firstName">First Name</label>
    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name">
  </div>
  <div class="form-group">
    <label for="lastName">Last Name</label>
    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name">
  </div>
  <div class="form-group">
    <label for="loginId">Login ID</label>
    <input type="text" class="form-control" id="loginId" name="loginId" placeholder="Enter Login ID">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1"  name="email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
</div>
<div class="col-sm-4">

<form action="registerNewUser"  method="post">
 
  
  <div class="form-group">
    <label for="team">Select Department</label>
    <select class="form-control" id="team">
      <option>SAP ABAP</option>
      <option>SAP MM</option>
      <option>RPA</option>
      <option>E-BUSSINESS</option>
      <option>AEM</option>
    </select>
  </div>
  <div class="form-group">
    <label for="designation">Select Designation</label>
    <select class="form-control" id="designation">
      <option>Trainee</option>
      <option>Specialist</option>
      <option>Senior Specialist</option>
      <option>Analyst</option>
      <option>Senior Analyst</option>
      <option>Tech Lead</option>
      <option>Team Lead</option>
      <option>Manager</option>
    </select>
  </div>
  <div class="form-group">
    <label for="manager">Select Team Lead</label>
    <select class="form-control" id="manager">
      <option>Lead1</option>
      <option>Lead2</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="userRole">User Role</label>
    <input type="text" class="form-control" id="userRole" name="userRole" placeholder="Enter user Role">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>   
  
    

</div>
<div class="col-sm-2">
 
</div>


</div>
</div>
    </form>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>