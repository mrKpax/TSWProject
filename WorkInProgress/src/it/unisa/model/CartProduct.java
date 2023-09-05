package it.unisa.model;

public class CartProduct {
	  
    private ProductBean product;
    private int quantity;
    
    public CartProduct(ProductBean product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    
    public CartProduct (ProductBean product) {
        this.product = product;
        this.quantity = 1;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getQuantity () {
        return quantity;
    }
    
    public ProductBean getProduct() {
        return product;
    }
    
}
