<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/mycss.css" rel="stylesheet" >
<title>JSP Board</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null)
			userID = (String)session.getAttribute("userID");
	%>

	<nav class="navbar navbar-dark" style="background-color: #F0F8FF;">
		<div>
			<h1 style="padding-left:650px;">JSP Board</h1>
		</div>
	
			<%
				if(userID == null){
			%>
		<div class="d-grid gap-2 d-md-block justify-content:flex-end">
			 <button class="btn btn-primary" type="button" onclick="location.href='login.jsp'">Log In</button>
 			 <button class="btn btn-primary" type="button" onclick="location.href='signup.jsp'">Sign Up</button>
		</div>
			<%
				} else{
			%>
		<div class="d-grid gap-2 d-md-block justify-content:flex-end">
			 <button class="btn btn-primary" type="button" onclick="location.href='logoutAction.jsp'">Log Out</button>
		</div>
			<%
				}
			%>
	</nav>

	<div class="container" style="padding-top : 50px;">
		<div class="row">
		<form method="post" action="postAction.jsp">
			<table class="table table-striped" style="text-align : center ; border: 3px solid #000000;">
				<thead>
					<tr>
						<th colspan="2" style="background-color : #D3D3D3; text-align: center;">Post</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="Title" name="boardTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="Contents" name="boardContent" maxlength="2048" style="height:400px"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="Post"></input>
		</form>
		</div>
	</div>
	<script src="//code.jquery.com/jquery.min.js"></script> 
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>