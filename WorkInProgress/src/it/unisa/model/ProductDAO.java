package it.unisa.model;

import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ProductDAO {
  
  private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName() );
  private static final String TABLE = "Prodotto";
  
  private static DataSource ds;

  static {
    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");

      ds = (DataSource) envCtx.lookup("jdbc/WorkInProgress");

    } catch (NamingException e) {
      LOGGER.log( Level.SEVERE, e.toString(), e );
    }
  }
  
  public ProductDAO(){
    //costruttore vuoto
  }
  
  public synchronized int doSave(ProductBean product) throws SQLException{
    //INSERISCE UN PRODOTTO NEL DATABASE
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    int id = -1;
    
    String insertSQL = "INSERT INTO " + TABLE
                       + " (nome, categoria, descrizione, marca, immagine, IVA, prezzo) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(insertSQL,Statement.RETURN_GENERATED_KEYS);
      preparedStatement.setString(1, product.getNome());
      preparedStatement.setString(2, product.getCategoria());
      preparedStatement.setString(3, product.getMarca());
      preparedStatement.setString(4, product.getImmagine());
      preparedStatement.setFloat(6, product.getIVA());
      preparedStatement.setFloat(7, product.getPrezzo());
      preparedStatement.setString(8, product.getDescrizione());

      preparedStatement.executeUpdate();

      
      
      ResultSet key = preparedStatement.getGeneratedKeys();

      while(key.next()) {
        id = key.getInt(1);
      }
      
    } finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } finally {
        if (connection != null)
          connection.close();
      }
    }
    return id;
  }
  
  public synchronized ProductBean doRetrieveByKey(int id) throws SQLException{
    //PRENDE UN PRODOTTO DAL SUO ID
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSQL = "SELECT * FROM " + TABLE + " WHERE id = ?";
    ProductBean product = new ProductBean();
    
    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);
      preparedStatement.setInt(1, id);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
    
        product.setId(rs.getInt("id"));
        product.setNome(rs.getString("nome"));
        product.setCategoria(rs.getString("categoria"));
        product.setMarca(rs.getString("marca"));
        product.setImmagine(rs.getString("immagine"));
        product.setIVA(rs.getFloat("IVA"));
        product.setPrezzo(rs.getFloat("prezzo"));
        product.setDescrizione(rs.getString("descrizione"));
        
      }

    } finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } finally {
        if (connection != null)
          connection.close();
      }
    }
    return product;
  }
  
  public synchronized boolean doDelete(int id) throws SQLException{
    //ELIMINA UN PRODOTTO DAL DATABASE
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    int result = 0;
    
    String deleteSQL = "DELETE FROM " + TABLE + " WHERE id = ?";
    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(deleteSQL);
      preparedStatement.setInt(1, id);

      result = preparedStatement.executeUpdate();

    } finally{
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } finally {
        if (connection != null)
          connection.close();
      }
    }
    
	return (result != 0);
  }
  
  public synchronized List<ProductBean> doRetrieveAll() throws SQLException{
    //PRENDE TUTTI I PRODOTTI
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    List<ProductBean> products = new ArrayList<ProductBean>();
    
    String selectSQL = "SELECT * FROM " + TABLE;
    
    try{
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);
      
      ResultSet rs = preparedStatement.executeQuery();
      
      while(rs.next()){
    	ProductBean product = new ProductBean();
        
    	product.setId(rs.getInt("id"));
    	product.setNome(rs.getString("nome"));
    	product.setCategoria(rs.getString("categoria"));
    	product.setMarca(rs.getString("marca"));
    	product.setImmagine(rs.getString("immagine"));
    	product.setIVA(rs.getFloat("IVA"));
    	product.setPrezzo(rs.getFloat("prezzo"));
    	product.setDescrizione(rs.getString("descrizione"));
        
        products.add(product);
      }
      
    } finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } finally {
        if (connection != null)
          connection.close();
      }
    }
    return products;
  }
  
  public synchronized ArrayList<ProductBean> doRetrieveAllLimit() throws SQLException{
    //PRENDE 10 PRODOTTI
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    ArrayList<ProductBean> products = new ArrayList<ProductBean>();

    String selectSQL = "SELECT * FROM " + TABLE + " LIMIT 10";

    try{
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);

      ResultSet rs = preparedStatement.executeQuery();

      while(rs.next()){
    	ProductBean product = new ProductBean();

    	product.setId(rs.getInt("id"));
    	product.setNome(rs.getString("nome"));
    	product.setCategoria(rs.getString("categoria"));
    	product.setMarca(rs.getString("marca"));
    	product.setImmagine(rs.getString("immagine"));
    	product.setIVA(rs.getFloat("IVA"));
    	product.setPrezzo(rs.getFloat("prezzo"));
    	product.setDescrizione(rs.getString("descrizione"));

        products.add(product);
      }

    } finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } finally {
        if (connection != null)
          connection.close();
      }
    }
    return products;
  }
  
  public synchronized boolean doModify(ProductBean product) throws SQLException{
    //MODIFICA UN PRODOTTO DAL SUO ID
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    int result = 0;
    
    String updateSQL = "UPDATE "+ TABLE+ " SET nome = ?, categoria = ?, marca = ?, immagine = ?, IVA = ?, prezzo = ?, descrizione = ?" + "WHERE id = ?";
    
    try{
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(updateSQL);

      preparedStatement.setString(1, product.getNome());
      preparedStatement.setString(2, product.getCategoria());
      preparedStatement.setString(3, product.getMarca());
      preparedStatement.setString(4, product.getImmagine());
      preparedStatement.setFloat(5, product.getIVA());
      preparedStatement.setFloat(6, product.getPrezzo());
      preparedStatement.setString(7, product.getDescrizione());
      preparedStatement.setInt(9, product.getId());

      preparedStatement.executeUpdate();
      
    } finally{
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } finally {
        if (connection != null)
          connection.close();
      }
    }
            
	return (result != 0);
  }
  
  public synchronized ArrayList<ProductBean> doRetrieveAllByCategory(String category) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    

    String selectSQL = "SELECT * FROM " + TABLE + " WHERE categoria = ? ";

    ArrayList<ProductBean> beans = new ArrayList<ProductBean>();

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);
      preparedStatement.setString(1, category);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
    	ProductBean product = new ProductBean();
    	product.setId(rs.getInt("id"));
    	product.setNome(rs.getString("nome"));
    	product.setCategoria(rs.getString("categoria"));
    	product.setMarca(rs.getString("marca"));
    	product.setImmagine(rs.getString("immagine"));
    	product.setIVA(rs.getFloat("IVA"));
    	product.setPrezzo(rs.getFloat("prezzo"));
    	product.setDescrizione(rs.getString("descrizione"));
        
        beans.add(product);
      }
    } 
    finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } 
      finally {
        if (connection != null)
          connection.close();
      }
    }
    return beans;
  }
  
  public synchronized ArrayList<ProductBean> doRetrieveAllByMarca(String brand) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;


    String selectSQL = "SELECT * FROM " + TABLE + " WHERE marca = ? ";

    ArrayList<ProductBean> beans = new ArrayList<ProductBean>();

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);
      preparedStatement.setString(1, brand);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
    	ProductBean product = new ProductBean();
    	product.setId(rs.getInt("id"));
    	product.setNome(rs.getString("nome"));
    	product.setCategoria(rs.getString("categoria"));
    	product.setMarca(rs.getString("marca"));
    	product.setImmagine(rs.getString("immagine"));
    	product.setIVA(rs.getFloat("IVA"));
    	product.setPrezzo(rs.getFloat("prezzo"));
    	product.setDescrizione(rs.getString("descrizione"));

        beans.add(product);
      }
    } 
    finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } 
      finally {
        if (connection != null)
          connection.close();
      }
    }
    return beans;
  }
  
  
  public synchronized ArrayList<ProductBean> doRetrieveAllByKeyword(String keyword, String query) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSQL = "SELECT * FROM " + TABLE + " WHERE descrizione LIKE " + "'%" + keyword + "%'" + query;

    ArrayList<ProductBean> beans = new ArrayList<ProductBean>();

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
    	ProductBean product = new ProductBean();
    	product.setId(rs.getInt("id"));
    	product.setNome(rs.getString("nome"));
    	product.setCategoria(rs.getString("categoria"));
    	product.setMarca(rs.getString("marca"));
    	product.setImmagine(rs.getString("immagine"));
    	product.setIVA(rs.getFloat("IVA"));
        product.setPrezzo(rs.getFloat("prezzo"));
        product.setDescrizione(rs.getString("descrizione"));

        beans.add(product);
      }
    } 
    finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } 
      finally {
        if (connection != null)
          connection.close();
      }
    }
    return beans;
  }
  
  public synchronized ArrayList<ProductBean> doRetrieveAllByName(String keyword) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSQL = "SELECT * FROM " + TABLE + " WHERE nome LIKE '" + keyword + "%'" ;

    ArrayList<ProductBean> beans = new ArrayList<ProductBean>();

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
    	ProductBean product = new ProductBean();
    	product.setId(rs.getInt("id"));
        product.setNome(rs.getString("nome"));
        product.setCategoria(rs.getString("categoria"));
        product.setMarca(rs.getString("marca"));
        product.setImmagine(rs.getString("immagine"));
        product.setIVA(rs.getFloat("IVA"));
        product.setPrezzo(rs.getFloat("prezzo"));
        product.setDescrizione(rs.getString("descrizione"));

        beans.add(product);
      }
    } 
    finally {
      try {
        if (preparedStatement != null)
          preparedStatement.close();
      } 
      finally {
        if (connection != null)
          connection.close();
      }
    }
    return beans;
  }
  
  
}
