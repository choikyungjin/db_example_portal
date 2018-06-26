<% //로그아웃 %>

<%@ page pageEncoding="UTF-8" %>
<%@include file="account.jsp" %>
<%@include file="board.jsp" %>
<%@include file="course.jsp" %>
<%@include file="course_registration.jsp" %>
<%@include file="tool.jsp" %>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
</body>
</html>