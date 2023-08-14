<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inserisci Articolo</title>
</head>
<body>

<h2>Inserisci un nuovo articolo</h2>

<form action="inserisciArticolo" method="post" enctype="multipart/form-data">
    Nome: <input type="text" name="nome" required><br>
    Descrizione: <input type="text" name="descrizione" required><br>
    Immagine: <input type="file" name="immagine" accept="image/*" required><br>
    Quantità: <input type="number" name="quantita" required><br>
	<select name="categoria" required>
        <option value="">Categoria</option>
        <option value="Alimenti">Alimenti</option>
        <option value="Attrezzature">Attrezzature</option>
        <option value="Casa">Accessori</option>
    	</select><br>
    Marca: <input type="text" name="marca" required><br>
    Prezzo: <input type="number" name="prezzo" required><br>
    IVA: <input type="number" name="iva" required><br>
    <input type="submit" value="Inserisci">
</form>

<br>
<a href="index.jsp">Torna alla homepage</a>

</body>
</html>
