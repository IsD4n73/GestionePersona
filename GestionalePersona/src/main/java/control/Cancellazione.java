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


@WebServlet("/Cancellazione")
public class Cancellazione extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Cancellazione() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersonaDAO pd = new PersonaDAO();
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		page -=1; 
		
		if(page > 0) {
			page = page * 3;
		}
		
		int persone = 0;
		try {
			persone = pd.totPersone();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		int totPag = persone / 3;
		float totPagFloat = persone / 3;
		
		request.setAttribute("totPag", totPag);
		request.setAttribute("totPagFloat", totPagFloat);
		
		
		System.out.print(Integer.parseInt(request.getParameter("id")));
		try {
			pd.cancellaPersona(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
			System.out.print("Errore nella conversione dell ID\n\n");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.print("Errore nella cancellazione...\n\n");
			e.printStackTrace();
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
		//System.out.print("\n\nRichiesta passata da dopost\n\n");
		
		
	
	}

}
