<%@page import="java.text.SimpleDateFormat"%>
<%@page import="businesscard.BusinessCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="businesscard.BusinessCardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명함관리</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/addandupdate.css">
</head>
<body>
	<%
		boolean isLogin;
	String name = (String) session.getAttribute("name");
	String username = (String) session.getAttribute("username");
	if (name == null || username == null) {
		response.sendRedirect("./login.jsp");
		isLogin = false;
	} else {
		isLogin = true;
	}

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<div class="header">
		<div class="responsive">
			<div class="wrapper">
				<div onclick="location.href='index.jsp'" class="logo">BUSINESS
					CARD</div>
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
		<div class="block">
			<div class="box">
				<a class="logo-area" href="/">BUSINESS CARD</a>
				<div>
					<h3>명함 등록</h3>
					<form action="AddCardServlet" method="post">
						<p>이름</p><input placeholder="이름" class="input" name="name" />
						<p>휴대폰번호</p><input placeholder="휴대폰번호" class="input" name="phone" /> 
						<p>부서</p><input placeholder="부서" class="input" name="team" />
						<p>직급</p><input placeholder="직급" class="input" name="position" />
						<p>이메일주소</p><input placeholder="이메일주소" class="input" name="email" /><br />
						<p>회사명</p><input placeholder="회사명" class="input" name="company" />
						<p>회사</p><input placeholder="회사 주소" class="input" name="address" /> 
						<p>회사 우편번호</p><input placeholder="회사 우편번호" class="input" name="zip" />
						<p>회사 팩스번호</p><input placeholder="회사 팩스번호" class="input" name="fax" />
						<p>회사 전화번호</p><input placeholder="회사 전화번호" class="input withbutton" name="telephone[]" />
						<button onclick="telephone()" type="button" class="plusButton">+</button>
						<div id="telephone"></div>
						<p>업종명</p><input placeholder="업종명" class="input withbutton" name="type[]" />
						<button onclick="addType()" type="button" class="plusButton">+</button>
						<div id="type"></div>
						<button class="submitButton" type="submit">등록</button>
					</form>
				</div>
			</div>
		</div>

	</div>

	<script>
		let i = 1;
		const telephone = () => {
			const telephoneDiv = document.getElementById("telephone");
			const clone = document.createElement("input");
			clone.placeholder = '회사 전화번호 ' + i++;
			clone.name = "telephone[]";
			clone.className = "input withbutton";
			const children = telephoneDiv.getElementsByTagName("input");
			if(children.length !== 0) {
				const button = document.getElementById("telephoneButton");
				telephoneDiv.appendChild(clone);
				telephoneDiv.appendChild(button);
			}
			else {
				const button = document.createElement("button");
				button.type = "button";
				button.className = "plusButton";
				button.id = "telephoneButton";
				button.onclick = deleteTelephone;
				button.innerHTML = "-"
				telephoneDiv.appendChild(clone);
				telephoneDiv.appendChild(button);
			}
			
		}
		
		const deleteTelephone = () => {
			const telephoneDiv = document.getElementById("telephone");
			const children = telephoneDiv.getElementsByTagName("input");
			if(children.length <= 1) {
				while ( telephoneDiv.hasChildNodes() ) { 
					telephoneDiv.removeChild( telephoneDiv.firstChild );
				}
			}
			else {
				telephoneDiv.removeChild(children[children.length - 1]);
			}
			i--;
		}
	</script>
	<script>
		let j = 1;
		const addType = () => {
			const typeDiv = document.getElementById("type");
			const clone = document.createElement("input");
			clone.placeholder = '업종명 ' + j++;
			clone.name = "type[]";
			clone.className = "input withbutton";
			const children = typeDiv.getElementsByTagName("input");
			if(children.length !== 0) {
				const button = document.getElementById("typeButton");
				typeDiv.appendChild(clone);
				typeDiv.appendChild(button);
			}
			else {
				const button = document.createElement("button");
				button.type = "button";
				button.className = "plusButton";
				button.id = "typeButton";
				button.onclick = deleteType;
				button.innerHTML = "-"
				typeDiv.appendChild(clone);
				typeDiv.appendChild(button);
			}
		}
		const deleteType = () => {
			const typeDiv = document.getElementById("type");
			const children = typeDiv.getElementsByTagName("input");
			if(children.length <= 1) {
				while ( typeDiv.hasChildNodes() ) { 
					typeDiv.removeChild( typeDiv.firstChild );
				}
			}
			else {
				typeDiv.removeChild(children[children.length - 1]);
			}
			j--;
		}
	</script>
</body>
</html>