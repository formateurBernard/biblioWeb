<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="left">
	<c:if test="${not empty pageContext.request.userPrincipal}">
		<p>${sessionScope.utilisateur.civilite } ${sessionScope.utilisateur.prenom } ${sessionScope.utilisateur.nom }</p>
		<a href="deconnexion" target="_self">deconnexion</a>
	</c:if>
</div>