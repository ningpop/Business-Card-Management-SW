<%@page import="BusinessCard.BusinessCardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BusinessCard.BusinessCard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/detail.css">
</head>
<body>
	<%
		boolean isLogin = false;
		int id = Integer.parseInt(request.getParameter("id"));
		BusinessCardDAO dao = new BusinessCardDAO();
		BusinessCard bc = dao.getOne(id);
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
			<h1>상세 정보</h1>
			<table>
				<tr>
					<td class="name">아이디</td>
					<td class="body"><%=bc.getId()%></td>
					<td class="name">이름</td>
					<td class="body"><%=bc.getName()%></td>
				</tr>
				<tr>
					<td class="name">회사 </td>
					<td class="body"><%=bc.getCompany()%></td>
					<td class="name">전화번호</td>
					<td class="body"><%=bc.getPhone()%></td>
				</tr>
				<tr>
					<td class="name">부서</td>
					<td class="body"><%=bc.getTeam() %></td>
					<td class="name">직급</td>
					<td class="body"><%= bc.getPosition()%></td>
				</tr>
				<tr>
					<td class="name">이메일</td>
					<td class="body"><%= bc.getEmail()%></td>
					<td class="name">주소</td>
					<td class="body"><%= bc.getAddress()%></td>
				</tr>
				<tr>
					<td class="name">우편번호</td>
					<td class="body"><%= bc.getZip()%></td>
					<td class="name">팩스</td>
					<td class="body"><%= bc.getFax()%></td>
				</tr>
				<tr>
					<td class="name">회사 전화</td>
					<td class="body"><%= bc.getTelephone()%></td>
					<td class="name">업종</td>
					<td class="body"><%= bc.getBusinessType()%></td>
				</tr>
			</table>
			<div class="date">등록일: <%=format.format(bc.getSavedTime())%></div>
			<button class="previousButton" onclick="history.back()">이전</button>
		</div>
	</div>
</body>
</html>