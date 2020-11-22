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
	int id = -1;
	String name = (String) session.getAttribute("name");
	String username = (String) session.getAttribute("username");
	if (name == null || username == null) {
		response.sendRedirect("./login.jsp");
		isLogin = false;
	}
	else {
		isLogin = true;
		id = Integer.parseInt((String)session.getAttribute("id"));
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
	int endPage;
	if (search == null || search.equals("") || search.equals("null")) {
		list = dao.getLists(nowPage, id);
		search = "";
		endPage = dao.getCount() / 10 + 1;
	} else {
		list = dao.searchByName(search, nowPage);
		endPage = dao.getCount(search) / 10 + 1;
	}
	
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
			<h1 class="name">명함관리</h1>
			<div>
				<input placeholder="이름으로 검색" class="search" id="target"
					value="<%=search%>" />
				<button class="searchButton" onclick="search()">검색</button>
				
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
				<%
					if (list != null)
					for (BusinessCard bc : list) {
				%>
				<tr onclick="location.href='detail.jsp?id=<%=bc.getId()%>'"
					style="cursor: pointer;">
					<td><%=bc.getId()%></td>
					<td><%=bc.getName()%></td>
					<td><%=bc.getCompany()%></td>
					<td><%=bc.getPhone()%></td>
					<td><%=format.format(bc.getSavedTime())%></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
		<div>
			<button class="createButton" onclick="location.href='addCard.jsp'">명함등록</button>
		</div>
		<div class="page">
			<%
				int firstPage = ((nowPage - 1) / 5) * 5 + 1;

			if (firstPage != 1) {
			%>
			<button class="pagenumber"
				onclick="location.href='/?page=<%=firstPage - 1%><%=search != "" ? "&search=" + search : "" %>'">이전</button>
			<%
				}
			String className;
			int last = firstPage + 4;
			if (last > endPage)
			last = endPage;
			for (int i = firstPage; i <= last; i++) {
			if (i == nowPage)
				className = "pagenumber active";
			else
				className = "pagenumber";
			%>
			<button class="<%=className%>"
				onclick="location.href='/?page=<%=i%><%=search != "" ? "&search=" + search : "" %>'"><%=i%></button>

			<%
				}
			System.out.println(firstPage + " " + (((endPage - 1) / 5) * 5 + 1));
			System.out.println(firstPage == (((endPage - 1) / 5) * 5 + 1));
			if (firstPage != ((endPage - 1) / 5) * 5 + 1) {
			%>
			<button class="pagenumber"
				onclick="location.href='/?page=<%=firstPage + 5%><%=search != "" ? "&search=" + search : "" %>'">다음</button>
			<%
				}
			%>
			
		</div>
	</div>
	<script>
		const search = () => {
			const target = document.getElementById("target").value;
			location.href='/?search=' + target;
		}
	</script>
</body>
</html>