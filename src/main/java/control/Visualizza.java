package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Persona;
import model.PersonaDAO;

/**
 * Servlet implementation class Visualizza
 */
@WebServlet("/Visualizza")
public class Visualizza extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Visualizza() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PersonaDAO pd = new PersonaDAO();
		int persone = 0;
		
		try {
			persone = pd.totPersone();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		int totPag = persone / 3;
		float totPagFloat = (float) persone / 3;
		
		request.setAttribute("totPag", totPag);
		request.setAttribute("totPagFloat", totPagFloat);
		
		int page = Integer.parseInt(request.getParameter("page"));  
		request.setAttribute("page", page);

		page -=1; 
		
		if(page > 0) {
			page = page * 3;
		}
		
		try {
			List<Persona> pl = new ArrayList<Persona>();
			pl=pd.visualizzaPersone(page);
			
			request.setAttribute("listaPersone", pl);
			request.getRequestDispatcher("visualizzaPersone.jsp").forward(request, response);
		} catch (SQLException e) {
			System.out.print("Errore nella visualizzazione dei dati...\n\n");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//doGet(request, response);
	}

}
