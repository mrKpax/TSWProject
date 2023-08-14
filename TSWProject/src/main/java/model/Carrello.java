package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {
    private List<Articolo> articoli;
    private double totale;

    public Carrello() {
        articoli = new ArrayList<>();
        totale = 0.0;
    }

    public void aggiungiArticolo(Articolo articolo) {
        articoli.add(articolo);
        totale += articolo.getPrezzo();
    }

    public void rimuoviArticolo(Articolo articolo) {
        articoli.remove(articolo);
        totale -= articolo.getPrezzo();
    }

    public void svuotaCarrello() {
        articoli.clear();
        totale = 0.0;
    }

    public List<Articolo> getArticoli() {
        return articoli;
    }

    public double getTotale() {
        return totale;
    }
}
