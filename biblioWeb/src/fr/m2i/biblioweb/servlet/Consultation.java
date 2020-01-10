package fr.m2i.biblioweb.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import fr.m2i.bibliocommon.ac.ILivreAC;
import fr.m2i.bibliocommon.bo.Livre;

/**
 * Servlet implementation class Accueil
 */
@WebServlet({ "/consultation" })
public class Consultation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ILivreAC livreAC = null;

	@Override
	public void init() throws ServletException {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, getServletContext());
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Consultation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// recuperation des livres
		List<Livre> livres = livreAC.findAll();

		// envoi a la vue (jsp)
		request.setAttribute("livres", livres);

		/*
		 * PrintWriter out = response.getWriter(); for (Livre livre : (List<Livre>)
		 * request.getAttribute("livres")) { out.write("<tr>"); out.write("<td>" +
		 * livre.getId() + "</td>"); out.write("<td>" + livre.getIsbn() + "</td>");
		 * out.write("<td>" + livre.getTitre() + "</td>"); out.write("<td>" + "auteur" +
		 * "</td>"); out.write("</tr>"); }
		 */

		// recuperation du dispatcher
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/consultation.jsp");

		// forward a la jsp
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @return the livreAC
	 */
	public ILivreAC getLivreAC() {
		return livreAC;
	}

	/**
	 * @param livreAC the livreAC to set
	 */
	@Autowired
	public void setLivreAC(ILivreAC livreAC) {
		this.livreAC = livreAC;
	}

}
