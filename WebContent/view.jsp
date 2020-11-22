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
	
	int bcId = 0;
	if (request.getParameter("bcId") != null) {
		bcId = Integer.parseInt(request.getParameter("bcId"));
	}
	BusinessCard bc = new BusinessCardDAO().getBusinessCard(bcId);
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
			<h1 class="name">명함 자세히 보기</h1>
		</div>
		<div>
			<p>이름: <%= bc.getName() %></p>
			<p>휴대폰번호: <%= bc.getPhone() %></p>
			<p>부서: <%= bc.getTeam() %></p>
			<p>직급: <%= bc.getPosition() %></p>
			<p>이메일주소: <%= bc.getEmail() %></p>
			<p>회사명: <%= bc.getCompany() %></p>
			<p>회사주소: <%= bc.getAddress() %></p>
			<p>회사우편번호: <%= bc.getZip() %></p>
			<p>회사전화번호: <%= bc.getTelephone() %></p>
			<p>회사팩스번호: <%= bc.getFax() %></p>
			<p>업종명: <%= bc.getBusinessType() %></p>
			<p>등록한 시간: <%= bc.getSavedTime() %></p>
		</div>
		<div>
			<button class="authButton" onclick="location.href='updateCard.jsp?bcId=<%= bcId %>'">수정하기</button>
			<button class="authButton" onclick="location.href='deleteAction.jsp?bcId=<%= bcId %>'">삭제하기</button>
		</div>
	</div>
</body>
</html>