<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/mycss.css" rel="stylesheet" >
<title>JSP Board</title>
</head>
<body>
	<nav class="navbar navbar-dark" style="background-color: #F0F8FF;">
		<div>
			<h1 style="padding-left:650px;">JSP Board</h1>
		</div>
		<div class="d-grid gap-2 d-md-block justify-content:flex-end">
			 <button class="btn btn-primary" type="button" onclick="location.href='login.jsp'">Log In</button>
 			 <button class="btn btn-primary" type="button" onclick="location.href='signup.jsp'">Sign Up</button>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 50px;margin-top: 50px;">
			    <form method="post" action="signupAction.jsp">
				     <h3 style="text-align: center">Sign Up</h3>
			  	  <div class="form-group">
			      <input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
			      </div>
			      <div class="form-group">
			      <input type="password" class="form-control" placeholder="Password" name="userPassword" maxlength="20">
			      </div>
			      <div class="form-group">
			      <input type="text" class="form-control" placeholder="Name" name="userName" maxlength="20">
			      </div>
			      <div class="form-group">
			      <input type="email" class="form-control" placeholder="Email" name="userEmail" maxlength="50">
			      </div>
			      <input type="submit" class="btn btn-primary form-control" value="Sign up">
			    </form>
		 	</div>
		 </div>
	</div>
	<script src="//code.jquery.com/jquery.min.js"></script> 
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>