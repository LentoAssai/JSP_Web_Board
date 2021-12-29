<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			script.println("alert('Please log in first.')");
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
			script.println("alert('You can't delete.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		else{
			BoardDAO boardDAO = new BoardDAO();
			int rs = boardDAO.delete(boardNo);
			if(rs == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Deleting Fail.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		}		
	%>
</body>
</html>