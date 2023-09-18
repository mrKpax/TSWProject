package it.unisa.control;

import java.io.IOException;  
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;

import java.util.logging.Level;
import java.util.logging.Logger;

import it.unisa.model.*; 

@MultipartConfig
public class AdminServlet extends HttpServlet {
      private static final String CARTELLA_UPLOAD = "images"; 

      static OrderDAO orderModel = new OrderDAO();
      static ProductDAO model = new ProductDAO();
      static ClientDAO clientModel = new ClientDAO();

      private static final Logger LOGGER = Logger.getLogger( AdminServlet.class.getName() );

      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            //La Servlet dell'admin è collegata a più jsp:
            //1) la client.jsp (per la visualizzazione dei clienti),
            //2) la clientorders.jsp (per la visualizzaizone degli ordini degli utenti)
            //3) la admin.jsp (per le operazioni da admin, quali aggiunta, modifica ed eliminazione di prodotti)
            
            //controllo se è stato inserito il client nella sessione
            ClientBean client = (ClientBean) request.getSession().getAttribute("utente");
            if(client==null || !client.getEmail().equals("WorkInProgress@gmail.com") ){
                  //se non lo è, si viene ridirezionati alla home
                  response.sendRedirect("home");	
                  return;
            }
            
            //viene preso il parametro action e settate le liste da passare nella request
            String action = request.getParameter("action");
            ArrayList<OrderBean> orders = new ArrayList<OrderBean>();
            ArrayList<ClientBean> clients = new ArrayList<ClientBean>();

            //se l'azione è nulla o è una stringa vuota, vuol dire che si sta accedendo alla pagina stessa (anche da url) e si viene ridirezionati
            if(action == null || action.equals("")){
                  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp");
                  dispatcher.forward(request, response);
                  return;
            }
            
            //azione di inserimento di un nuovo prodotto
            if (action.equals("insert")) {

                  //CODICE DELL'UPLOAD DELLE IMMAGINI NELLA CARTELLA
                  Part filePart = request.getPart("image");

                  String nome = request.getParameter("name");
                  String estensione ="jpg";
                  String fileName = nome + "." + estensione;
                  System.getProperty("user.dir");

                  String destinazione = System.getProperty("user.dir") + File.separator + "WorkInProgress" + File.separator + "WebContent" + File.separator + CARTELLA_UPLOAD + File.separator + fileName;
                  Path pathDestinazione = Path.of(destinazione);


                  // se un file con quel nome esiste già, gli cambia nome
                  for (int i = 2; Files.exists(pathDestinazione); i++) {
                        String newFileName = i + "_" + nome + "." + estensione;
                        destinazione = System.getProperty("user.dir") + File.separator + "WorkInProgress" + File.separator + "WebContent" + File.separator + CARTELLA_UPLOAD + File.separator+ newFileName;
                        pathDestinazione = Path.of(destinazione);
                  }

                  InputStream fileInputStream = filePart.getInputStream();
                  // crea CARTELLA_UPLOAD, se non esiste
                  Files.createDirectories(pathDestinazione.getParent());

                  // scrive il file
                  Files.copy(fileInputStream, pathDestinazione);
                  request.setAttribute("uploaded", destinazione);

                  //UPLOAD NEL .war
                
					String tomcatBase = System.getProperty("catalina.base");  
					String targetPath = tomcatBase + "//webapps//WorkInProgress//images//" + fileName;
					InputStream fileInputStream2 = filePart.getInputStream();
					
					Path targetImagePath = Path.of(targetPath);
					Files.copy(fileInputStream2, targetImagePath);


                  //controllo e set di tutti i parametri destinati al ProductBean prima di essere salvato nel database
                  float IVA;
                  float price;

                  if(request.getParameter("IVA").equals(""))
                        IVA = 0;
                  else
                        IVA = Float.parseFloat(request.getParameter("IVA"));

                  if(request.getParameter("price").equals(""))
                        price = 0;
                  else
                        price = Float.parseFloat(request.getParameter("price"));

                  String category = request.getParameter("category");
                  String brand = request.getParameter("brand");
                  String description = request.getParameter("description");

                  if(nome==null || !nome.matches("^[A-Za-z ]+$")){
                       
                        sendError(request, response);
                        return;
                  }
                  if(category==null || category.equals("") || (!category.equals("Accessori") && !category.equals("Attrezzatura") && !category.equals("FoodAndBeverage") && !category.equals("Abbigliamento") && !category.equals("Allenamenti"))){
                       
                        sendError(request, response);
                        return;
                  }
                  if(brand==null | brand.equals("")){
                      
                        sendError(request, response);
                        return;
                  }
                  if(IVA==0 || !(IVA > 0 && IVA < 100)){
                        
                        sendError(request, response);
                        return;
                  }
                  if(price==0 || !(price > 0 && price <= 5000)){
                       
                        sendError(request, response);
                        return;
                  }
                  if(description==null || !description.matches("^[a-zA-Z0-9\\s\\p{P}]{1,500}$")){
                      
                        sendError(request, response);
                        return;
                  }


                  //AGGIUNTA DEL PRODOTTO NEL DATABASE
                  ProductBean product = new ProductBean();
                  product.setNome(nome);
                  product.setCategoria(category);
                  product.setMarca(brand);
                  product.setImmagine(fileName);
                  product.setIVA(IVA);
                  product.setPrezzo(price);
                  product.setDescrizione(description);

                  try {
                        model.doSave(product);
                  } catch (SQLException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  }

            }
            
            //azione di caricamento di un prodotto dal suo id, avviene prima di poterlo modificare
            if (action.equals("load")) {
                  ProductBean productToModify = new ProductBean();

                  try {
                	  productToModify = model.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
                  } catch (NumberFormatException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  } catch (SQLException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  }

                  request.setAttribute("product",productToModify);
            }
            
            //vengono presi dalla request tutti i parametri, da un form, controllati e settati
            if (action.equals("modify")) {
                  ProductBean product = new ProductBean();

                  int idM;
                  float IVAM;
                  float priceM;

                  if(request.getParameter("idM").equals(""))
                        idM = 0;
                  else
                        idM = Integer.parseInt(request.getParameter("idM"));

                  if(request.getParameter("IVAM").equals(""))
                        IVAM = 0;
                  else
                        IVAM = Float.parseFloat(request.getParameter("IVAM"));

                  if(request.getParameter("priceM").equals(""))
                        priceM = 0;
                  else
                        priceM = Float.parseFloat(request.getParameter("priceM"));

                  String nameM = request.getParameter("nameM");
                  String categoryM = request.getParameter("categoryM");
                  String brandM = request.getParameter("brandM");
                  String descriptionM = request.getParameter("descriptionM");

                  if(idM==0 ){
                       
                        sendError(request, response);
                        return;
                  }
                  if(nameM==null || !nameM.matches("^[A-Za-z ]+$")){
                        
                        sendError(request, response);
                        return;
                  }
                  if(categoryM==null || categoryM.equals("") || (!categoryM.equals("Accessori") && !categoryM.equals("Attrezzatura") && !categoryM.equals("FoodAndBeverage") && !categoryM.equals("Abbigliamento") && !categoryM.equals("Allenamenti"))){
                       
                        sendError(request, response);
                        return;
                  }
                  if(brandM==null || brandM.equals("")){
                        
                        sendError(request, response);
                        return;
                  }
                  if(IVAM==0 || !(IVAM > 0 && IVAM < 100)){
                      
                        sendError(request, response);
                        return;
                  }
                  if(priceM==0 || !(priceM > 0 && priceM <= 5000)){
                        
                        sendError(request, response);
                        return;
                  }
                  if(descriptionM==null || !descriptionM.matches("^[a-zA-Z0-9\\s\\p{P}]{1,500}$")){
                        
                        sendError(request, response);
                        return;
                  }

                  product.setId(idM);
                  product.setNome(nameM);
                  product.setCategoria(categoryM);
                  product.setMarca(brandM);
                  product.setImmagine(request.getParameter("imageM"));
                  product.setIVA(IVAM);
                  product.setPrezzo(priceM);
                  product.setDescrizione(descriptionM);
                  
                  //effettiva modifica chiamando il DAO 
                  try {
                        model.doModify(product);
                  } catch (SQLException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  }

            }
            
            //azione di eliminazione: prende l'id di un prodotto e lo elimina
            if (action.equals("delete")) {
                  String id = request.getParameter("id");

                  try {
                        model.doDelete(Integer.parseInt(id));
                  } catch (NumberFormatException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  } catch (SQLException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  }

            }
            
            //azione che determina la vista di tutti gli ordini effettuati 
            if (action.equals("ordersNoFilter")){

                  try {
                        orders = orderModel.doRetrieveAll();
                  } catch (SQLException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  }

                  request.setAttribute("ordini", orders);
                  
                  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/clientorders.jsp");
                  dispatcher.forward(request, response);
                  return;
            }

            //azione di ordinamento (due tipi: per data, per cliente) per la clientorders.jsp
            if (action.equals("orders")){
                  
                  //ordinamento per cliente
                  if (Boolean.parseBoolean(request.getParameter("Order By Client"))== true){

                        String user = request.getParameter("cliente");

                        try {
                              orders = orderModel.doRetrieveByClient(user);
                        } catch (SQLException e) {
                              LOGGER.log( Level.SEVERE, e.toString(), e );
                        }
                        
                        //controllo che l'utente inserito abbia effettuato degli ordini
                        if(orders.size()==0){
                              request.setAttribute("clientError", "Questo utente non ha ordini salvati");
                            
                              RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/clientorders.jsp");
                              dispatcher.forward(request, response);
                              return;
                        }
                        

                  }//ordinamento per data
                  if(Boolean.parseBoolean(request.getParameter("Order By Date"))== true){

                        String data_da = (String) request.getParameter("data_da");
                        String data_a = (String) request.getParameter("data_a");

                        if (data_da.compareTo(data_a)< 0){
                              try {
                                    orders = orderModel.DateOrders(data_da,data_a);
                              } catch (SQLException e) {
                                    LOGGER.log( Level.SEVERE, e.toString(), e );
                              }
                        } 
                          else { //se la data "da" è più recente della data "a"
                                request.setAttribute("dateError", "Inserisci una data valida");
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/clientorders.jsp");
                                dispatcher.forward(request, response);
                                return;
                          } 
                  }
                  //ordinamento sia per data che per utente
                  if ((Boolean.parseBoolean(request.getParameter("Order By Date"))== true) && (Boolean.parseBoolean(request.getParameter("Order By Client"))== true)){

                        String user = request.getParameter("cliente");
                        String data_da = (String) request.getParameter("data_da");
                        String data_a = (String) request.getParameter("data_a");
                        try {
                              orders = orderModel.ClientDateOrders(user,data_da,data_a);
                        } catch (SQLException e) {
                              LOGGER.log( Level.SEVERE, e.toString(), e );
                              RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin?action=ordersNoFilter");
                              dispatcher.forward(request, response);
                              return;
                        }
                  }


                  request.setAttribute("ordini", orders);

                  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/clientorders.jsp");
                  dispatcher.forward(request, response);
                  return;

            }
            //action di ordinamento dei clienti senza alcun filtro per la client.jsp
            if (action.equals("clientsNoFilter")){

                  try {
                        clients = clientModel.doRetrieveAll();
                  } catch (SQLException e) {
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                  }


                  request.setAttribute("clienti", clients);

                  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/client.jsp");
                  dispatcher.forward(request, response);

                  return;
            }

            if (action.equals("ByClient")){ //ordinamento per un particolare utente

                  String user = request.getParameter("cliente");
                  ClientBean person = null;

                  try {
                      person = (clientModel.doRetrieveByKey(user));
                  } catch (SQLException e) {
                	  
                        LOGGER.log( Level.SEVERE, e.toString(), e );
                        response.sendRedirect("generalError.jsp");
                        return;
                        
                  }
                  //controllo che l'utente esista
                  if (person==null) {
                      request.setAttribute("clientError", "Questo utente non esiste");  
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/client.jsp");
                      dispatcher.forward(request, response);
                      return;
                  }

                  clients.add(person);
                  request.setAttribute("clienti", clients);

                  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/client.jsp");
                  dispatcher.forward(request, response);
                  return;
            }

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp");
            dispatcher.forward(request, response);
      }

      protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
            doGet(request, response);
      }

      public void sendError(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
            request.setAttribute("error", "WorkInProgress encountered a problem during submission. Please, try to fill up the form again.");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp");
            dispatcher.forward(request, response);
      }

}
