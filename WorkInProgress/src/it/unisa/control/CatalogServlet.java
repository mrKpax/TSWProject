package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.google.gson.*;

import it.unisa.model.*;

public class CatalogServlet extends HttpServlet {
	
	private static final Logger LOGGER = Logger.getLogger( CatalogServlet.class.getName() );

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
     ProductDAO model = new ProductDAO();
     boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With")); //variabile necessaria a distinguere le richieste ajax e richieste non ajax
     
     String action = request.getParameter("action");
     ArrayList<ProductBean> result = null;
     
     //se la richiesta è effettivamente ajax
     if(ajax){
         if (action == null) { //azione che genera tutto il caricamento di tutto il catalogo
             try {
                 result = (ArrayList<ProductBean>)model.doRetrieveAll();
             }catch (SQLException e) {
                 LOGGER.log( Level.SEVERE, e.toString(), e );
                 response.sendRedirect("generalError.jsp");
                 return;
             }
         }
     else if(action.equals("suggest")){ //viene passata una stringa come parametro: la keyword per cercare tutte le occorrenze di prodotti che hanno nella loro descrizione quella keyword
         String keyword = request.getParameter("keyword");

         try {
             result = (ArrayList<ProductBean>)model.doRetrieveAllByName(keyword);
         }catch (SQLException e) {
             LOGGER.log( Level.SEVERE, e.toString(), e );
             response.sendRedirect("generalError.jsp");
             return;
         }
     }
     else if(action.equals("searchByCategory")){ //viene passata una stringa come parametro e viene effettuata la ricerca per categoria

         String category = request.getParameter("category");

         try {
             result = (ArrayList<ProductBean>)model.doRetrieveAllByCategory(category);
         }catch (SQLException e) {
             LOGGER.log( Level.SEVERE, e.toString(), e );
             response.sendRedirect("generalError.jsp");
             return;
         }
     }
     else if(action.equals("filter")){
         String sql =""; //è una stringa che verrà formattata e passata secondo dei filtri
         
         String keyword = request.getParameter("keyword");
         keyword = keyword.replace(" ", "%");

         String prezzo = request.getParameter("prezzo");
         //set iniziale dei due prezzi con i valori di default
         float prezzo_da = 0;
         float prezzo_a = 5000;
         
         if (!request.getParameter("prezzo_da").equals(""))
             prezzo_da = Float.parseFloat(request.getParameter("prezzo_da"));
         if (!request.getParameter("prezzo_a").equals(""))
             prezzo_a = Float.parseFloat(request.getParameter("prezzo_a"));

         String categoria = request.getParameter("categoria");
         String attrezzatura = request.getParameter("attrezzatura");
         String accessori = request.getParameter("accessori");
         String abbigliamento = request.getParameter("abbigliamento");
         String fab = request.getParameter("fab");
         String allenamenti = request.getParameter("allenamenti");
         
         //viene prima preso tutto dalla request ed in seguito aggiunti tutti i filtri
         if (!categoria.equals("")){
             sql=" AND (prezzo > "+prezzo_da+" AND prezzo < "+prezzo_a+") AND (categoria = '"+attrezzatura+"' OR categoria = '"+abbigliamento+"' OR categoria ='"+fab+"' OR categoria ='"+allenamenti+"' OR categoria = '"+accessori+"')";
         }//se tutti i filtri sono vuoti, di default viene cercato per prezzo
             else if (categoria.equals("")){
                 sql = " AND prezzo > "+ prezzo_da +" AND prezzo < "+ prezzo_a;
             }

         
         try {
             result = model.doRetrieveAllByKeyword(keyword,sql); //restituisce tutte le occorrenze che seguono la stringa sql con i filtri e la keyword passata
         }catch (SQLException e) {
             LOGGER.log( Level.SEVERE, e.toString(), e );
             response.sendRedirect("generalError.jsp");
             return;
         }

     } 
    //la stringa json viene creata dall'oggetto gson e passata così com'è nella response (che verrà formattata nella jsp) 
         Gson gson = new Gson();
     String json = gson.toJson(result);

     response.setContentType("application/json");
     PrintWriter out = response.getWriter();
     out.write(json);
     }
     else if(!ajax && action==null){ //controllo che si stia cercando semplicemente di accedere al catalogo (non ajax e con action == null)
         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/catalog.jsp");
         dispatcher.forward(request, response);
         return;
     }

     
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doGet(request, response);
    }

}