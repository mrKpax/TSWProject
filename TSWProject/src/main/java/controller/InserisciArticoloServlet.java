package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Articolo;
import model.ArticoloDAO;

@WebServlet("/inserisciArticolo")
@MultipartConfig // Per consentire il caricamento di file
public class InserisciArticoloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        int quantita = Integer.parseInt(request.getParameter("quantita"));
        String categoria = request.getParameter("categoria");
        String marca = request.getParameter("marca");
        int prezzo = Integer.parseInt(request.getParameter("prezzo"));
        int iva = Integer.parseInt(request.getParameter("iva"));

        Part immaginePart = request.getPart("immagine");
        String immagineNome = immaginePart.getSubmittedFileName();
        String immaginePath = "images/" + immagineNome;
        immaginePart.write(getServletContext().getRealPath(immaginePath));

        Articolo articolo = new Articolo(nome, descrizione, immaginePath, quantita, categoria, marca, prezzo, iva);

        ArticoloDAO articoloDAO = new ArticoloDAO();
        try {
            articoloDAO.inserisciArticolo(articolo);
            response.sendRedirect("conferma.jsp"); // Reindirizza alla pagina di conferma
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestisci l'eccezione, ad esempio visualizzando un messaggio di errore
            response.sendRedirect("errore.jsp");
        }
    }
}

