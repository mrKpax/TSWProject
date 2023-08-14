package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticoloDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/catalogo4?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "superpippo74";

    public void inserisciArticolo(Articolo articolo) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            String query = "INSERT INTO articolo (nome, descrizione, immagine, quantita, categoria, marca, prezzo, iva) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);

            stmt.setString(1, articolo.getNome());
            stmt.setString(2, articolo.getDescrizione());
            stmt.setString(3, articolo.getImmagine());
            stmt.setInt(4, articolo.getQuantita());
            stmt.setString(5, articolo.getCategoria());
            stmt.setString(6, articolo.getMarca());
            stmt.setInt(7, articolo.getPrezzo());
            stmt.setInt(8, articolo.getIva());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rilancia l'eccezione per gestione successiva
        } finally {
            // Chiudi le risorse
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<Articolo> getArticoliByCategoria(String categoria) throws SQLException {
        List<Articolo> articoli = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            String query = "SELECT * FROM articolo WHERE categoria = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, categoria);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String descrizione = rs.getString("descrizione");
                String immagine = rs.getString("immagine");
                int quantita = rs.getInt("quantita");
                String categoriaDB = rs.getString("categoria");
                String marca = rs.getString("marca");
                int prezzo = rs.getInt("prezzo");
                int iva = rs.getInt("iva");

                Articolo articolo = new Articolo(nome, descrizione, immagine, quantita, categoriaDB, marca, prezzo, iva);
                articoli.add(articolo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return articoli;
    }
}



