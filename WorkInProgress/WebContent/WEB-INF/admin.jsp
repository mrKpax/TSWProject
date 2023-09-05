<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, model.*" pageEncoding="UTF-8"%>

<%


ProductBean j = (ProductBean) request.getAttribute("product");
String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>
        <title> Admin Page </title>
        <link rel="stylesheet" type="text/css" href="./styles/multi-formStyle.css">
        <style>
            .submitContainer{
                display: flex;
                flex-direction: row;
                gap: 10px;
            }
            
          input[type="submit"], input[type="reset"] {
                height:60%;
                border-radius: 5px;
                border: 2px solid #4c8577;
                cursor: pointer;
                background-color: transparent;
                transition: 0.5s;
                text-transform: uppercase;
                font-size: 11px;
                letter-spacing: 2px;
                margin-bottom: 1em;
                color: #4c8577;
            }

      input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #4c8577;
            color: white;
        }
        
            #load, #delete {
            color: #AEA4B4;
            border: 2px solid #AEA4B4;
            }
            
           #load:hover, #delete:hover {
            background-color: #AEA4B4;
            color: white;
            }
            
            
        </style>
</head>

<body>
    <div class="grid-container">
        <div class="header">
            <%@include file="header.jsp" %></div>
        <div class="screen-container">    
        <span class="title"> Admin Page </span>
        
        <div class="transparentCard">
        <% if (error != null){%>
                <div class="errorNoTranslate"><%=error%></div>
        <%}%>
        <form class="formContainer" action="admin" method="post" enctype="multipart/form-data">
                <span class="subtitle">Aggiungi un prodotto</span>
                <input type="hidden" name="action" value="insert">

                <div class="inputBox">
                    <input name="name" type="text" maxlength="50" required autocomplete="off" placeholder="enter name">
                <label for="name">Name:</label>
                </div>
                
                <div class="inputBox special">
                <label for="category">Category:</label>
                <select name="category">
                    <option value="Accessori"> Accessori </option>
                    <option value="Attrezzatura"> Attrezzatura </option>
                    <option value="FoodAndBeverage"> FoodAndBeverage </option>
                    <option value="Abbigliamento"> Abbigliamento </option>
                    <option value="Allenamenti"> Allenamenti </option>

                </select>
                </div>
                
                <div class="inputBox">
                	<input name="brand" type="text" maxlength="50" required autocomplete="off" placeholder="enter brand">
                <label for="brand">Brand:</label>
                </div>

                <div class="inputBox special">
                <label for="image">Image:</label>
                <input name="image" type="file" required>
                </div>

                <div class="inputBox special">
                <label for="IVA">IVA:</label>
                <input name="IVA" type="number" min="1" max="22" value="22" required>
                </div>

                <div class="inputBox special">
                <label for="price">Price:</label>
                <input name="price" type="number" min="1" max='5000' required>
                </div>

                <div class="inputBox special">
                <label for="description">Description:</label>
                <textarea name="description" maxlength="500" rows="3" required placeholder="enter description"></textarea>
                </div>
                
                <div class="submitContainer">
                <input class="submit" type="submit" value="Add">
                <input class="submit" type="reset" value="Reset">
                </div>
        </form>
        

        <form class="formContainer" action="admin" method="post">
                <span class="subtitle">Aggiorna con nuove info</span>
                <input type="hidden" name="action" value="load">
                <fieldset>
                        <legend> Inserisci l'ID del prodotto da modificare</legend>
                        <label for="id">Id:</label>
                        <input name="id" type="number" required>
                        <input id="load" type="submit" value="Load">
                </fieldset>
        </form>

        <%if(j != null){%>
        	<form class="formContainer" action="admin" method="post">
        		<input type="hidden" name="action" value="modify">
        		<input type="hidden" name="idM" value=<%=j.getId() %>>
                
                <div class="inputBox">
                <input name="nameM" type="text" maxlength="50" required value="<%=j.getNome() %>">
                <label for="name">Name:</label>
                </div>
                
                <div class="inputBox special">
                <label for="category">Category:</label>
                <select name="categoryM">
                    <option value="Accessori"> Accessori </option>
                    <option value="Attrezzatura"> Attrezzatura </option>
                    <option value="FoodAndBeverage"> FoodAndBeverage </option>
                    <option value="Abbigliamento"> Abbigliamento </option>
                    <option value="Allenamenti"> Allenamenti </option>
                </select>
                </div>
                
                <div class="inputBox">
                <input name="brandM" type="text" maxlength="50" required value="<%=j.getMarca() %>">
                <label for="brand">Brand:</label>
                </div>
                
                <div class="inputBox special">
                <label for="image">Image:</label>
                <input name="imageM" type="text" maxlength="100" required value="<%=j.getImmagine() %>">
                </div>
                
                <div class="inputBox special">
                <label for="IVA">IVA:</label>
                <input name="IVAM" type="number" min="1" max='22' required value="<%=j.getIVA() %>">               
                </div>
                
                <div class="inputBox special">
                <label for="price">Price:</label>
                <input name="priceM" type="number" min="1" max='5000' required value="<%=j.getPrezzo() %>">
                </div>
                
                <div class="inputBox special">
                <label for="description">Description:</label>
                <textarea name="descriptionM" maxlength="500" rows="3" required><%=j.getDescrizione() %></textarea>
                </div>
                
                <div class="submitContainer">
                <input class="submit" type="submit" value="Modify">
                </div>
           </form>

        <%}%>

        <form class="formContainer" action="admin" method="post">
                <span class="subtitle">Elimina un prodotto</span>
                <input type="hidden" name="action" value="delete">
                <fieldset>
                        <legend> Inserisci l'ID del prodotto da eliminare</legend>
                        <label for="id">Id:</label>
                        <input name="id" type="number" required>
                        <input id="delete" type="submit" value="Delete">
                </fieldset>
        </form>
      </div>  
    </div>    
        
        <div class="footer">
        <%@include file="/WEB-INF/footer.jsp" %>
    </div>

</div>
</body>
</html>