
<%
	//로그인
%>

<%//@ page pageEncoding="utf-8"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="account.jsp"%>
<%@include file="board.jsp"%>
<%@include file="course.jsp"%>
<%@include file="course_registration.jsp"%>
<%@include file="tool.jsp"%>

<%
	Account acc = new Account();
	ArrayList<Account> acc_list = new ArrayList<Account>();
	String ID = request.getParameter("id");
	String PW = request.getParameter("pw");
	String div = request.getParameter("div");
	Boolean success = false;
	
	if (div.equals("1"))
		acc_list = acc.getstudent();
	else
		acc_list = acc.getprofessor();
	
	if (acc_list != null) {
		for (Account a : acc_list) {
			if (String.valueOf(a.id).equals(ID) && a.pw.equals(PW)) {
				success = true;
				session.setAttribute("id", a.id);
				session.setAttribute("group", a.group);
				session.setAttribute("name", a.name);
				break;
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
		if (success) {
			response.sendRedirect("main.jsp");
		} else {
			out.println(alertToBack("로그인 실패"));
		}
	%>
</body>
</html>