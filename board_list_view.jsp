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
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5">
			<td width="5"></td>
		</tr> 
		<tr
			 style="background: url('images/table_mid.gif') repeat-x; text-align: center;">
			<td width="5"><img src="images/table_left.gif" width="5"
				height="30" /></td> 
			<td width="379">제목</td>
			<td width="7"><img src="images/table_right.gif" width="5"
				height="30" /></td>
		</tr>
			<%
				for (Board b : board_list2) {
			%>

			
				 <tr height="25" align="center">
				<td>&nbsp;</td> 
				<!-- <td align="center"><a href='board_show_dialog.jsp?cno=" + request.getParameter("cno") + "&title=" + b.title
						+ ";'>" + b.title + "</a></td> -->
						<td align="center"><a href="board_show_dialog.jsp?cno=<%=request.getParameter("cno")%>&title=<%=b.title%>;"><%=b.title %></a></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#D2D2D2">
				<td colspan="6"></td>
			</tr>
			
				<%
					//if (b.contents != null && b.contents.length() > 2)
					//		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='download.jsp?file_name=" + b.contents + "'>"
					//				+ b.contents + "</a>");
				%>
				<%
					// if( b.data2.length() > 2 ) out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/ucam/download.jsp?file_name=" + b.data2 + "'>파일2</a>");
				%>
			<%
				}
			%>
			<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>
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