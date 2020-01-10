<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head/head.jsp"></jsp:include>
<title>inscription OK</title>
</head>
<body onload="initPage()">
	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>Inscription OK</h1>
				<p>${sessionScope.civilite } ${sessionScope.nom } ${sessionScope.prenom } est bien inscrit(e).</p>
				<a href="#page">haut</a>
			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>