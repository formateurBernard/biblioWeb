<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp" %>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="application/javascript" src="js/jquery.slim.min.js"></script>
<script type="application/javascript" src="js/bootstrap.min.js"></script>
<jsp:include page="head/head.jsp"></jsp:include>
<title>consultation</title>
</head>
<body onload="initPage()">
	<div id="pub">pub</div>
	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<nav aria-label="breadcrumb" style="z-index: 0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Accueil</a></li>
				<li class="breadcrumb-item active" aria-current="page">Consultation</li>
			</ol>
		</nav>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>Consultation</h1>
						<c:if  test='${not empty pageContext.request.userPrincipal && pageContext.request.isUserInRole("admin")}'>
								<a href="livreServlet?action=ajouter">ajouter un livre</a>
						</c:if>
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<table id="livres">
								<thead>
									<tr>
										<th>id</th>
										<th>isbn</th>
										<th>titre</th>
										<th>auteur</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>123-ERFF-23243</td>
										<td>java bean java bien en bouchon javascript</td>
										<td>HTML</td>
									</tr>
									<tr>
										<td>2</td>
										<td>123-ERFF-23243</td>
										<td>java bean java bien en bouchon javascript Bis</td>
										<td>HTML</td>
									</tr>
									<tr>
										<td>3</td>
										<td>123-ERFF-23243</td>
										<td>java bean java bien en bouchon javascript 3</td>
										<td>HTML</td>
									</tr>
									
									<c:forEach items="${requestScope.livres }" var="livre">
										<tr>
											<td><c:out value="${livre.id }"></c:out></td>
											<td><c:out value="${livre.isbn }"></c:out></td>
											<td><c:out value="${livre.titre }"></c:out></td>
											<td>
												<c:forEach items="${livre.auteurs }" var="auteur">
													<c:out value="${auteur.prenom }"></c:out> <c:out value="${auteur.nom }"></c:out> 	
													<br />
												</c:forEach>
											</td>
										</tr>
									</c:forEach>
									<%
									/* for (Livre livre : (List<Livre>) request.getAttribute("livres")) {
										out.write("<tr>");
										out.write("<td>" + livre.getId() + "</td>");
										out.write("<td>" + livre.getIsbn() + "</td>");
										out.write("<td>" + livre.getTitre() + "</td>");
										out.write("<td>" + "auteur" + "</td>");
										out.write("</tr>");
									}	 */
									
									
									%>
									
									
									
								</tbody>
							</table>
							<button onclick="getLivresAjax()">chercher livres AJAX</button>
						</div>
						<div class="carousel-item">
							<canvas id="histo" width="300px" height="400px"
								style="background-color: white">
							</canvas>
						</div>
						<div class="carousel-item">
							<img src="images/logo.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>