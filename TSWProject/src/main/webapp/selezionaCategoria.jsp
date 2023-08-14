<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seleziona Categoria</title>
</head>
<body>

<h2>Seleziona una categoria:</h2>

<form action="visualizzaProdotti" method="get">
    <input type="hidden" name="categoria" value="Attrezzature">
    <button type="submit">Attrezzature</button>
</form>

<form action="visualizzaProdotti" method="get">
    <input type="hidden" name="categoria" value="Alimenti">
    <button type="submit">Alimenti</button>
</form>

<form action="visualizzaProdotti" method="get">
    <input type="hidden" name="categoria" value="Accessori">
    <button type="submit">Accessori</button>
</form>
<!-- Aggiungi altri form per le categorie -->

</body>
</html>
