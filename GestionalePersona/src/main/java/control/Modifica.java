package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Persona;
import model.PersonaDAO;

/**
 * Servlet implementation class Modifica
 */
@WebServlet("/Modifica")
public class Modifica extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifica() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		int eta = Integer.parseInt(request.getParameter("eta"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		request.setAttribute("nome", nome);
		request.setAttribute("cognome", cognome);
		request.setAttribute("eta", eta);
		request.setAttribute("id", id);
		
		request.getRequestDispatcher("modificaPersona.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		int eta = Integer.parseInt(request.getParameter("eta"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		PersonaDAO pd = new PersonaDAO();
		Persona p = new Persona(nome, cognome, eta);
		
		try {
			pd.modificaPersona(p, id);
		} catch (SQLException e) {
			System.out.print("\n\nErrore nella modifica...\n\n");
			e.printStackTrace();
		}							
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

}
