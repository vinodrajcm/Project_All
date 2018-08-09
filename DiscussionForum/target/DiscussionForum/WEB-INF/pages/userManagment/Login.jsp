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
<div class="headerTitle">Login Form</div>
<div class="row">

<div class="col-sm-4"></div>
<div class="col-sm-4">
  
	<div class="form-group">
    <label for="loginId">Login ID</label>
    <input type="text" class="form-control" id="loginId" name="loginId" placeholder="Enter Login ID">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
  </div> 
  <button type="submit" class="btn btn-primary">Submit</button>
  <div class="form-group">
    <label>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </label>
  </div> 
    
</div>
<div class="col-sm-4"></div>
</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>