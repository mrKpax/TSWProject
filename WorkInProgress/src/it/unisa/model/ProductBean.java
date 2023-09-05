package it.unisa.model;

public class ProductBean {
	  
	  private int id;
	  private String nome;
	  private String categoria;
	  private String descrizione;
	  private String marca;
	  private String immagine;
	  private float IVA;
	  private float prezzo;
	  
	  public ProductBean(){
	    //costruttore vuoto
	  }
	  
	  public int getId(){
	    return id;
	  }
	  
	  public void setId(int id){
	    this.id = id;
	  }
	  
	  public String getNome(){
	    return nome;  
	  }
	  
	  public void setNome(String nome){
	    this.nome = nome;
	  }
	  
	  public String getCategoria(){
	    return categoria;  
	  }

	  public void setCategoria(String categoria){
	    this.categoria = categoria;
	  }
	  
	  public String getMarca(){
	    return marca;  
	  }

	  public void setMarca(String marca){
	    this.marca = marca;
	  }
	  
	  public String getImmagine(){
	    return immagine;  
	  }

	  public void setImmagine(String immagine){
	    this.immagine = immagine;
	  }
	  
	  public float getIVA(){
	    return IVA;
	  }

	  public void setIVA(float IVA){
	    this.IVA = IVA;
	  }
	  
	  public float getPrezzo(){
	    return prezzo;  
	  }

	  public void setPrezzo(float prezzo){
	    this.prezzo = prezzo;
	  }
	  
	  public String getDescrizione(){
	    return descrizione;  
	  }

	  public void setDescrizione(String descrizione){
	    this.descrizione = descrizione;
	  }
	  
	}
