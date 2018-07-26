<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Discussion Forum</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <style>
	   .container-fluid-css{
			   // height: 5px;
				background-color: #ffd200;
	   }
	   .container-css{
			    padding-top: .5%;
    padding-bottom: .5%;
	   }
	   .img-fluid{
		    //float: right;
			margin-top: 2%;
	   }
	   form.example input[type=text] {
			padding: 5px;
			font-size: 17px;
			border: 1px solid grey;
			float: left;
			width: 80%;
			background: #f1f1f1;
			border-bottom-left-radius: 0.25rem;
			border-top-left-radius: 0.25rem;
		}

form.example button {
    float: left;
    width: 20%;
    padding: 9.5px;
    background: #343a40;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
	border-bottom-right-radius: 0.25rem;
    border-top-right-radius: 0.25rem;
}

form.example button:hover {
    background: #343a40b8;
	
}

form.example button:focus {
    outline: none !important;
}
 form.example input[type=text]:focus{
	outline: none !important;
 }
form.example::after {
    content: "";
    clear: both;
    display: table;
}
.btn-group{
	float:right;
}
.btn-kenna{
	color: #fff;
    background-color: #343a40;
    border-color: #838383;
}

.btn-kenna:hover{
	color: #fff;
    background-color: #343a40b8;
    border-color: #838383;
}
.btn-kenna:focus{
	 box-shadow: none !important;	
}

.container-fluid-header2{
	background-color: #343a40;
    height: 20%;
}

.container-fluid-header2 .container{
	padding-top: 1.5%;
}
.title{
font-weight: 200;
    font-size: x-large;
}
 .headerText{
	
	color:#ffffff
 }
 .headerText:hover{
	color:#ffd200
 }
 .container-fluid-footer{background-color: #343a40;
 padding-top: 2%;
    color: white;}
	

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #343a40;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}


span.psw {
    float: right;
    padding-top: 16px;
}

.headerTitle{
	margin: 2%;
    border-bottom: 1px solid #02020245;
}
  </style>
</head>

<body>

<div class="container-fluid container-fluid-css">
<div class="container container-css">
<div class="row">
    <div class="col-sm-3" style=""><img class="img-fluid" src="https://konnect.kennametal.com/bridge-x.com~connect_ui/images/logo.png" alt="Chania" width="160" height="345" > </div>
    <div class="col-sm-6" ><div class="search-container">
    
      <form class="example" action="/action_page.php" style="margin:auto">
  <input type="text" placeholder="Search.." name="search2">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
   
  </div></div>
    <div class="col-sm-3">
	<div class="btn-group">
	  
	  <a href="login" id="login"  class="btn btn-primary btn-kenna">Login</a>
	  <a href="register" id="Register"  class="btn btn-primary btn-kenna">Register</a>

	</div>
	</div>
	
  </div>
           
</div>
           
</div>
<div class="container-fluid container-fluid-header2">
<div class="container">
  <div class="row">
    <div class="col-sm-4" style=""><a class="nav-link title headerText" href="#">Discussion Forum</a></div>
    
    <div class="col-sm-8">
		  
	<ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link headerText" href="#">Questions</a>
    </li>
    <li class="nav-item">
      <a class="nav-link headerText" href="#">Users</a>
    </li>
    <li class="nav-item">
      <a class="nav-link headerText" href="#">Badges</a>
    </li>
	<li class="nav-item">
      <a class="nav-link headerText" href="#">Unanswered Questions</a>
    </li>
	<li class="nav-item">
      <a class="nav-link headerText" href="#">Ask Questions</a>
    </li>
    
  </ul>
	</div>
	
  </div>
    

</div>

</div>



</body>
</html>