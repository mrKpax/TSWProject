<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Footer</title>
    <style>
    
     
    footer{
        font-size: 30px;
    
    }
    
    .container{
        display: flex;
        flex-direction: row;
        height: auto;
        justify-content: center;
        border-top-style: double;
        border-color: #0000ff;
    }
    
    .contattaci{
        height: 90%;
        width: 90%;
        text-align: center;
        padding:2%;
    }
    
    .informazioni{
        height: 90%;
        width: 90%;
        text-align: center;
        padding:2%;
    }
    
    .social{
        height: 90%;
        width: 90%;
        text-align: center;
        padding:2%;
    }
    
    .contattaci h1, .informazioni h1, .social h1{

        display: flex;
        justify-content: center;
        color: #0000ff;
        padding: 1%;
        border-top-style: double;
        border-bottom-style: double;
        border-color: #000000;
        font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
        font-size: 95%;
    }
    .contattaci p, .informazioni p, .social p{

        display: flex;
        justify-content: center;
        color: #000000;
        padding: 1%;
        font-size: 70%;
       
        font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
    }
    .informazioni a{

        display: flex;
        justify-content: center;
        color: #000000;
        padding: 1%;
        border-color: #0000ff;
        font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
        font-size: 95%;
    }
    
    .icon-instagram:hover {
        color: #F166D9;
    }
    .icon-facebook:hover {
        color: #0000ff;
    }
    .icon-linkedin:hover {
        color: #0077B5;
    }
    .fa.fa-instagram{
        font-size: 100%;
    
    }
    .fa.fa-facebook{
        font-size: 100%;

    }
    .fa.fa-linkedin{
        font-size: 100%;

    }
    
    @media screen and (max-width: 800px){
        
        footer{
            font-size: 20px;

        }
    
    }
    
    @media screen and (max-width: 480px){

        footer{
            font-size: 10px;

        }

    }



    </style>

</head>

<body>
<footer>

    <div class="container">

        <div class="contattaci">
            <h1>Contatti</h1>
            <p> +39 3335577999 </p>
            <p>WorkInProgress@gmail.com</p>
        </div >


        <div class="social">
            <h1>Seguici!</h1>
            <p class="icon-instagram"><i class="fa fa-instagram" aria-hidden="true"></i>&nbsp;Work_in_Progress</p>
            <p class="icon-facebook"><i class="fa fa-facebook" aria-hidden="true"></i>&nbsp;Work_in_Progress</p>
            <p class="icon-linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i>&nbsp;Work_in_Progress</p>


        </div>

        <div class="informazioni">
            <h1>Info</h1>
            <p> <a href = "aboutus.jsp"> About us </a></p>
            <p> <a href = "customerservice.jsp">  FAQ and costumer service</a></p>
        </div>     
</div>

</footer>
</body>

</html>