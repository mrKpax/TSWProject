package it.unisa.control;

import it.unisa.model.*;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

import it.unisa.model.*;

public class CartServlet extends HttpServlet {
	
	private static final Logger LOGGER = Logger.getLogger( CartServlet.class.getName() );
    
    private static ProductDAO model = new ProductDAO();
    private static AddressDAO addressModel = new AddressDAO();
    private static PaymentMethodDAO paymentModel = new PaymentMethodDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cart cart = (Cart)request.getSession().getAttribute("cart");
        if(cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
            
        ClientBean client = (ClientBean) request.getSession().getAttribute("utente");
        
        if (client!= null && client.getEmail().equals("WorkInProgress@gmail.com")) {
        	
        	 response.sendRedirect("home");
             return;
        	
        }

        String id = request.getParameter("id");

        String action = request.getParameter("action");
        if(action == null)
        	action = "seeCart"; 

        ProductBean product = new ProductBean();
        
		try {
			product = model.doRetrieveByKey(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			 LOGGER.log( Level.SEVERE, e.toString(), e );
             
		} catch (SQLException e) {
			LOGGER.log( Level.SEVERE, e.toString(), e );
            response.sendRedirect("generalError.jsp");
            return;
		}
            
        if (action.equals("Delete from Cart"))
            cart.removeProduct(product);

        if (action.equals("Modify Amount")){
                        cart.changeQuantity(product, Integer.parseInt(request.getParameter("quantity")));               
                        
        }
            
        if (cart != null && cart.getProducts().size() != 0){ // "procedi al pagamento" : se l'utente non è loggato, lo porta alla login.jsp
            if(action.equalsIgnoreCase("buy")) {
                // se non � loggato lo portiamo al login
                if(client == null) {
                    response.sendRedirect("login");
                    return;
                }
                request.getSession().setAttribute("cart", cart);
                
                ArrayList<AddressBean> indirizzi = null;
				try {
					indirizzi = addressModel.doRetrieveByClient(client.getUsername());
				} catch (SQLException e) {
					LOGGER.log( Level.SEVERE, e.toString(), e );
                    response.sendRedirect("generalError.jsp");
                    return;
				}
				
                ArrayList<PaymentMethodBean> carte = null;
				try {
                    carte =  paymentModel.doRetrieveByClient(client.getUsername());
				} catch (SQLException e) {
					LOGGER.log( Level.SEVERE, e.toString(), e );
                    response.sendRedirect("generalError.jsp");
                    return;
                    
				}
				
                if(!indirizzi.isEmpty() && !carte.isEmpty()){// "procedi al pagamento" : se l'utente è loggato ed ha almeno un metodo di pagamento e un idirizzo può procedere all'acquisto
                
                	request.setAttribute("addresses", indirizzi);
                	request.setAttribute("payments",carte);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/payment");
                    dispatcher.forward(request, response);       
                    return;
                }
                else{ // altrimenti gli viene chiesto di inserire dei metodi di pagamento nella client.jsp
                    request.setAttribute("carterror","Please insert at least one card before proceeding with your purchase");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userdetails");
                    dispatcher.forward(request, response);
                    return;
                }

            }
        }
        
  
        request.getSession().setAttribute("cart", cart);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/cart.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
