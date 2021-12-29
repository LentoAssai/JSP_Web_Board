<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
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
		
		int boardNo = 0;
		if (request.getParameter("boardNo") != null)
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		if (boardNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Wrong Posting.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		
		Board board = new BoardDAO().getPost(boardNo);
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

	<div class="container" style="padding-top: 50px;">
		<div class="row">
			<table class="table table-striped" style="text-align : center ; border: 3px solid #000000;">
				<thead>
					<tr>
						<th colspan="3" style="background-color : #D3D3D3; text-align: center;">Post</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width : 20%;">Title</td>
						<td colspan="2"><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>Author</td>
						<td colspan="2"><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>Date</td>
						<td colspan="2"><%= board.getBoardDate().substring(5, 7) + ". " + board.getBoardDate().substring(8, 10) + ". " + board.getBoardDate().substring(0, 4) + ".  " + board.getBoardDate().substring(11, 13) + ":" + board.getBoardDate().substring(14, 16) %></td>
					</tr>
					<tr>
						<td>Contents</td>
						<td colspan="2" style="text-align : left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
		</div>
			<a href="board.jsp" class="btn btn-primary">Back</a>
			<%
				if (userID != null && userID.equals(board.getUserID())){
			%>
					<a href="update.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">Update</a>
					<a onclick="return confirm('Are you sure?')" href="deleteAction.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">Delete</a>
			<%
				}
			%>
	</div>
	<script src="//code.jquery.com/jquery.min.js"></script> 
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>