<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>

<%
   ArrayList<ProductBean> products= (ArrayList<ProductBean>) request.getAttribute("prodotti");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title> WorkInProgress Home </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>
.grid-container {
  display: grid;
  grid-template-columns: auto ;
  grid-template-rows: auto auto auto auto auto;
  gap: 60px;
  background: #ffffff;
 
  
}

.grid-container > div {
  font-size: 30px;
}

.slider-prodotti {
  width: 100%;
  height: 100%;
  overflow-x: hidden
;
  overflow-y: hidden;
  padding:0.5%;
  background: transparent;

}

.slider-container {
  display: flex;
  height: auto;

 
}
.product-card {
  
 flex : 0 0 20%;
 background: rgba(240,240,240);
 border: 2px solid #0000ff;
  border-radius: 20px;
  margin: 1%;
 text-align: center;
  width : 40%;
  height: 80%;
  padding : 2%; 
}

.slider-container img {
  width: 60%;
  height: 50%;
  transition: transform .2s;
  border: 2px solid #0000ff;
  border-radius: 10px;
  
}

.slider-container img:hover {
  -ms-transform: scale(1.2); /* IE 9 */
  -webkit-transform: scale(1.2); /* Safari 3-8 */
  transform: scale(1.2); 
}

.slider-container p,.slider-container a{
 font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
 font-size: 20px;

}

.product-card a:link,.product-card a:visited {
  background-color: white;
  color: black;
  border: 2px #0000ff;
  padding: 5%;
  border-radius: 20px;
  
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.product-card a:hover,.product-card a:active {
  background-color: #0000ff;
  color: white;
  padding: 5%;
  border-radius: 20px;
}

.banner{
  background-image: url("images/banner.jpg");
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0px;
  flex-direction: column;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover;
}

.content{
  
  text-align: center;
  background: rgba(255,255,255,0.7);
  padding: 5%;
  
} 

.content p,.content h1{

  font-family: "Times New Roman", serif, sans-serif; 
  font-size: 100%;
  color: #000000;
}

.content a:link,.content a:visited {
  
  background: rgba(255,255,255,0.1);
  color: black;
  border: 2px solid #0000ff;
  padding: 5%;
  border-radius: 20px;
  

  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.content a:hover,.content a:active {
  background-color: #0000ff;
  color: white;
  border-radius: 20px;
}

.slider-prodotti {
  display: flex;
  flex-flow: row wrap;
 padding-left: 5%;
 padding-top: 2%;
 padding-bottom: 2%;
 border-top-style: double;
 border-bottom-style: double;
 border-color: #0000ff;
}

.attrezzatura{
  
  flex : 0 0 30%;
  width : 32%;
  height: 45%;
  background-image: url("images/attrezzatura.jpg");
  overflow: hidden;
  margin :1%;
  text-align : center;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover;
  border-radius: 10px;
  border: 2px solid #0000ff;
  
  
  }
  
  .accessori{

    flex : 0 0 30%;
    width : 32%;
    height: 45%;
    background-image: url("images/accessori.jpg");
    overflow: hidden;
    margin :1%;
    text-align : center;
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Do not repeat the image */
    background-size: cover;
    border-radius: 10px;
    border: 2px solid #0000ff;
    

  }
  .foodandbeverage{

    flex : 0 0 30%;
    width : 32%;
    height: 45%;
    background-image: url("images/foodandbeverage.jpg");
    overflow: hidden;
    margin :1%;
    text-align : center;
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Do not repeat the image */
    background-size: cover;
    border-radius: 10px;
    border: 2px solid #0000ff;

  }
  .allenamenti{

    flex : 0 0 30%;
    width : 32%;
    height: 45%;
    background-image: url("images/allenamenti.jpg");
    overflow: hidden;
    margin :1%;
    text-align : center;
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Do not repeat the image */
    background-size: cover;
    border-radius: 10px;
    border: 2px solid #0000ff;

  }
  
  .testo{
    font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
    font-size: 50%;
    opacity: 0.0;
    transition: 0.5s;
    
  }
  .testo:hover {
    font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
    font-size: 50%;
    opacity: 0.7;
    background-color:white;
   
  }

h1{

display: flex;
justify-content: center;
text-align: center;
color: #0000ff;
padding: 1%;
border-top-style: double;
border-bottom-style: double;
border-color: #0000ff;
 font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 


}

@media screen and (max-width: 880px){

  .attrezzatura,.accessori,.foodandbeverage,.allenamenti{

  flex : 0 0 40%;
   width : 32%;
  height: 32%;
  }

}

@media screen and (max-width: 450px){

  .attrezzatura,.accessori,.foodandbeverage,.allenamenti{

  flex : 0 0 90%;
  height: 16%;
  
  }

}





</style>
 
</head>

<body>
  <div class="grid-container" id="1">
      <div class="header" >
        <%@include file="/WEB-INF/header.jsp" %></div>
      <div class="banner" >
        
        <div  class="content" >
          
          <h1>Work in Progress</h1>
          <p>Sfoglia il nostro catalogo </p>
          <a href="catalog"> Catalogo </a>
        
        </div>
      
      </div>
      
    <h1> Guarda i nostri prodotti!</h1>
      
      <div class="slider-prodottii">
            <div class="slider-container">
                <% for (ProductBean prodotto : products){%>
                 <div class = "product-card">
                     <img src= "<%= "images//" + prodotto.getImmagine() %>" alt="<%=prodotto.getNome() %>">
                     <p><b><%=prodotto.getNome()%></b></p>
                     <p><b><%=prodotto.getPrezzo()%>€</b></p>
                     <a href="<%= "details?id=" + prodotto.getId() %>"> Product details</a>
                 </div>
 
                <% } %>
            </div>
         </div>
     
         
         <h1> Mantieniti in forma con i nostri articoli per l'allenamento, e non solo!</h1>
      
      <div class="slider-prodotti">
        
              <div class="attrezzatura">
                    <div class="testo">
                      <h3>Attrezzatura</h3>
                      <p>La categoria "Attrezzatura" nel nostro e-commerce è il luogo ideale per trovare tutto ciò di cui hai bisogno per raggiungere i tuoi obiettivi di fitness e costruire un fisico forte e scolpito. Sia tu un principiante nel mondo del bodybuilding o un atleta esperto, abbiamo una vasta selezione di attrezzature di alta qualità per soddisfare le tue esigenze.</p>
					  <p>Dall'allenamento con i pesi liberi alla forza funzionale, dal cardio al recupero post-allenamento, la nostra categoria di attrezzature offre una gamma completa di prodotti che ti aiuteranno a ottenere risultati straordinari.</p>
                    </div>
              </div> 
              
              <div class="accessori">
                
                    <div class="testo">
                      <h3>Accessori</h3>
                      <p>La categoria "Accessori" offre una vasta selezione di accessori di alta qualità che ti aiuteranno a ottimizzare il tuo allenamento, migliorare le prestazioni e raggiungere i tuoi obiettivi di fitness.</p>
                      <p>Gli accessori sono spesso il tocco finale che fa la differenza nei tuoi allenamenti, offrendo comfort, sicurezza e versatilità. Un buon paio di guanti, una cintura resistente, uno comodo shaker ed un abbigliamento adeguato non potranno fare altro che migliorare la tua esperienza durante l'allenamento. </p>
                    </div>
                  
              </div> 
              
              <div class="foodandbeverage">
                
                  <div class="testo">
                    <h3>Food and Beverage</h3>
                    <p>La categoria "Food and Beverage" offre un'ampia selezione di prodotti alimentari e bevande appositamente selezionati per supportare il tuo regime di allenamento, aiutarti a recuperare e massimizzare i tuoi risultati nel mondo del bodybuilding e non solo.</p>
                  	<p>Energy Drink, barrette proteiche, integratori alimentari, alimenti biologici e naturali, bevande per il recupero e cibi fit sono solo alcuni dei prodotti che questa sezione ha da offrire.</p>
                  </div>
             
              </div>
              
              
              <div class="allenamenti">
               
                  <div class="testo">
                    <h3>Allenamenti</h3>
                    <p>La sezione "Allenamenti" è una peculiarità del nostro sito. Qui potrai trovare piani di allenamento per tutte le età e per tutti i livelli di esperienza: che tu sia un principiante o un atleta esperto, troverai l'allenamento giusto per te.</p>
                    <p>Una selezione di Workouts preparati e studiati dai più attenti coach per stimolare al meglio qualsiasi tipo di fisico è soltanto uno dei molteplici punti di forza di questo e-commerce. Questa categoria ha molto altro da offrire, vai a scoprirlo!</p>
                  </div>
                
              </div> 
        
      </div>
      
      <div class="footer">
         <%@include file="/WEB-INF/footer.jsp" %>
      </div>

</div>



</body>

</html>