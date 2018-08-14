<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Discussion Forum</title>
<link rel="shortcut icon" type="image/ico" href="https://www.kennametal.com/etc/designs/kennametal/images/icon.gif">
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
<link href="<c:url value="/resources/css/DiscussionForum.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/header.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/main.js" />"></script>
</head>

<body>

<div id="userId" hidden=true>${userDetails.userId}</div>
<div id="loginId" hidden=true>${userDetails.loginId}</div>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" style="">
					<img class="img-fluid"
						src="https://konnect.kennametal.com/bridge-x.com~connect_ui/images/logo.png"
						alt="Kenna Logo">
				</div>
				<div class="col-sm-6">
					<div class="search1">
						<form class="search" action="/action_page.php"
							style="margin: auto">
							<input class="searchText" type="" placeholder="Search.."
								name="search2">
							<button class="searchButton" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
				<div class="col-sm-3">
						<c:choose>
						    <c:when test="${userDetails.loginId!=null}">
						         <div class="btn-group">
									<a href="#" id="login" class="btn btn-kenna">${userDetails.firstName}</a> <a
									href="../userMangment/logout" id="Logout" class="btn btn-kenna">Logout</a>
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
							<li class="nav-item"><a class="nav-link headerText" href="../askQuestion/allView">Questions</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../user/view">Users</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../tags/view">Tags</a>
							</li>
							<li class="nav-item"><a class="nav-link headerText" href="../askQuestion/allView?unaswered=true">Unanswered
									Questions</a></li>
							<li class="nav-item"><a class="nav-link headerText"
								href="../askQuestion/view">Ask Questions</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>