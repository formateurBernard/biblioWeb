<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp" %>
<jsp:useBean id="modele" type="java.lang.String" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head/head.jsp"></jsp:include>
<title>accueil biblioWeb</title>
</head>
<body onload="initPage()">
	<div id="pub">pub</div>
	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>Accueil</h1>
			<%out.print(request.getAttribute("modele"));
			
			%>
			<%=request.getAttribute("modele") %>
			<%=modele %>
			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>