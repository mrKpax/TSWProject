<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Articolo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visualizza Prodotti</title>
</head>
<body>

<h2>Prodotti della categoria <%= request.getParameter("categoria") %> :</h2>

<%
    List<Articolo> articoli = (List<Articolo>) request.getAttribute("articoli");
    for (Articolo articolo : articoli) {
%>
    <div>
        <h3><%= articolo.getNome() %></h3>
        <p><%= articolo.getDescrizione() %></p>
        <p>Prezzo: <%= articolo.getPrezzo() %></p>
        <p>Immagine:  <%= articolo.getImmagine() %></p>
        <img src="<%= articolo.getImmagine() %>" alt="Immagine del prodotto">
    </div>
<%
    }
%>

<br>
<a href="selezionaCategoria.jsp">Seleziona un'altra categoria</a>

</body>
</html>

