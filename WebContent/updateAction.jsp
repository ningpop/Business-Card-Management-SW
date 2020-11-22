<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BusinessCard.BusinessCard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BusinessCard.BusinessCardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

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
	
	int bcId = 0;
	if (request.getParameter("bcId") != null) {
		bcId = Integer.parseInt(request.getParameter("bcId"));
	}
	BusinessCard bc = new BusinessCardDAO().getOne(bcId, userId);
	boolean result = dao.update(bcId, bc.getName(), bc.getPhone(), bc.getTeam(),
			bc.getPosition(), bc.getEmail(), bc.getCompany(), bc.getAddress(),
			bc.getZip(), bc.getFax(), bc.getTelephone(), bc.getBusinessType());
	if (result == true) {
		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("location.href='index.jsp'");

		//script.println("history.back()");

		script.println("</script>");
	}
	%>
</body>
</html>