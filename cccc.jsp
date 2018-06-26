<% // 로그인 화면 구성 %>

<%@ page pageEncoding="UTF-8" %>
<%@include file="account.jsp" %>
<%@include file="board.jsp" %>
<%@include file="course.jsp" %>
<%@include file="course_registration.jsp" %>

<%@include file="tool.jsp" %>

<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css">
</head>
<body>
	<div class="ui container">
		<div class="ui middle aligned center aligned grid" style="margin-top: 75px;">
			<div class="column" style="max-width: 450px;">
				<img src="https://info.kw.ac.kr/include/images/logo.gif" alt="" style="margin-bottom: 25px;">
				<form action="login.jsp" method="post" class="ui form">
					<div class="ui field" style="margin-bottom:10px">
						<label for=""></label>
						<input type="text" name="id" placeholder="학번">
					</div>
					<div class="ui field" style="margin-bottom:25px">
						<label for=""></label>
						<input type="password" name="pw" placeholder="비밀번호">
					</div>
						<button class="ui black basic button">LOGIN</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
</body>
</html>