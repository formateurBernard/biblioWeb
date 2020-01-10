<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head/head.jsp"></jsp:include>
<title>contact</title>
</head>
<body>
	<div id="pub">pub</div>
	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>Contact</h1>

				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2888.808892111189!2d7.016820215496361!3d43.61052057912276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12cc2a320d9f2715%3A0x4573a54d15d48577!2sAvenue%20Maurice%20Donat%2C%20Mougins!5e0!3m2!1sfr!2sfr!4v1576682677594!5m2!1sfr!2sfr"
					width="600" height="450" frameborder="0" style="border: 0;"
					allowfullscreen=""></iframe>

			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>