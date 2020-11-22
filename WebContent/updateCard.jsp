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
	int userId = -1;
		String name = (String) session.getAttribute("name");
	String username = (String) session.getAttribute("username");
	if (name == null || username == null) {
		response.sendRedirect("./login.jsp");
		isLogin = false;
		
	}
	else {
		isLogin = true;
		userId = Integer.parseInt((String)session.getAttribute("id"));
	}
	BusinessCardDAO dao = new BusinessCardDAO();
	

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	int bcId = 0;
	if (request.getParameter("bcId") != null) {
		bcId = Integer.parseInt(request.getParameter("bcId"));
	}
	BusinessCard bc = dao.getOne(bcId, userId);
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
			<h1 class="name">명함 수정하기</h1>
		</div>
		
		<form action="updateAction.jsp?bcId=<%= bcId %>" method="post">
			<input placeholder="이름" class="" name="name" value="<%= bc.getName() %>" /><br>
			<input placeholder="휴대폰번호" class="" name="phone" value="<%= bc.getPhone() %>" /><br>
			<input placeholder="부서" class="" name="team" value="<%= bc.getTeam() %>" /><br>
			<input placeholder="직급" class="" name="position" value="<%= bc.getPosition() %>" /><br>
			<input placeholder="이메일주소" class="" name="email" value="<%= bc.getEmail() %>" /><br>
			<input placeholder="회사명" class="" name="company" value="<%= bc.getCompany() %>" /><br>
			<input placeholder="회사 주소" class="" name="address" value="<%= bc.getAddress() %>" /><br>
			<input placeholder="회사 우편번호" class="" name="zip" value="<%= bc.getZip() %>" /><br>
			<input placeholder="회사 전화번호" class="" name="telephone[]" value="<%= bc.getTelephone().size() <=0 ? "" : bc.getTelephone().get(0) %>" /><button onclick="telephone()" type="button">+</button><br>
			<div id="telephone">
			<%
				for(int i = 1; i < bc.getTelephone().size();i++) {
					%>
						<input placeholder="회사 전화번호 <%=i %>" class="" name="telephone[]" value="<%= bc.getTelephone().get(i) %>" /><br/>
					<%
				}
			%>
			</div>
			<input placeholder="회사 팩스번호" class="" name="fax" value="<%= bc.getFax() %>" /><br>
			<input placeholder="업종명" class="" name="type[]" value="<%=bc.getBusinessType().size() <= 0 ? "" : bc.getBusinessType().get(0) %>" /><button onclick="addType()" type="button">+</button><br>
			<div id="type">
			<%
				for(int i = 1; i < bc.getBusinessType().size();i++) {
					%>
						<input placeholder="업종명 <%=i %>" class="" name="type[]" value="<%= bc.getBusinessType().get(i) %>" /><br/>
					<%
				}
			%>
			</div>
			<button class="authButton" type="submit">수정</button>
		</form>
		
		
	</div>
	<script>
		let i = 1;
		const telephone = () => {
			const telephoneDiv = document.getElementById("telephone");
			const clone = document.createElement("input");
			const br = document.createElement("br");
			clone.placeholder = '회사 전화번호 ' + i++;
			clone.name = "telephone[]";
			telephoneDiv.appendChild(clone);
			telephoneDiv.appendChild(br);
		}
		
		
	</script>
	<script>
		let j = 1;
		const addType = () => {
			const typeDiv = document.getElementById("type");
			const clone = document.createElement("input");
			const br = document.createElement("br");
			clone.placeholder = '업종명 ' + j++;
			clone.name = "type[]";
			typeDiv.appendChild(clone);
			typeDiv.appendChild(br);
		}
	</script>
</body>
</html>