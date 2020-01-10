package fr.m2i.biblioweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import fr.m2i.bibliocommon.ac.IUtilisateurAC;
import fr.m2i.bibliocommon.bo.Utilisateur;

/**
 * Servlet implementation class Accueil
 */
@WebServlet({ "/inscription" })
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IUtilisateurAC utilisateurAC = null;

	@Override
	public void init() throws ServletException {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, getServletContext());
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Inscription() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// recuperation du dispatcher
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/inscription.jsp");

		// forward a la jsp
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String error = "";// indique si il y a des erreurs sur le formulaire d inscription
		RequestDispatcher requestDispatcher = null;
		HttpSession session = request.getSession();

		// recuperation du nom
		Utilisateur utilisateur = new Utilisateur(null, null, request.getParameter("civilite"),
				request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("password"),
				request.getParameter("email"));

		// test des param du formulaire
		if (utilisateur.getCivilite() == null || "".equals(utilisateur.getCivilite())) {
			error = "champ civilite obligatoire";
		}

		// test des param du formulaire
		if (utilisateur.getNom() == null || "".equals(utilisateur.getNom())) {
			error = "champ nom obligatoire";
		}

		// test des param du formulaire
		if (utilisateur.getPrenom() == null || "".equals(utilisateur.getPrenom())) {
			error = "champ prenom obligatoire";
		}

		// test des param du formulaire
		if (utilisateur.getPassword() == null || "".equals(utilisateur.getPassword())) {
			error = "champ password obligatoire";
		}
		// test des param du formulaire
		if (utilisateur.getEmail() != null && !utilisateur.getEmail().matches(".+@.+\\..+")) {
			error = "champ email incorrect";
		}

		// sauvegarde de l'utilisateur en session
		session.setAttribute("utilisateur", utilisateur);

		if (error.isEmpty()) {
			// save de l'utilisateur
			utilisateurAC.save(utilisateur);
			// inscription ok
			// recuperation du dispatcher
			requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/inscriptionOK.jsp");
		} else {
			// inscription ko
			// recuperation du dispatcher
			requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/inscription.jsp");

			// on stocke en session
			session.setAttribute("error", error);
		}

		// forward a la jsp
		requestDispatcher.forward(request, response);

	}

	/**
	 * @return the utilisateurAC
	 */
	public IUtilisateurAC getUtilisateurAC() {
		return utilisateurAC;
	}

	/**
	 * @param utilisateurAC the utilisateurAC to set
	 */
	@Autowired
	public void setUtilisateurAC(IUtilisateurAC utilisateurAC) {
		this.utilisateurAC = utilisateurAC;
	}

}
