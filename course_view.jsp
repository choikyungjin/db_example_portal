
<%
	// 강의 조회
%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="menu.jsp"%>

<%
	ArrayList<Course> cour_list2 = new ArrayList<Course>();
	for (Course cour : cour_list) {
		for (Account acc : acc_list) {
			if (cour.pid == acc.id) {
				cour.name += "(" + acc.name + ")";
				break;
			}
		}

		if (is_student == 0) {
			cour_list2.add(cour);
		} else {
			if (cour.pid == Integer.parseInt(session.getAttribute("id").toString())) {
				cour_list2.add(cour);
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css">
<style type="text/css">
</style>
</head>
<body>
	<div class="ui center aligned container">
		<a href="main.jsp?"><img
			src="https://info.kw.ac.kr/include/images/logo.gif" alt=""
			style="margin: 75px auto;"></a>
		<div class="ui grid">
			<div class="row">
				<div class="four wide column">
					<div class="ui vertical text menu">
						<%
							for (int i = 0; i < menu_list.size(); i++) {
						%>
						<%
							if (menu_url.get(i) == "header") {
						%>
						<div class="header item"><%=menu_list.get(i)%></div>
						<%
							} else {
						%>
						<%="<a href='" + menu_url.get(i) + "' class='item'>" + menu_list.get(i) + "</a>"%>
						<%
							}
							}
						%>
					</div>
				</div>
				<div class="twelve wide column">
					<div class="ui segment">
						<%
							if (Integer.parseInt(session.getAttribute("group").toString()) == 0) {
						%>
						<%
							for (Course cour : cour_list) {
						%>
						<%
							for (Course_Registration reg : cour_reg_list) {
										if (cour.cno.equals(reg.cno)
												&& reg.sid == Integer.parseInt(session.getAttribute("id").toString())) {
						%>
						<%="<b>[" + cour.cno + "]" + cour.name + "</b> " + cour.year + "년도 " + cour.semester
									+ "학기" + " 인원 : " + cour.limit%>
						<br />
						<%
							}
									}
						%>
						<%
							}
							}
						%>
						<%
							if (Integer.parseInt(session.getAttribute("group").toString()) == 1) {
						%>
						<%
							for (Course cour : cour_list) {
						%>
						<%
							for (Course_Registration reg : cour_reg_list) {
										if (cour.cno.equals(reg.cno)
												&& reg.sid == Integer.parseInt(session.getAttribute("id").toString())) {
						%>
						<%="<b>[" + cour.cno + "] " + cour.name + "</b> " + cour.year + "년도 " + cour.semester
									+ "학기" + " 인원 : " + cour.limit%>
						<br />
						<%
							}
									}
								}
							}
						%>
					</div>
					<br /> <br />
					<%
						if (Integer.parseInt(session.getAttribute("group").toString()) == 1) {
					%>
					<!-- <button type="button" class="ui button"
						onclick="location.href='course_addnew.jsp?';">강의 추가</button> -->
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>