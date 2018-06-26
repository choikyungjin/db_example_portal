<%
	// 강의 게시판
%>

<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@include file="menu.jsp"%>

<%
	ArrayList<Board> board_list2 = new ArrayList<Board>();

	for (Board b : board_list) {
		if (b.cno.equals(request.getParameter("cno"))) {
			board_list2.add(b);
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
#content {
	display: inline-block;
}
</style>
</head>
<body>
	<div class="ui left aligned">
		<a href="main.jsp?"><img src="images/upup.jpg" alt="" width="60%;"></a>
	</div>
	<table>
		<tr>
			<td>
				<div id="content">
					<div class="ui vertical menu" style="background-color: #e6e8f7;">
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
						</div>
					</div>
	</div>
					<div>
						<img src="images/banner.jpg" style="width: 70%;">
					</div>
			</td>
			<td>
				<div class="twelve wide column" style="width: 100%">
			<%
				for (Board b : board_list2) {
			%>
			<div class="ui segment">

				<%="<a href='board_show_dialog.jsp?cno=" + request.getParameter("cno") + "&title=" + b.title
						+ ";'>" + b.title + "</a>"%>
				<%
					
				%>
				<%
					//if (b.contents != null && b.contents.length() > 2)
					//		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='download.jsp?file_name=" + b.contents + "'>"
					//				+ b.contents + "</a>");
				%>
				<%
					// if( b.data2.length() > 2 ) out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/ucam/download.jsp?file_name=" + b.data2 + "'>파일2</a>");
				%>
			</div>
			<%
				}
			%>
			<br /> <br />
			<%
				if (Integer.parseInt(session.getAttribute("group").toString()) == 1) {
			%>
			<button type="button" class="ui button"
				onclick="location.href='board_write.jsp?cno=<%=request.getParameter("cno")%>';">자료
				추가</button>
			<%
				}
			%>
		</div>
			</td>
		</tr>
	</table>

	<footer>
		<img src="images/down.jpg" style="width: 60%; align:bottom;">
	</footer>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
</body>
</html>