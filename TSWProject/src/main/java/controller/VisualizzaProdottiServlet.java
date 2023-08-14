package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Articolo;
import model.ArticoloDAO;

@WebServlet("/visualizzaProdotti")
public class VisualizzaProdottiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoria = request.getParameter("categoria");

        ArticoloDAO articoloDAO = new ArticoloDAO();
        try {
            List<Articolo> articoli = articoloDAO.getArticoliByCategoria(categoria);
            request.setAttribute("articoli", articoli);
            request.getRequestDispatcher("visualizzaProdotti.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errore.jsp");
        }
    }
}
