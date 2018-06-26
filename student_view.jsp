
<%
	// 강의 수강하는 학생 정보
%>

<%@ page pageEncoding="UTF-8"%>
<%@include file="menu.jsp"%>

<%
	//String cno=(String)session.getAttribute("cno");
	ArrayList<Account> acc_list2 = new ArrayList<Account>();
	ArrayList<Account> acc_list3 = new Account().getstudent();
	ArrayList<Course_Registration> cour_reg_list2 = new Course_Registration().getstudent();
	//String cno=request.getParameter("cno");
	for (Course_Registration reg : cour_reg_list2) {
		//if( reg.cno.equals(request.getParameter("cno")) )
		if (request.getParameter("cno").equals(reg.cno))
		//	if( cno.equals(reg.cno ))
		{
			for (Account acc : acc_list3) {
				if (acc.id == reg.sid) {
					acc_list2.add(acc);
					//out.println(alertToBack("로그인 실패"));
					break;
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
			<td><div class="twelve wide column">
					<%
						for (Account acc : acc_list2) {
					%>
					<div class="ui segment">
						<%="학번 : " + acc.id + " 이름 : " + acc.name + " 이메일 : " + acc.mail
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"%>
						<%
							String cno = request.getParameter("cno");
						%>
						<button type="button" class="ui basic black button"
							onclick="sendMail('<%=acc.mail%>','<%=cno%>');">메일보내기</button>

					</div>
					<%
						}
					%>
				</div></td>
		</tr>
	</table>

	<footer>
		<img src="images/down.jpg" style="width: 60%; align: bottom;">
	</footer>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
	<script type="text/javascript">
		function sendMail(mail, cno) {
			var html = "mail_write.jsp?to=" + mail + "&cno=" + cno;
			location.href = html;
		}
	</script>
</body>
</html>