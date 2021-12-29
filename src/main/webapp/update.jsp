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
	
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please login first.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
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
		if (!userID.equals(board.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You can't update.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
	%>

	<nav class="navbar navbar-dark" style="background-color: #F0F8FF;">
		<div>
			<h1 style="padding-left:650px;">JSP Board</h1>
		</div>
	</nav>

	<div class="container" style="padding-top : 50px;">
		<div class="row">
		<form method="post" action="updateAction.jsp?boardNo=<%= boardNo %>">
			<table class="table table-striped" style="text-align : center ; border: 3px solid #000000">
				<thead>
					<tr>
						<th colspan="2" style="background-color : #D3D3D3; text-align: center;">Update</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" name="boardTitle" maxlength="50" value = "<%= board.getBoardTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" name="boardContent" maxlength="2048" style="height:400px;"><%= board.getBoardContent() %>></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="Update"></input>
		</form>
		</div>
	</div>
	<script src="//code.jquery.com/jquery.min.js"></script> 
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>