
<%
	// 강의 게시판
%>

<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="menu.jsp"%>

<%
	ArrayList<Board> board_list2 = new ArrayList<Board>();
	Board chosen = new Board();
	String professor_name = null;
	System.out.println(request.getParameter("title"));
	for (Board b : board_list) {
		if (b.cno.equals(request.getParameter("cno"))) {
			//board_list2.add(b);
			String url_title = request.getParameter("title");
			url_title = url_title.substring(0, url_title.length() - 1);

			if (b.title.equals(url_title)) {
				//System.out.println(b.title);
				chosen.title = b.title;
				chosen.dialog = b.dialog;
				if (b.contents != null) {
					chosen.contents = b.contents;
				}
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test",
						"test");

				Statement stmt;

				stmt = conn.createStatement();
				ResultSet rs;
				rs = stmt.executeQuery("select professor_name from professor where professor_id=" + b.pid);
				while (rs.next()) {
					professor_name = rs.getString("professor_name");

				}
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
			<td width="78%">
				<div class="twelve wide column">
					<table style="width: 100%; text-align: left;">
						<tr>
							<td><div class="ui segment"
									style="background-color: rgb(150, 150, 150); color: white">
									<h3><%=chosen.title%></h3>
								</div></td>
						</tr>
						<tr>
							<td><div class="ui segment">
									<h5>
										작성자 :
										<%=professor_name%></h5>
								</div></td>
						</tr>
						<tr>
							<td><div class="ui segment" style="height: 300px">
									<%=chosen.dialog%></div></td>
						</tr>
					</table>
					<div style="float: left; padding-top: 10px; display: inline;">
						<%
							if (chosen.contents != null && chosen.contents.length() > 2)
								out.println("첨부파일 : (<a href='download.jsp?file_name=" + chosen.contents + "'>" + chosen.contents
										+ "</a>)");
						%>
					</div>

					<br /> <br />
					<%
						if (Integer.parseInt(session.getAttribute("group").toString()) == 1) {
					%>
					<button type="button" class="ui button"
						onclick="location.href='board_list_view.jsp?cno=<%=request.getParameter("cno")%>';">목록</button>
					<%
						}
					%>
				</div>
			</td>
		</tr>
	</table>

	<div>
		<img src="images/down.jpg" style="width: 60%; align: bottom;">
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
</body>
</html>