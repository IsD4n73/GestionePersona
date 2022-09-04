package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.Connessione;

public class PersonaDAO {
	
	public boolean inserisciPersona(Persona p){
		
		String sql = "INSERT INTO persona (nome, cognome, eta) VALUES (?, ?, ?)";
		
		Connection conn = Connessione.getConnessione();
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, p.getNome());
			ps.setString(2, p.getCognome());
			ps.setInt(3, p.getEta());
			
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("Errore nell inserimento...\n\n");
			e.printStackTrace();
			return false;
		}
		
		

	}
	
	public void cancellaPersona(int id) throws SQLException {
		String sql = "DELETE FROM `persona` WHERE id_persona = ?";
				
		Connection conn = Connessione.getConnessione();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, id);
		
		ps.executeUpdate();
	}
	
	public List<Persona> visualizzaPersone(int pag) throws SQLException {
		String sql = "SELECT * FROM persona LIMIT " + (pag)  + ", 3";
		
		List<Persona> persone = new ArrayList<Persona>();		
		
		Connection conn = Connessione.getConnessione();
		PreparedStatement ps = conn.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
					
		    String nome = rs.getString("nome");
		    String cognome = rs.getString("cognome");
		    int eta = rs.getInt("eta");
		    int id = rs.getInt("id_persona");
		    
		    Persona p = new Persona(nome, cognome, eta);
		    p.setId(id);
		    
		    persone.add(p);
		}
		return persone;
	}
	
	public void modificaPersona(Persona p, int id) throws SQLException{
		String sql = "UPDATE persona SET nome = ? ,cognome = ? ,eta = ? WHERE id_persona = ?";
		
		Connection conn = Connessione.getConnessione();
		
		PreparedStatement ps = conn.prepareStatement(sql);
			
		ps.setInt(4, id);
		ps.setString(1, p.getNome());
		ps.setString(2, p.getCognome());
		ps.setInt(3, p.getEta());
			
		ps.executeUpdate();
		
	}
	
	
	public int totPersone() throws SQLException {
		String sql = "SELECT COUNT(*) FROM persona";
		
		Connection conn = Connessione.getConnessione();
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		int tot = 0;
		
		while(rs.next()) {
		    tot = rs.getInt("COUNT(*)");
		  
		}
		return tot;
		
	}
	
}
