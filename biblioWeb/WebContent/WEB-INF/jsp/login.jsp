<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head/head.jsp"></jsp:include>
<title>login</title>
</head>
<body onload="initPage()">
	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>login au site</h1>
				<form action="j_security_check" method="post" id="loginForm">
					<fieldset>
						<p>
							<label class="mandatory" title="saisir votre login" for="j_username">nom</label>
							<input type="text" id="j_username" name="j_username"
								placeholder="saisir votre login" required="required" />
						</p>
						<p>
							<label class="mandatory" for="j_password">password</label> <input
								type="password" id="j_password" name="j_password"
								required="required" />
						</p>
					</fieldset>
					<input type="submit" value="Envoyer" />
				</form>
				<a href="#page">haut</a>
			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>