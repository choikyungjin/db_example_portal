
<%
	//메인 화면
%>

<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
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
					<form action="board_add.jsp" method="post"
						enctype="multipart/form-data" class="ui form">
						<input type="hidden" name="cno"
							value="<%=request.getParameter("cno")%>">
						<div class="field">
							<input type="text" name="title" placeholder="강의자료 제목">
						</div>
						<div class="field">
							<textarea type="text" name="dialog" placeholder="강의자료 제목"></textarea>
						</div>
						<div class="field">
							<input type="file" name="contents" placeholder="첨부파일1">
						</div>

						<button type="submit" class="ui button">UPLOAD</button>
					</form>
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