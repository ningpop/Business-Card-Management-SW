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
		boolean isLogin = false;
		BusinessCardDAO dao = new BusinessCardDAO();
		ArrayList<BusinessCard> list = dao.getLists();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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
	<div class="responsive">
		<div class="title">
			<h1 class="name">명함관리</h1>
			<div>
				<input placeholder="검색어" class="search" />
				<button class="searchButton">검색</button>
			</div>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>회사명</th>
					<th>전화 번호</th>
					<th>저장 일자</th>
				</tr>
			</thead>
			<tbody>
				<%for(BusinessCard bc:list) { %>
				<tr onclick="location.href='/detail.jsp?id=<%= bc.getId() %>'" style="cursor: pointer;">
					<td><%= bc.getId() %></td>
					<td><%= bc.getName() %></td>
					<td><%= bc.getCompany() %></td>
					<td><%= bc.getPhone() %></td>
					<td><%= format.format(bc.getSavedTime()) %></td>
				</tr>
				<%} %>
				
			</tbody>
		</table>
		<div class="page">1 2 3 4 5</div>
	</div>

</body>
</html>