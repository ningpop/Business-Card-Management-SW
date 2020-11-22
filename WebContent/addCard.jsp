<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BusinessCard.BusinessCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BusinessCard.BusinessCardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명함관리</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<%
	boolean isLogin;
		String name = (String) session.getAttribute("name");
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	if (name == null || username == null || password == null) {
		response.sendRedirect("./login.jsp");
		isLogin = false;
	}
	else {
		isLogin = true;
	}
	String param = request.getParameter("page");
	String search = request.getParameter("search");
	BusinessCardDAO dao = new BusinessCardDAO();
	ArrayList<BusinessCard> list;
	int nowPage;
	if (param == null || param.equals("") || param.equals("null"))
		nowPage = 1;
	else
		nowPage = Integer.parseInt(param);
	if (search == null || search.equals("") || search.equals("null")) {
		list = dao.getLists(nowPage);
		search = "";
	} else
		list = dao.searchByName(search, nowPage);
	int endPage = dao.getCount() / 10 + 1;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<div class="header">
		<div class="responsive">
			<div class="wrapper">
				<div onclick="location.href='index.jsp'" class="logo">BUSINESS CARD</div>
				<%
					if (isLogin) {
				%>
				<button class="authButton" onclick="location.href='LogoutServlet'">로그아웃</button>
				<%
					} else {
				%>
				<button class="authButton" onclick="location.href='login.jsp'">로그인</button>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="spacer"></div>
	<div class="responsive">
		<div class="title">
			<h1 class="name">명함 등록하기</h1>
		</div>
		
		<form action="AddCardServlet" method="post">
			<input placeholder="이름" class="" name="name" /><br>
			<input placeholder="휴대폰번호" class="" name="phone" /><br>
			<input placeholder="부서" class="" name="team" /><br>
			<input placeholder="직급" class="" name="position" /><br>
			<input placeholder="이메일주소" class="" name="email" /><br>
			<input placeholder="회사명" class="" name="company" /><br>
			<input placeholder="회사 주소" class="" name="address" /><br>
			<input placeholder="회사 우편번호" class="" name="zip" /><br>
			<input placeholder="회사 전화번호" class="" name="telephone" /><br>
			<input placeholder="회사 팩스번호" class="" name="fax" /><br>
			<input placeholder="업종명" class="" name="businessType" /><br>
			<!-- <input type="hidden" name='userNum' value="${param.num }"/> -->
			<button class="authButton" type="submit">등록</button>
		</form>
		
		
	</div>
</body>
</html>