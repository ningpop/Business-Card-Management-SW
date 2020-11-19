<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<%
		boolean isLogin = false;
	%>
	<div class="header">
		<div class="responsive">
			<div class="wrapper">
				<div onclick="location.href='/'" class="logo">BUSINESS CARD</div>
				<%
					if (isLogin) {
				%>
				<button class="authButton" onclick="location.href='/'">로그아웃</button>
				<%
					} else {
				%>
				<button class="authButton" onclick="location.href='/login.jsp'">로그인</button>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="spacer"></div>
	<div class="block">
		<div class="box">
			<a class="logo-area" href="/">BUSINESS CARD</a>
			<div>
				<h3>로그인</h3>
				<form>
					<input class="input" autoComplete="username" name="username"
						placeholder="아이디" /> <input class="input"
						autoComplete="new-password" name="password" placeholder="비밀번호"
						type="password" /> <input class="input"
						autoComplete="new-password" name="passwordConfirm"
						placeholder="비밀번호 확인" type="password" />
					<button class="loginButton">회원가입</button>
				</form>
				<div class="footer">
					<a href="/login.jsp" class="link">로그인</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>