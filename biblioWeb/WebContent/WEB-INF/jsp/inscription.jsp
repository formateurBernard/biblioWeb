<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head/head.jsp"></jsp:include>
<title>inscription</title>
</head>
<body onload="initPage()">
	<div id="page">
		<jsp:include page="header/header.jsp"></jsp:include>
		<jsp:include page="nav/nav.jsp"></jsp:include>
		<div id="content">
			<jsp:include page="left/left.jsp"></jsp:include>
			<div id="center">
				<h1>Inscription au site</h1>
				<form action="inscription" id="inscriptionForm" method="post">
					<fieldset>
						<legend id="identite">Vous</legend>
						<span class="erreur">${sessionScope.error }</span>
						<p>
							<label for="civilite">civilit&eacute;</label> <input type="radio" id="civiliteM" name="civilite" value="M" 
							required="required" ${(sessionScope.utilisateur.civilite == 'M')?'checked="checked"':''}/>Mr
							<input type="radio" id="civiliteMME" name="civilite" value="Mme" ${(sessionScope.utilisateur.civilite == 'Mme')?'checked="checked"':''}/>
							Mme
						</p>

						<p>
							<label class="mandatory" title="saisir votre nom" for="nom">nom</label>
							<input type="text" id="nom" name="nom"
								placeholder="saisir votre nom" required="required" value="${sessionScope.utilisateur.nom }" />
						</p>
						<p>
							<label class="mandatory" for="prenom">pr&eacute;nom</label> <input
								type="text" id="prenom" name="prenom"
								placeholder="saisir votre pr&eacute;nom" required="required"
								onkeyup="changerCase(event,'toLower')" value="${sessionScope.utilisateur.prenom }"/>
						</p>
						<p>
							<label for="enfants">enfants</label> <input type="checkbox"
								id="enfants" name="enfants" onchange="majZoneEnfant(this)" />
							oui
						</p>
						<div id="zoneEnfants">
							<p>
								<label for="nbrEnfants">nombre enfants</label> <input
									onchange="majZoneInfoEnfant(this)" type="number"
									id="nbrEnfants" name="nbrEnfants" min="1" />
							</p>

						</div>
						<p>
							<label for="dateDeNaissance">date de naissance</label> <input
								type="date" id="dateDeNaissance" name="dateDeNaissance"
								min="2015-07-30" />
						</p>
						<p>
							<label for="dateDeNaissanceHeure">date de naissance et
								heure</label> <input type="datetime-local" id="dateDeNaissanceHeure"
								name="dateDeNaissanceHeure" />
						</p>
						<p>
							<label for="couleurFavorite">couleur favorite</label> <input
								type="color" id="couleurFavorite" name="couleurFavorite"
								onchange="majColor(this)" />
						</p>
						<p>
							<label for="email">email</label> <input type="email" id="email"
								name="email" value="${sessionScope.utilisateur.email }"/>
						</p>
						<p>
							<label class="mandatory" for="password">password</label> <input
								type="password" id="password" name="password"
								required="required" onchange="validerPassword(this)" />
						</p>
						<p>
							<label class="mandatory" for="confirmPassword">confirmation
								du password</label> <input type="password" id="confirmPassword"
								name="confirmPassword" required="required"
								onchange="validerPassword(this)" /><img id="oeilPassword"
								onclick="changerOeil(this)" class="oeil" src="images/oeil.png" />
							<span id="erreur" class="erreur"></span>
						</p>
						<p>
							<label for="fichier">fichier</label> <input type="file"
								id="fichier" name="fichier" />
						</p>
						<p>
							<label for="fichierMultiple">fichier Multiple</label> <input
								type="file" id="fichierMultiple" name="fichierMultiple"
								multiple="multiple" />
						</p>
						<p>
							<label for="urlSitePerso">site Perso</label> <input type="url"
								id="urlSitePerso" name="urlSitePerso" />
						</p>
						<p>
							<label for="intervalle">intervalle</label> <input type="range"
								id="intervalle" name="intervalle" step="2" />
						</p>
						<p>
							<label for="tel">tel</label> <input type="tel" id="tel"
								name="tel" placeholder="ex 06-02-03-04-05"
								pattern="([0-9]{2}-){4}[0-9]{2}" />
						</p>
						<p>
							<label for="tel">button</label> <input type="button"
								value="clickez dessus" onclick="alert('on m a clicke dessus')" />
						</p>
						<p>
							<label for="search">search</label> <input type="search"
								onkeyup="changerCase(event,'toUpper')" />
						</p>
						<p>
							<input name="cache" value="champ cache" type="hidden" />
						</p>
					</fieldset>

					<fieldset>
						<legend>Adresse</legend>
						<p>
							<label for="pays"></label> <select name="pays">
								<option value=""></option>
								<optgroup label="europe">
									<option value="Fr">France</option>
									<option value="It">Italie</option>
								</optgroup>
								<optgroup label="Asie">
									<option value="Ph">Philippines</option>
									<option value="Cn">Chine</option>
								</optgroup>
								<optgroup label="Afrique">
									<option value="Cv">Cap vert</option>
								</optgroup>
							</select>
						</p>


						<div id="villes">
							<ul id="listeGauche" ondrop="drop(event)" ondragover="allowDrop(event)">
								<li id="antibes" value="antibes" draggable="true" ondragstart="drag(event)">Antibes</li>
								<li id="nice" value="nice" draggable="true" ondragstart="drag(event)">Nice</li>
							</ul>
							<button value="listeGauche" onclick="passerLis(this)">&lt;=</button>
							<button value="listeDroite" onclick="passerLis(this)">=&gt;</button>
							<ul id="listeDroite" ondrop="drop(event)" ondragover="allowDrop(event)"></ul>
						</div>
						<p>
							<label for="zipCode">zip code</label> <input type="text"
								id="zipCode" name="zipCode" pattern="[0-9][0-9][0-9][0-9][0-9]" />
						</p>
					</fieldset>
					<fieldset>
						<legend>Remarques</legend>
						<textarea rows="10" cols="40" name="remarques"
							style="resize: vertical;"></textarea>
					</fieldset>
					<input type="reset" /> <input type="submit" value="Envoyer" />
				</form>
				<a href="#page">haut</a>
			</div>
			<div id="right">right</div>
		</div>
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>