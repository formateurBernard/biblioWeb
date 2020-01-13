<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head/head.jsp"></jsp:include>
<title>livre</title>
</head>
<body onload="initPage()">

	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>Livre</h1>

				<form action="livreServlet" method="post">
					<p>
						<label class="mandatory" title="saisir votre isbn" for="isbn">isbn</label>
						<input type="text" id="isbn" name="isbn"
							placeholder="saisir votre isbn" required="required" />
					</p>
					<p>
						<label class="mandatory" title="saisir votre titre" for="titre">titre</label>
						<input type="text" id="titre" name="titre"
							placeholder="saisir votre titre" required="required" />
					</p>
					<input type="submit" value="Envoyer" />
				</form>
			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>