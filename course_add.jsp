<%// 교수 강의 추가 %>

<%@ page pageEncoding="UTF-8" %>
<%@include file="menu.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Boolean success = false;

    Course cour = new Course();
	cour.cno = request.getParameter("cno");
	cour.pid = Integer.parseInt(session.getAttribute("id").toString());
	cour.name = request.getParameter("name");
	cour.year = Integer.parseInt((request.getParameter("year")));
	cour.semester = Integer.parseInt(request.getParameter("semester"));
	cour.limit = Integer.parseInt(request.getParameter("limit"));
	
	if( cour.put(cour) ) 
	{
		success = true;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <% 
        if( success )
        {
            response.sendRedirect("course_view.jsp");
        }
        else
        {
            out.println(alertToBack("강의 추가에 실패하였습니다."));
        }
    %>
</body>
</html>