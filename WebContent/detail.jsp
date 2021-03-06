<%@page import="businesscard.BusinessCardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="businesscard.BusinessCard"%>
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
		boolean isLogin;
	int userId = -1;
	String name = (String) session.getAttribute("name");
	String username = (String) session.getAttribute("username");
	if (name == null || username == null) {
		response.sendRedirect("/login.jsp");
		isLogin = false;
	} else {
		isLogin = true;
		userId = Integer.parseInt((String)session.getAttribute("id"));
	}
	
	int id = Integer.parseInt(request.getParameter("id"));
	BusinessCardDAO dao = new BusinessCardDAO();
	BusinessCard bc = dao.getOne(id, userId);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<div class="header">
		<div class="responsive">
			<div class="wrapper">
				<div onclick="location.href='index.jsp'" class="logo">BUSINESS CARD</div>
				<%
					if (isLogin) {
				%>
				<button class="authButton" onclick="location.href='/LogoutServlet'">로그아웃</button>
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
					<td class="name">회사</td>
					<td class="body"><%=bc.getCompany()%></td>
					<td class="name">전화번호</td>
					<td class="body"><%=bc.getPhone()%></td>
				</tr>
				<tr>
					<td class="name">부서</td>
					<td class="body"><%=bc.getTeam()%></td>
					<td class="name">직급</td>
					<td class="body"><%=bc.getPosition()%></td>
				</tr>
				<tr>
					<td class="name">이메일</td>
					<td class="body"><%=bc.getEmail()%></td>
					<td class="name">주소</td>
					<td class="body"><%=bc.getAddress()%></td>
				</tr>
				<tr>
					<td class="name">우편번호</td>
					<td class="body"><%=bc.getZip()%></td>
					<td class="name">팩스</td>
					<td class="body"><%=bc.getFax()%></td>
				</tr>
				<%
					int length;
				String str = "";
				if (bc.getBusinessType().size() > bc.getTelephone().size())
					length = bc.getBusinessType().size();
				else
					length = bc.getTelephone().size();
				for (int i = 0; i < length; i++) {
				%>
				<tr>
					<td class="name">
						<%
							if (i < bc.getTelephone().size()) {
						%>회사 전화 <%=i + 1%> <%
					 	}
					 %>
					</td>
					<td class="body">
						<%
							if (i >= bc.getTelephone().size())
							str = "";
						else
							str = bc.getTelephone().get(i);
						%> <%=str%>
					</td>
					<td class="name">
						<%
							if (i < bc.getBusinessType().size()) {
						%>업종 <%=i + 1%> <%
					 	}
					 %>
					</td>
					<td class="body">
						<%
							if (i >= bc.getBusinessType().size())
							str = "";
						else
							str = bc.getBusinessType().get(i);
						%> <%=str%></td>
				</tr>
				<%
					}
				%>
			</table>
			<div class="date">
				등록일:
				<%=format.format(bc.getSavedTime())%></div>
			<button class="authButton" onclick="location.href='updateCard.jsp?bcId=<%=id%>'">수정</button>
			<button class="authButton" onclick="location.href='DeleteCardServlet?bcId=<%=id%>'">삭제</button>
			<button class="previousButton" onclick="history.back()">이전</button>
		</div>
	</div>
</body>
</html>