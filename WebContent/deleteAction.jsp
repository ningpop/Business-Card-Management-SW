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
	BusinessCardDAO bcDAO = new BusinessCardDAO();
	boolean result = bcDAO.delete(bcId);
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