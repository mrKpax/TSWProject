<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>

<%

ClientBean clientbean = (ClientBean) request.getSession().getAttribute("utente");

%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Header</title>
<style>
 body {
 	margin: 0;
 	padding: 0;
 	margin-top: 0;
 }
 
  header .grid-container{
    display: grid;
    grid-template-columns: 5% 10% 80% 5%;
    gap: 0px;
    background: #000000;
  
  }
  header .grid-container > div {

    text-align: center;
    font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
    font-size:30px;
  }
  
  .logo{
    width: auto;
    height: auto;
    padding-top: 10%;
  }
  
  .logo img{
    width: 100%;
    height: auto;
  }
  
  .main-header{
    padding-top:1%;
    padding-bottom:1%;
  }
  
  .main-header a:link,.main-header a:visited {
    color: #0000cc;
    padding: 1%;
    border-radius: 20px;
    margin:1%;
    text-align: center;
    text-decoration: none;
    display: inline-block;
  }
  
  .main-header a:hover,.main-header a:active {
    background-color: #0000ff;
    color: white;
    padding: 1%;
    margin:1%;
    border-radius: 20px;
    display: inline-block;
  }
  
  .carrello{
    font-size: 30px;
    padding-top:30%;
  }

	header {
 	 overflow: hidden;
 	 width: 100%;
 	 z-index: 999;
	}

	.fa.fa-shopping-cart {
 	 font-size: 40px;
 	 color: #0000ff;
	}

@media screen and (max-width: auto) {
  .main-header {
     display: none;
  
  }
  
  .carrello{
    font-size: 20px;
    justify-content: center;
    align-content: center;
    align-text: center;
    padding:50%;
  }
 
}

::-webkit-scrollbar {
  width: 15px;
}


::-webkit-scrollbar-thumb {
  background: #0000ff; 
}

::-webkit-scrollbar-thumb:hover {
  background: #003d99; 
}

</style>
</head>
<body>
  <header>
    <div class="grid-container"> 
  
      <div class= "menu">
          
        </div>
        
        <div class="logo">
          
          <a href="home">
  			<img src="images//logoWIP.png" class="logo" alt="logo">
		  </a>
        
        </div>

          <div id="main" class="main-header">

          
            <% if (clientbean == null) { %>
           
                 
                 <a href="home">  Home  </a>
                 <a href="catalog">  Catalog  </a>
               	 <a href="login"> Login </a>
       			 <a href="registration"> Register </a>

              <% } %>
          
          
            <% if (clientbean != null && !clientbean.getEmail().equals("WorkInProgress@gmail.com")  ) { %>
           
                  
                  <a href="home">  Home  </a>
                  <a href="catalog">  Catalog  </a>
                  <a href="admin?action=ordersByFilter"> My Orders </a>
        		  <a href="login?action=logout"> Logout </a>
               
              
              <% } %>
              
              <% if (clientbean != null && clientbean.getEmail().equals("WorkInProgress@gmail.com")) { %>
              
                    
                  <a href="home">  Home  </a>
                  <a href="catalog">  Catalog  </a>
                  <a href="admin?action=ordersNoFilter"> Orders </a>
          		  <a href="admin?action=clientsNoFilter"> Clients </a>
        		  <a href="admin"> Admin </a>
        		  <a href="login?action=logout"> Logout </a>
                
          
                <% } %>

            </div>
            
            <div class="carrello">
              
              <% if (clientbean==null || !clientbean.getEmail().equals("WorkInProgress@gmail.com")) { %>
                
              <a href="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
               
              <% } %>
              
            </div>
            
          </div>
      </header>
</body>
</html> 
        