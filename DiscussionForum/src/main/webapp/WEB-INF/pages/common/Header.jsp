<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Discussion Forum</title>
<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/resources/img/icon.gif">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	
<link href="<c:url value="/resources/css/DiscussionForum.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/header.css" />"
	rel="stylesheet">
	<link href="<c:url value="/resources/css/table.css" />"
	rel="stylesheet">
	
		<link href="<c:url value="/resources/css/reward.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/main.js" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/general.js"></script>
</head>

<body>
<div class="loader" style="display:none"></div>
<div id="userId" hidden=true>${userDetails.userId}</div>
<div id="loginId" hidden=true>${userDetails.loginId}</div>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" style="">
					<img class="img-fluid"
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt="Kenna Logo">
				</div>
				<div class="col-sm-6">
					<div class="search1">
						<div class="search"
							style="margin: auto">
							<input class="searchText" type="" placeholder="Search.."
								name="search2">
							<button class="searchButton">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="col-sm-3 login">
				
						
						<c:choose>
						    <c:when test="${userDetails.loginId!=null}">
						    	
						         <div class="btn-group">
						         	<a style="color:black" href="#" id="userName" class="btn" >welcome: ${userDetails.firstName}</a>
						    		
									<a href="../userMangment/logout" id="Logout" class="btn btn-kenna">Logout</a>
								</div>
						    </c:when>    
						    <c:otherwise>
						        <div class="btn-group">
						          <a href="../userMangment/login" id="login" class="btn btn-kenna">Login</a> <a
							      href="../userMangment/register" id="Register" class="btn btn-kenna">Sign Up</a>
					            </div>
						    </c:otherwise>
						</c:choose>     				   
				</div>
			</div>
		</div>
	</div>
	<div class="main">

		<div class="menu">
			<div class="container">
				<div class="row" style="padding-top: 2%">
					<div class="col-sm-4">
						<a class="title headerText" href="../home/view">Discussion Forum</a>
					</div>
					<div class="col-sm-8">
						<ul class="nav justify-content-end">
							<li class="nav-item"><a class="nav-link headerText" href="../question/allView">Questions</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../user/view">Users</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../tags/view">Tags</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../reward/view">Badges</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../question/allView?keywordForSearch=unaswered:true">Unanswered</a></li>
							<li class="nav-item"><a class="nav-link headerText"
								href="../question/view">Ask Questions</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
<script>
$(document).ready(function() {

	$(".searchButton").click(function(){
		var val = $('.searchText').val();
		window.location.href ="../question/allView?HeaderSearch="+val;
		
		
	});
$(window).on('load',function(){
		var searchValue  = window.location.href;
		searchValue =  searchValue.replace(new RegExp('%20', 'g')," ");
		if(searchValue.indexOf("HeaderSearch") > 0){
			searchValue  = searchValue .substring(searchValue.indexOf("=") + 1);
		}else{
			searchValue ="";
		}
		if(document.getElementById("example") != null){
			var table = $('#example').DataTable();
		 	table.search(searchValue).draw();
		}
		
	});
});

</script>
</html>