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
<div class="row">

<div class="col-sm-4"></div>
<div class="col-sm-4">
  
	<label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    
    <label for="psw"><b>Confirm Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    
    <label for="umail"><b>Mail ID</b></label>
    <input type="text" placeholder="Enter Email" name="umail" required>
        
    <button type="submit">Register</button>
    <label>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </label>
</div>
<div class="col-sm-4"></div>
</div>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>