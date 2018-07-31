<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/Header.jsp" />  
<div class="container">
<form action="auth"  method="post">
<h4 class="headerTitle">Ask Questions</h4>
<div class="row">

<div class="col-sm-4"></div>
<div class="col-sm-4">
  
	<label for="uname"><b>Title</b></label>
    <input type="text" placeholder="Enter Username" name="name" required>

    <label for="uname"><b>Body</b></label>
	<textarea cols="200" rows="20" id="content" name="content"> 
    </textarea>
      <script type="text/javascript">
        CKEDITOR.replace( 'content' );
      </script> 
      
      
    <button type="submit">Submit</button>
    
</div>
<div class="col-sm-4"></div>
</div>
</form>
</div>
<jsp:include page="../common/footer.jsp" />  
</body>
</html>