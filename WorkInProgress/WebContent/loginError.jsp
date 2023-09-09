<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Error</title>
    <link rel="stylesheet" type="text/css" href="./styles/errorStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
        p{
            margin-top: 30px;
        }
    
    </style>
    
</head>
<body>
    <h3>Ops... Qualcosa è andato storto!</h3>
    
        <img src="images//error.png" class="errorImg"alt="Error" >

    <p> Sei sicuro di essere registrato?
        Se non lo sei, prova a <a href="registration">registrarti <i class="fa fa-user-plus" aria-hidden="true"></i></a> 
    </p>

    <p> Se sei già registrato o hai inserito le credenziali errate,
         torna al <a href="login">login <i class="fa fa-sign-in" aria-hidden="true"></i></a> 
    </p>

</body>
</html>