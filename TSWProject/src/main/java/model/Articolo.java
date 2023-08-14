package model;

public class Articolo {
    private int id;
    private String nome;
    private String descrizione;
    private String immagine;
    private int quantita;
    private String categoria;
    private String marca;
    private int prezzo;
    private int iva;

    public Articolo() {
    }

    public Articolo(String nome, String descrizione, String immagine, int quantita, String categoria, String marca, int prezzo, int iva) {
        this.nome = nome;
        this.descrizione = descrizione;
        this.immagine = immagine; // Aggiungo il percorso dell'immagine
        this.quantita = quantita;
        this.categoria = categoria;
        this.marca = marca;
        this.prezzo = prezzo;
        this.iva = iva;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(int prezzo) {
        this.prezzo = prezzo;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }
}
