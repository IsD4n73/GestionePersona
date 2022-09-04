package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Persona;
import model.PersonaDAO;


@WebServlet("/Inserimento")
public class Inserimento extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Inserimento() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PersonaDAO pd = new PersonaDAO();
		Persona p = new Persona(request.getParameter("nome"), request.getParameter("cognome"), Integer.parseInt(request.getParameter("eta")));
		
		
		boolean inserimento = pd.inserisciPersona(p);
		
		HttpSession session = request.getSession();  
		session.setAttribute("inserimento", inserimento);
		
		
		System.out.print("Operazione completata!");
		//request.getRequestDispatcher("home.jsp").forward(request, response);
		response.sendRedirect("home.jsp");
	
	}

}
