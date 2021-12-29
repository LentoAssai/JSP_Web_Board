<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

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
		
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You are logged in.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
	
		UserDAO userDAO = new UserDAO();
		int rs = userDAO.login(user.getUserID(), user.getUserPassword());
		
		if(rs == 1){
			//Login Success
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		else if(rs == 0){
			//Wrong Password
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Wrong Password.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(rs == -1){
			//No ID
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Wrong ID.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(rs == -2){
			//Database Error
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Database Error.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>