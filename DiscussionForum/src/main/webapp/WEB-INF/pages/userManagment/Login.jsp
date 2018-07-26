<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/Header.jsp" />  
<div class="container">
<form action="auth"  method="post">
<h4 class="headerTitle">Login Form</h4>
<div class="row">

<div class="col-sm-4"></div>
<div class="col-sm-4">
  
	<label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="name" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
        
    <button type="submit">Login</button>
    <label>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </label>
</div>
<div class="col-sm-4"></div>
</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>