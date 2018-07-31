<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Discussion Forum</title>
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
	<link href="<c:url value="/resources/css/DiscussionForum.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jmain.js" />"></script>
</head>

<body>
	<div class="container-fluid container-fluid-css">
		<div class="container container-css">
			<div class="row">
				<div class="col-sm-3" style="">
					<img class="img-fluid"
						src="https://konnect.kennametal.com/bridge-x.com~connect_ui/images/logo.png"
						alt="Chania" width="160" height="345">
				</div>
				<div class="col-sm-6">
					<div class="search-container">
						<form class="example" action="/action_page.php"
							style="margin: auto">
							<input type="text" placeholder="Search.." name="search2">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="btn-group">

						<a href="login" id="login" class="btn btn-primary btn-kenna">Login</a>
						<a href="register" id="Register" class="btn btn-primary btn-kenna">Register</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid container-fluid-header2">
		<div class="container">
			<div class="row">
				<div class="col-sm-4" style="">
					<a class="nav-link title headerText" href="#">Discussion Forum</a>
				</div>
				<div class="col-sm-8">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link headerText" href="#">Questions</a>
						</li>
						<li class="nav-item"><a class="nav-link headerText" href="#">Users</a>
						</li>
						<li class="nav-item"><a class="nav-link headerText" href="#">Badges</a>
						</li>
						<li class="nav-item"><a class="nav-link headerText" href="#">Unanswered
								Questions</a></li>
						<li class="nav-item"><a class="nav-link headerText" href="#">Ask
								Questions</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>