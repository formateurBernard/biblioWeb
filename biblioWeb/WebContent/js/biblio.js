function getLivresAjax() {
	//instantiation de l objet XHR
  var xhttp = new XMLHttpRequest();
  
  //declaration de la callback
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	//retour de la réponse avec un code bueno(200) 
    	//recuperation sur la page du tableau de livres
    	let tabLivresHTML= document.querySelector("#livres");
    	//récupératino de l'objetc
    	let livresJS=JSON.parse(this.responseText);
    	
    	insererTableauLivres(livresJS, tabLivresHTML);
    }
  };
  
  //preparatin de la requete
  xhttp.open("GET", "livres.json", true);
  
  //envoi de la requete
  xhttp.send();
}


function creerBouchonStorage(){
	
	let livre={
			"id":"4",
			"titre":"java bean java bien en bouchon storage",
			"isbn":"126-abg-126",
			"auteur":"storage"
	};
	
	 function Livre(id, titre, auteur)
	  {
	     this.id = id;
	     this.titre = titre;
	     this.auteur=auteur;
	  }
	  let livre2= new Livre("5", "java bean java bien en bouchon storage", "storage constructeur");
	  
	  livre2.isbn="123-abg-123";
	  livre2.afficher=function(){
		  console.log(JSON.stringify(this));
	  }
	  
	  livre2.afficher();
	  
	  //creation du tableau
	  let livres=new Array(livre,livre2);

	  //stockage dans le storage
	  localStorage.setItem("livres", JSON.stringify(livres));
	  
}

function insererTableauLivres(livresJS,tabLivresHTML){
	//recuperation du tbody
	let tbody= tabLivresHTML.querySelector("tbody");
	
	//remplissage du tableau HTML
	for (let livre of livresJS) {
		let chaineHTML="<tr><td>"+livre.id+"</td><td>"+livre.isbn+"</td><td>"+livre.titre+"</td><td>"+livre.auteur+"</td></tr>";
		//insertion dan sle tableau HTML
		tbody.insertAdjacentHTML("beforeend",chaineHTML);
	}
}


/**
 * 
 * @returns
 */
function remplirTableauLivres(){
	//recuperation sur la page du tableau de livres
	let tabLivresHTML= document.querySelector("#livres");
	//recuperation des livres dans le storage
	let livresString= localStorage.getItem("livres");
	//transformation en objet
	let livresJS=JSON.parse(livresString);
	
	//insertiojn dans le tableau HTML
	insererTableauLivres(livresJS, tabLivresHTML);
}


/**
 * 
 */
function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+ d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function getCookie(cname) {
	  var name = cname + "=";
	  var decodedCookie = decodeURIComponent(document.cookie);
	  var ca = decodedCookie.split(';');
	  for(var i = 0; i <ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return "";
	}


function majColor(couleurFavorite) {

	/*
	 * var lis= document.querySelectorAll("nav ul li"); for (var i = 0; i <
	 * lis.length; i++) { lis[i].style.backgroundColor=couleurFavorite.value;
	 * lis[i].style.cssText=lis[i].style.cssText+":hover{background-color:red;}"; }
	 */

	// let styleSheet = document.styleSheets[0];
	// styleSheet.insertRule("nav ul li {background-color:
	// "+couleurFavorite.value+";}", styleSheet.cssRules.length);
	let styleSheet = document.createElement("style");
	styleSheet.appendChild(document
			.createTextNode("nav ul li {background-color: "
					+ couleurFavorite.value + ";}"));
	styleSheet.appendChild(document
			.createTextNode("nav ul li:hover {background-color: green;}"));
	// Add the <styleSheet> element to the page
	document.head.appendChild(styleSheet);

}

function majZoneEnfant(enfants) {
	var zoneEnfants = document.querySelector("#zoneEnfants");

	zoneEnfants.style.display = (zoneEnfants.style.display == "") ? 'block'
			: "";
}

function creerInfoEnfant(i) {
	// creation des tags
	var p = document.createElement("p");
	var labelNom = document.createElement("label");
	var inputNom = document.createElement("input");
	var labelPrenom = document.createElement("label");
	var inputPrenom = document.createElement("input");

	// creation des attributs
	inputNom.setAttribute("type", "text");
	inputNom.setAttribute("name", "nomEnfant" + i);
	inputPrenom.setAttribute("type", "text");
	inputPrenom.setAttribute("name", "prenomEnfant" + i);

	// creation des noeuds texte
	labelNom.innerHTML = "nom enfant " + i;
	labelNom.className = "mandatory";
	labelPrenom.innerHTML = "prenom enfant " + i;
	labelPrenom.className = "mandatory";

	// ajout du label au paragraphe
	p.appendChild(labelNom);

	// ajout du input au paragraphe
	p.appendChild(inputNom);

	// ajout du label au paragraphe
	p.appendChild(labelPrenom);

	// ajout du input au paragraphe
	p.appendChild(inputPrenom);

	return p;
}

function majZoneInfoEnfant(nbrEnfants) {
	// var zoneEnfants = document.getElementById('zoneEnfants');
	var zoneEnfants = document.querySelector('#zoneEnfants');

	// recuperation du nombre de infoEnfants
	// var ps = zoneEnfants.getElementsByTagName('p');
	var ps = zoneEnfants.querySelectorAll('p');

	if (ps.length - 1 < nbrEnfants.value) {
		for (var i = ps.length; i <= nbrEnfants.value; i++) {
			var p = creerInfoEnfant(i);
			zoneEnfants.appendChild(p);
		}
	} else {
		// suppression des mauvaises lignes
		for (var i = ps.length - 1; i > nbrEnfants.value; i--) {
			zoneEnfants.removeChild(ps[i]);
		}
	}
}
function changerOeil(oeilPassword) {

	var inputConfirmPassword = document.getElementById("confirmPassword");

	// on inverse l image
	oeilPassword.src = (oeilPassword.src != 'http://localhost:8080/biblioWeb/images/oeil.png') ? "images/oeil.png"
			: "images/oeilFerme.png";

	// on change le type de l in put password
	inputConfirmPassword.type = (inputConfirmPassword.type != 'password') ? "text"
			: "password";
}
function changerCase(event, sens) {
	// sens="toLower";
	switch (sens) {
	case "toUpper":
		event.target.value = event.target.value.toUpperCase();
		break;
	case "toLower":
		console.log("ma chaine" + event.target.value.toLowerCase());
		event.target.value = event.target.value.toLowerCase();
		break;
	default:
		break;
	}
	majIdentite();
}

function changerCaseHandler(event, sens) {
	return function(event, sens) {
		// sens="toLower";
		switch (sens) {
		case "toUpper":
			event.target.value = event.target.value.toUpperCase();
			break;
		case "toLower":
			console.log("ma chaine" + event.target.value.toLowerCase());
			event.target.value = event.target.value.toLowerCase();
			break;
		default:
			break;
		}
	}
}

function majIdentite() {

	try {
		// recuperation de la legende
		var legend = document.getElementById("identite");
		var civiliteM = document.getElementById("civiliteM");
		var civiliteMME = document.getElementById("civiliteMME");

		// var civilite=(civiliteM.checked !=
		// false)?civiliteM.value:(civiliteMME.checked !=
		// false)?civiliteMME.value:"";

		var civilite = document.querySelector("input[name=civilite]:checked");

		var nom = document.getElementById("nom");
		var prenom = document.getElementById("prenom");
		// maj de la legende
		legend.innerHTML = ((civilite != null) ? civilite.value : "") + " "
				+ nom.value + " " + prenom.value;

	} catch (e) {
		console.error("pb maj identite");
	}
}


function setCallBakInscription(){
	var inputNom = document.getElementById("nom");
	var inputConfirmPassword = document.getElementById("confirmPassword");
	var inputPrenom = document.getElementById("prenom");
	document.getElementById("civiliteM").onchange = majIdentite;
	document.getElementById("civiliteMME").onchange = majIdentite;

	// on positione les handler
	inputNom.onchange = function(event) {
		event.target.value = event.target.value.toUpperCase();

		majIdentite();
	}

	inputConfirmPassword.onchange = function(event) {
		var password = document.getElementById("password");
		var erreur = document.getElementById("erreur");
		var confirmPassword = event.target;
		console.log("check du password");
		erreur.innerHTML = "";
		if (confirmPassword.value != password.value) {
			// mots de passe differents
			erreur.innerHTML = "mots de passe differents";
			confirmPassword.focus();// on redonne le focus
		}
		;

	}
	// inputPrenom.onkeyup = changerCaseHandler(event, "toLower");
}
/**
 * affiche une pub sur la page d accueil
 * 
 * @returns
 */
function afficherPub(){
	try {
		// test si la pub a deja ete affiche
		let retour=getCookie("isPubDisplayed");
		if(retour !=  "true"){
			// si non
			// on affiche la pub et on set le cookie
			let pub =document.querySelector("#pub");
			pub.style.display='block';
			setCookie("isPubDisplayed", "true", 10);
		}		
	} catch (e) {
		console.error("Erreur : "+e.message);
	}
}
/**
 * fonction d'init de la page
 * 
 * @returns
 */
function initPage() {
	
	switch (window.location.pathname) {
	case "/biblioWeb/accueil":
		// affichage de la pub
		afficherPub();
		break;
	case "/biblioWeb/inscription":
		// set des callback du formulaire
		setCallBakInscription();
		break;
	case "/biblioWeb/consultation":
		if(localStorage.livres !== "undefined"){
			//on cree le bouchon
			creerBouchonStorage();
			$('.carousel').carousel();
		}
		remplirTableauLivres();
		dessinerHisto();
		break;
	default:
		break;
	}
}

function dessinerHisto(){
	var c = document.getElementById("histo");
	var ctx = c.getContext("2d");
	ctx.fillStyle = "#FF0000";
	ctx.fillRect(20, 20, 150, 100);
}
function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	ev.target.appendChild(document.getElementById(data));
}
/**
 * 
 * @param button
 * @param destination
 *            listeDroite/listeGauche
 * @returns
 */
function passerLis(button){
	// recuperation des lis
	var lis= document.querySelectorAll("#listeGauche li, #listeDroite li");
	// recuperation du ul de destination
	let liste=document.querySelector("#"+button.value);
	
	// on transfert les li vers leur destination
	for ( var li of lis) {
		liste.appendChild(li);
	}
	/*
	 * for (let i = 0; i < lis.length; i++) { listeDroite.appendChild(lis[i]); }
	 */
}
// alert("dans le js");
/*
 * var retour=confirm("question"); var retourPrompt = prompt("question", "ma
 * valeur par defaut");
 * 
 * alert(retourPrompt);
 * 
 * alert(retour/0); retour=retour/0;
 */