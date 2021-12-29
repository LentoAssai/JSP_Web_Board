<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />
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
		} else{
			if(board.getBoardTitle() == null || board.getBoardContent() == null){
				// Not entered
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Enter properly.')");
				script.println("history.back()");
				script.println("</script>");
			} else
			{
				BoardDAO boardDAO = new BoardDAO();
				int rs = boardDAO.post(board.getBoardTitle(), userID, board.getBoardContent());
				if(rs == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('Posting Fail.')");
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
		}		
	%>
</body>
</html>