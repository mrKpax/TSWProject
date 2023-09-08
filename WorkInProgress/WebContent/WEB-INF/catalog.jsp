<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title> WorkInProgress Catalog </title>
    <link rel="stylesheet" type="text/css" href="./styles/catalogStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>
    	.grid-container {
        	display: grid;
            grid-template-columns: 20% 80%;
            grid-template-rows: auto auto auto;
            gap: 10px;
            background-color: #ffffff;
        }
    
        .grid-container > div {
            font-size: 20px;
        }
        
        .catalogo-container{
       		width: 100%;
          	height: 100%;
   		}
        
        .catalogo{       
            display: flex;
            font-size:20px;
            flex-wrap: wrap;
            flex-direction: row;
            height: auto;        
        }
        
        .card{
            flex : 0 0 25%;
            background: rgba(240,240,240);
            border: 1px solid #0000ff;
            border-radius: 10px;
            margin: 1%;
            text-align: center;
            padding : 2%;                        
        }

        .catalogo img {
          	width: 80%;
         	height: 65%;
          	transition: transform .2s;
          	border: 2px solid #0000ff;
          	border-radius: 20px;
        }
        
        .catalogo img:hover {
          	-ms-transform: scale(1.1); /* IE 9 */
          	-webkit-transform: scale(1.1); /* Safari 3-8 */
          	transform: scale(1.1); 
        }
        
        .catalogo p,.catalogo a{
         	font-family: "Times New Roman", serif, sans-serif; 
         	font-size: 18px;
        }
        
        .card a:link,.card a:visited {          
          	color: black;         
          	padding: 2%;
          	text-align: center;
          	text-decoration: none;
          	display: inline-block;
        }
        
        .card a:hover,.card a:active {       
          	color: #AEA4B4;
          	padding: 2%;         
        }
        
        .filter-container{
        	text-align:center;
        	width: 100%;
          	height: 100%;
        	border: 1px solid  #0000ff;
        	background: rgba(240,240,240);
        	border-radius:5px;
        	overflow-y: hidden;
        	padding-bottom: 0;
        }

        .filter{
            display: flex;
            font-size: 17px;
            flex-wrap: wrap;
            flex-direction: column;
            height: auto;
            padding:2%;                
        }
        
        .macro{
          	text-align:center;
          	width: auto;
          	height: auto;
          	margin-top:10px;
        	margin-bottom:10px;          
          	color: #000000;
        }
         
        .checkboxInterne{	            
            text-align:center;
            border-top-style: double;
            border-bottom-style: double;
            border-color: #000000;
            padding: 2%;
            margin-top:5px;  
        }
        
        .macro input[type="checkbox"]{
        	accent-color: #634B66;        
        }
        
        .searchbar input[type="text"]{
            border-radius: 10px;
            padding: 2px;
            width: 30%;
            height: auto;
            border-top: solid;
        	border-bottom: solid;    
        }
        
        h2{
        	font-size: 30px;
        	color: #0000ff;
        	text-align:center;        
        }
        
		button {
          	padding: 5px 10px;
      	   	margin: 0 5px;
            border: 2px solid #0000ff;
            border-radius: 10px;
            background-color: #fff;
            cursor: pointer;
            text-align: center;
            font-size: 18px;
            letter-spacing: 1px;
           	font-family: "Times New Roman", serif, sans-serif;
        }
            
        button:hover {
           	color: white;
            background-color: #0000ff;
        }
            
        button:active {
           	transform: scale(0.9);
        }
            
        .categoria {
            padding: 5px 10px;
            margin: 0 5px;
            transition: transform .5s;
            border-radius:0;
            border:none;
            color: #0000ff;
            cursor: pointer;
            text-align: center;
            font-size: 18px;
            letter-spacing: 1px;
        }
        
        .categoria:active {
           	transform: scale(0.9);
        }
            
        .categoria:hover {
           	color: #0000ff;
          	background-color: white;
            border-bottom: 1px solid #0000ff;
        }
        
        @media screen and (max-width: 880px){
       		.searchbar input[type="text"]{
          		width: 30%;
        	}
        
        	.categoria {
          		display:none;
			}
        
        	.catalogo{
          		font-size:17px;
          	}
          	
        	.card {
				flex : 0 0 40%;
        	}

        	.catalogo img {
         		width: 80%;
          		height: 65%;
			}
			
        	h2{
          		font-size: 20px;
        	}
		}

		@media screen and (max-width: 1030px){
		  	.searchbar input[type="text"]{
    			width: 30%;
   			}
   			
  			.categoria {
    			padding: 5px 7px;
    			margin: 0 3px;
    			font-size: 15px;   
 			}  
		}

		@media screen and (max-width: 430px){
  			.searchbar input[type="text"]{
   		 		width: 40%;
    		}
    		
    		h2,h3{
      			font-size: 15px;
    		}
    
    		.searchbar{
      			padding-top:10%;
    		}
    
    		button {
      			padding: 2px 2px;
      			font-size: 10px;
      			letter-spacing: 0px;
    		}
    		
    		.filter-container{      
      			padding:3%;
      		}
    
    		.filter{
      			font-size:13px;
			}

    		.macro{
      			margin-top:7px;
      			margin-bottom:7px;
			}
			
  			.checkboxInterne{   
      			padding-left:15%;
    		}
    		
    		.macro input[type="checkbox"]{
      			accent-color: #634B66;
      			transform: scale(0.6);
    		}
    		
    		.filter-container input[type="number"]{
      			transform: scale(0.7);
    		}
    		
    		.filter-container button{
      			font-size: 13px;
    		}
    
    		.card {
      			flex : 0 0 90%;
    		}
		}
    </style>
</head>

<body>
    <div class="grid-container">
        <div class="header" >
            <%@include file="/WEB-INF/header.jsp" %></div>
    
    <h2>Our Catalog</h2>
    
    
    <div class="searchbar">
    
        <input type="text" list="list" id="search" placeholder="Search products..."  oninput="doSuggest()" >
        <span class="suggestBar">
            <datalist class="suggestBar" id="list" style="width: 300px;">
            
            </datalist>
        </span>
        <button onclick="ajaxFilter()"><i class="fa fa-search" aria-hidden="true"></i></button>
        <button onclick="reset()"><i class="fa fa-times" aria-hidden="true"></i></button>
     
        &nbsp;&nbsp;
        <button class="categoria" value="Attrezzatura"><b>Attrezzatura</b></button>
        <button class="categoria" value="Accessori"><b>Accessori</b></button>
        <button class="categoria" value="Abbigliamento"> <b>Abbigliamento</b></button>
        <button class="categoria" value="FoodAndBeverage"><b>Food and Beverage</b></button>
        <button class="categoria" value="Allenamenti"><b>Allenamenti</b></button>
     
        
    </div>
    
    <div class="filter-container">
        <h3 style="color:#0000ff"> Filter your search </h3>
        <button onclick="activeFilter()">Filter</button>
        <div id="filter" class="filter">
            
         <div class="macro">
            <input type="checkbox" id="prezzo" name="prezzo" value="price" onchange="enablePrice()" >
            <label for="prezzo" >Price</label>
            
            <div class="checkboxInterne" id="1">
            <label for= "prezzo_da"> From </label>
            <input name = "prezzo_da" id = "prezzo_da" type="number" required style="width:20%"><br>
            <label for= "prezzo_a"> To  </label>
            <input name = "prezzo_a" id = "prezzo_a" type="number" required style="width:20%">
           </div>
         </div>
         
         <div class="macro">
             <input type="checkbox" id="categoria" name="categoria" value="categoria" onchange="enableCategory()">
             <label for="categoria">Category</label>
             
             <div class="checkboxInterne" id="3" >
                <input type="checkbox" id="attrezzatura" name="attrezzatura" value="Attrezzatura">
                <label for="attrezzatura">Attrezzatura</label><br>
                <input type="checkbox" id="accessori" name="accessori" value="Accessori">
                <label for="accessori">Accessori</label><br>
                <input type="checkbox" id="abbigliamento" name="abbigliamento" value="Abbigliamento">
                <label for="abbigliamento">Abbigliamento</label><br>
                <input type="checkbox" id="fab" name="fab" value="FoodAndBeverage">
                <label for="fab">Food and Beverage</label><br>
                <input type="checkbox" id="allenamenti" name="allenamenti" value="Allenamenti">
                <label for="allenamenti">Allenamenti</label>
            </div>
                
         </div>
        
    
        <button onclick="ajaxFilter()">Filter</button>
    </div>
    
</div>
    
    <div class="catalogo-container" >
    <div class="catalogo" id = "catalogTable">
    
    
    </div>

</div>
    
    <div class="footer">
        <%@include file="footer.jsp" %>
    </div>
    
</div>
    
    <script>
        $(document).ready(function(){
        	$(".filter").css("display", "none");
        	$(".checkboxInterne").css("display", "none");            
            $.ajax({
                url: 'catalog',
                type: 'GET',
                success: function(resp) {
                    $("#catalogTable").empty();                   
                    for (let item of resp) {
                        $("#catalogTable").append("<div class='card'><a target='_blank' href='images//" +item.immagine+"'><img src='images//" +item.immagine+"' alt='"+item.nome+"'></a><p>"+item.nome+"</p><p>"+item.prezzo+"€</p><a href='details?id="+item.id+"'> <i class='fa fa-eye' aria-hidden='true''></i></a><a href='cart?action=add&id="+item.id+"'><i class='fa fa-cart-plus' aria-hidden='true'></i></a></div>");                                                                        
                    }
                }
            });                                  
        });
                 
        $("button.categoria").click(function() {
            var fired_button = $(this).val();
 
            $.ajax({
             	url: 'catalog?action=searchByCategory',
                type: 'GET',
                data : {category : fired_button},
                success: function(resp) {
                	$("#catalogTable").empty();
                    for (let item of resp) {
                    	$("#catalogTable").append("<div class='card'><a target='_blank' href='images//" +item.immagine+"'><img src='images//" +item.immagine+"' alt='"+item.nome+"'></a><p>"+item.nome+"</p><p>"+item.prezzo+"€</p><a href='details?id="+item.id+"'> <i class='fa fa-eye' aria-hidden='true''></i></a><a href='cart?action=add&id="+item.id+"'><i class='fa fa-cart-plus' aria-hidden='true'></i></a></div>");
                    }
                }
            });
        });
    
        function doSuggest(){
            var keyword = $('#search').val();
            $.ajax({
                url: 'catalog?action=suggest',
                method: 'GET',
                data: { keyword : keyword },
                success: function(resp){
                    $("#list").empty();
                    for (let item of resp){
                        $("#list").append("<option style='width: 300px;'>"+item.nome+"</option>");
                        
                    }
                }
            });
        }
        
        function ajaxFilter(){
            var keyword = $('#search').val();
            
            if($("#prezzo:checked").val()==undefined){
                $("#prezzo").val("");
            }else{
                $('#prezzo').val("prezzo");
            }
            var prezzo_da = $('#prezzo_da').val();
            var prezzo_a = $("#prezzo_a").val();
            
            if($("#categoria:checked").val()==undefined){
                $("#categoria").val("");
            }else{
                $('#categoria').val("categoria");
            }
            
            if($("#attrezzatura:checked").val()==undefined){
                $("#attrezzatura").val("");
            }else{
                $('#attrezzatura').val("Attrezzatura");
            }
            
            if($("#accessori:checked").val()==undefined){
                $("#accessori").val("");
            }else{
                $('#accessori').val("Accessori");
            }
            
            if($("#abbigliamento:checked").val()==undefined){
                $("#abbigliamento").val("");
            }else{
                $('#abbigliamento').val("Abbigliamento");
            }
            
            if($("#fab:checked").val()==undefined){
                $("#fab").val("");
            }else{
                $('#fab').val("FoodAndBeverage");
            }
            
            if($("#allenamenti:checked").val()==undefined){
                $("#allenamenti").val("");
            }else{
                $('#allenamenti').val("Allenamenti");
            }       
            
            $.ajax({
                url: 'catalog?action=filter',
                method: 'GET',
                data: { keyword : keyword,
                        prezzo: $('#prezzo').val(),
                        prezzo_da: prezzo_da,
                        prezzo_a: prezzo_a,
                        categoria:$('#categoria').val(),
                        attrezzatura: $('#attrezzatura').val(),
                        accessori: $('#accessori').val(),
                        abbigliamento: $('#abbigliamento').val(),
                        fab: $('#fab').val(),
                        allenamenti: $('#allenamenti').val(),
                },
                success: function(resp) {
                    $("#catalogTable").empty();
                        for (let item of resp) {
                            $("#catalogTable").append("<div class='card'><a target='_blank' href='images//" +item.immagine+"'><img src='images//" +item.immagine+"' alt='"+item.nome+"'></a><p>"+item.nome+"</p><p>"+item.prezzo+"€</p><a href='details?id="+item.id+"'> <i class='fa fa-eye' aria-hidden='true''></i></a><a href='cart?action=add&id="+item.id+"'><i class='fa fa-cart-plus' aria-hidden='true'></i></a></div>");
                            }
                        }
                    });

                }
                        
        function reset() {
            $("#search:text").val("");
            $("#prezzo").prop("checked", false);
            enablePrice();
            $("#categoria").prop("checked", false);
            enableCategory();
        }
        
        function activeFilter(){
            $("#filter").toggle();
        }
        
        function enablePrice() {
           if ($("#prezzo").prop("checked") == true ) {  
                $(".checkboxInterne#1").css("display","block");
            }
            else{
                $(".checkboxInterne#1").css("display","none"); 
            }
        }
        
        function enableCategory() {
            if ($("#categoria").prop("checked") == true ) {  
                $(".checkboxInterne#3").css("display","block");  
            }
            else{
                $(".checkboxInterne#3").css("display","none"); 
            }
        }

    
    </script>
    
    
</body>

</html>