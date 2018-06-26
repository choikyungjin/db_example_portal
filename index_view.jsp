
<%
	//로그인 화면
%>

<%
	//@page pageEncoding="utf-8"
%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="account.jsp"%>
<%@include file="board.jsp"%>
<%@include file="course.jsp"%>
<%@include file="course_registration.jsp"%>
<%@include file="tool.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="./cssFile/index_style.css">

</head>
<body>
	<img src="images/login_background.jpg">
	<div class="container">

		<form class="form-signin" action="login.jsp">
			<div id="logo" align="center">
				<a href="index.jsp"><img src="images/kw_logo.jpg"
					style="width: 230px; height: 60px;"></a>
			</div>

			<h2 class="form-signin-heading" style="padding-bottom: 20px;">U-CAMPUS LOGIN</h2>
			<div>
				<select name="div" id="gubun_code">
					<option value=1>학생</option>
					<option value=2>교수</option>
				</select>
			</div>
			<label for="inputEmail" class="sr-only">학번</label> <input
				class="form-control" placeholder="ID" name="id" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" name="pw" class="form-control"
				placeholder="PW" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>
	</div>


		<script type="text/javascript"
			src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript"
			src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
		<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>