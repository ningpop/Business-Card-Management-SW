<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BusinessCard.TestData"%>
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
		BusinessCard bc = TestData.getInstance().getOneBC(id);
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
					<td style="width: 10%;">아이디</td>
					<td style="width: 40%;"><%=bc.getId()%></td>
					<td style="width: 10%;">이름</td>
					<td style="width: 40%;"><%=bc.getName()%></td>
				</tr>
				<tr>
					<td style="width: 10%;">회사 </td>
					<td style="width: 40%;"><%=bc.getCompany()%></td>
					<td style="width: 10%;">전화번호</td>
					<td style="width: 40%;"><%=bc.getPhone()%></td>
				</tr>
				<tr>
					<td style="width: 10%;">부서</td>
					<td style="width: 40%;"><%=bc.getTeam() %></td>
					<td style="width: 10%;">직급</td>
					<td style="width: 40%;"><%= bc.getPosition()%></td>
				</tr>
				<tr>
					<td style="width: 10%;">이메일</td>
					<td style="width: 40%;"><%= bc.getEmail()%></td>
					<td style="width: 10%;">주소</td>
					<td style="width: 40%;"><%= bc.getAddress()%></td>
				</tr>
				<tr>
					<td style="width: 10%;">우편번호</td>
					<td style="width: 40%;"><%= bc.getZip()%></td>
					<td style="width: 10%;">팩스</td>
					<td style="width: 40%;"><%= bc.getFax()%></td>
				</tr>
				<tr>
					<td style="width: 10%;">회사 전화</td>
					<td style="width: 40%;"><%= bc.getTelephone()%></td>
					<td style="width: 10%;">업종</td>
					<td style="width: 40%;"><%= bc.getBusinessType()%></td>
				</tr>
				<tr>
					<td style="width: 10%;">저장 일자</td>
					<td style="width: 40%;"><%=format.format(bc.getSavedTime())%></td>
				</tr>
			</table>
			<button class="previousButton" onclick="history.back()">이전</button>
		</div>
	</div>
</body>
</html>