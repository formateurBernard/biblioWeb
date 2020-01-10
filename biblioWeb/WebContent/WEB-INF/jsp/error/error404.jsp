<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head/head.jsp"></jsp:include>
<title>error 404</title>
</head>
<body onload="initPage()">
	<div id="page">
		<jsp:include page="../header/header.jsp"></jsp:include>
		<jsp:include page="../nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="../left/left.jsp"></jsp:include>
			<div id="center">
				<h1>error 404</h1>
					<p>page not found</p>
			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>