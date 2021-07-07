<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../common/Header.jsp" /> 

<style>
.text{
	font-size: small;
}
.image{
	    width: 100%;
    border: 1px solid;
}
</style>
</head>
<body>
<div class="container">
<div class="headerTitle center">Welcome To Kennametal Discussion Forum</div>
	
	<div class="row">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-4">
						<img class="img-fluid"  style="margin-left: 25%;"
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt="Kenna Logo">
				</div>
				<div class="col-sm-4">
				</div>
	</div>
	
	<div class="row">
				<div class="col-sm-2 center">
				</div>
				<div class="col-sm-8 center text" style="margin-top: 5%;">
						<b>Discussion Forum </b>is a question and answer site for Kennametal Employees. It's built and run by you as part of the Kennametal. With your help, we're working together to build a library of detailed answers to every question about user experience.
						<br><br>
						 Here's how it works different from Documents and Notebooks:
				
				</div>
				<div class="col-sm-2 center">
				</div>
	</div>
	
<div class="headerTitle center">Ask questions, get answers, no distractions</div>	
	<div class="row">
				<div class="col-sm-4 text">
					This site is all about getting answers. It's not a discussion forum. There's no chit-chat.
					<br><br>
					<b>Just questions...</b>
					<br><br>
					
					<br><br>
					<br><br>
					
					<br><br>
					<br><br>
					
					<br><br>
					<b>...and answers.</b>
					
					<br><br>
					<i class="fa fa-thumbs-up" style="color: #479f37;"></i> &nbsp;&nbsp; Good answers and Questions Can be ,<b>liked</b>.
					<br><br>
					<i  class="fa fa-check-circle" style="color: #479f37;"></i> &nbsp;&nbsp;The person who asked can mark one answer as<b> "approved/accepted"</b>.
					<br><br>
                  	 Accepting doesn't mean it's the best answer, it just means that it worked for the person who asked.
					
				</div>
				<div class="col-sm-8">
						<img class="image"
						src="${pageContext.request.contextPath}/resources/img/photo1.PNG"
						alt="Kenna Logo">
				
				</div>
				
	</div>
	
	
	<div class="headerTitle center">Tags make it easy to find interesting questions</div>	
	<div class="row">
				<div class="col-sm-4 text">
				<br><br>
					
					
					All questions are <b>tagged</b> with their subject areas. Each can have up to 5 tags, since a question might be related to several subjects.
					<br><br>
					
					<br><br>
					
					<br><br>
					<b>Click any tag</b> to see a list of questions with that tag, or go to the tag list to browse for topics that interest you.
				</div>
				<div class="col-sm-8">
						<img class="image"
						src="${pageContext.request.contextPath}/resources/img/photo2.PNG"
						alt="Kenna Logo">
				
				</div>
				
	</div>
	
	<div class="headerTitle center">You earn reputation when people vote on your posts</div>	
	<div class="row">
				<div class="col-sm-4 text">
				<br><br>
				<br><br>	
					
					Your reputation score goes up when others vote up your questions, answers and edits.
					<br><br>
					For more details please click  under click <b> here</b>  or you can find on<b> Badges tab</b>
					
				</div>
				<div class="col-sm-8">
						<img style="height: 200px; margin-left: 30%;"
						src="${pageContext.request.contextPath}/resources/img/photo3.PNG"
						alt="Kenna Logo">
				
				</div>
				
	</div>
	
		<div class="headerTitle center">Improve posts by editing</div>	
	<div class="row">
				<div class="col-sm-4 text">
				<br><br>
				<br><br>	
					
					Our goal is to have the best answers to every question, so if you see questions or answers that can be improved, you can edit them.
					<br><br>
				<br><br>
					Use edits to fix mistakes, improve formatting, or clarify the meaning of a post.
					
					
					
				</div>
				<div class="col-sm-8">
						<img class="image"
						src="${pageContext.request.contextPath}/resources/img/photo4.PNG"
						alt="Kenna Logo">
				
				</div>
				
	</div>
	
	
			<div class="headerTitle center">Sign up to get started</div>	
	<div class="row">
				<div class="col-sm-4">
				
					
				</div>
				<div class="col-sm-4">
					<a href="../userMangment/register" class="btn btn-kenna-green" style=" margin-left: 25%; margin-top: 4%;width: 50%;">Sign Up</a>	
				
				</div>
				<div class="col-sm-4">
				
					
				</div>
	</div>

</div>

</body>

<jsp:include page="../common/footer.jsp" /> 
</html>