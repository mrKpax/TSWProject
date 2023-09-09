package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

import it.unisa.model.*;

public class DetailsServlet extends HttpServlet {
	
	private static final Logger LOGGER = Logger.getLogger(DetailsServlet.class.getName() );
	
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      //viene preso un gioiello in base al suo id, preso come parametro della request
      ProductDAO model = new ProductDAO();

      String id = request.getParameter("id");
      if (id == null || Integer.parseInt(id)==0){
          response.sendRedirect("catalog");
          return;
      } 
      
      ProductBean j = new ProductBean();
      
      try {
		j = model.doRetrieveByKey(Integer.parseInt(id));
	} catch (NumberFormatException e) {
		LOGGER.log( Level.SEVERE, e.toString(), e );
    response.sendRedirect("generalError.jsp");
    return;
	} catch (SQLException e) {
		LOGGER.log( Level.SEVERE, e.toString(), e );
    response.sendRedirect("generalError.jsp");
    return;
	}
      
      request.setAttribute("detailed", j);
      
      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/details.jsp");//dispatch alla pagina dedicata
      dispatcher.forward(request, response);
  }
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      doGet(request, response);
  }  
}
