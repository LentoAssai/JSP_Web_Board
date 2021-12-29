<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
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
		
		int pageNum = 1;
		if(request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
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
	
	<div class="container"style="padding-top: 50px;">
		<div class="row">
			<table class="table table-striped" style="text-align : center ; border: 3px solid #000000">
				<thead>
					<tr>
						<th style="background-color : #D3D3D3; text-align: center;">No</th>
						<th style="background-color : #D3D3D3; text-align: center;">Title</th>
						<th style="background-color : #D3D3D3; text-align: center;">Posted by</th>
						<th style="background-color : #D3D3D3; text-align: center;">Date</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> plist = boardDAO.getPostingList(pageNum);
						for(int i=0 ; i < plist.size() ; i++) {
					%>
					<tr>
						<td><%= plist.get(i).getBoardNo() %></td>
						<td><a href="view.jsp?boardNo=<%= plist.get(i).getBoardNo() %>"> <%= plist.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= plist.get(i).getUserID() %></td>
						<td><%= plist.get(i).getBoardDate().substring(5, 7) + ". " + plist.get(i).getBoardDate().substring(8, 10) + ". " + plist.get(i).getBoardDate().substring(0, 4) + ".  " + plist.get(i).getBoardDate().substring(11, 13) + ":" + plist.get(i).getBoardDate().substring(14, 16) %></td>
					</tr>
					<%
						}
					%>
				</tbody>	
			</table>
			
		</div>
			<%
				if(pageNum != 1){
			%>
				<a href="board.jsp?pageNum=<%= pageNum - 1 %>" class="btn btn-success btn-arraw-left">Back</a>
			<%
				} if(boardDAO.hasNextPage(pageNum + 1)){
			%>
				<a href="board.jsp?pageNum=<%= pageNum + 1 %>" class="btn btn-success btn-arraw-left">Next</a>
			<%
				}
			%>
		<a href="post.jsp" class="btn btn-primary" style="float: right;">Post</a>
	</div>
	
	<script src="//code.jquery.com/jquery.min.js"></script> 
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>