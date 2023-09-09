<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Service</title>
    <style>		
		body {
            font-family: Impact,Haettenschweiler,Franklin Gothic Bold,Charcoal,Helvetica Inserat,Bitstream Vera Sans Bold,Arial Black,sans serif; 
            margin: 0;
            padding: 20px;     
        }
        
        h1 {
            color: #0000ff ;
            text-align: center;
            font-size: 36px;
        }
        
		.contact-info,
		.other-info {
		    margin: 20px;
		    padding: 10px;
		    background-color: #fff;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}
		
		.contact-info h3,
		.other-info h3 {
		    margin-top: 0;
		    color: #0000ff; 
		}
		
		.contact-info p,
		.other-info p {
		    margin: 5px 0;
		}
		
		.other-info ul {
		    list-style-type: disc;
		    padding-left: 20px;
		}
		
		.other-info ul li {
		    margin-bottom: 10px;
		}		    
    </style>
</head>
<body>
    <%@include file="/WEB-INF/header.jsp" %>
    <h1>Customer Service</h1>

    <div class="contact-info">
        <h3>Contatti</h3>
        <p>Se hai domande o hai bisogno di assistenza, non esistare a contattarci:</p>
        <p>Email: WorkInProgress@gmail.com</p>
        <p>Telefono: 3335577999</p>
    </div>

    <div class="other-info">    
        <h3>Spedizioni</h3>
        <p>Abbiamo diversi servizi di spedizione in base alle tue esigenze:</p>
        <ul>
            <li><strong>Express Shipping:</strong> Consegna in 3-5 giorni lavorativi.</li>
            <li><strong>Standard Shipping:</strong> Consegna in 7-10 giorni lavorativi.</li>
            <li><strong>Economic Shipping:</strong> Consegna in 12-15 giorni lavorativi.</li>
        </ul>

        <h3>FAQs</h3>
        <p>Risposte ad alcune domande frequenti:</p>
        <ul>
            <li><strong>Posso tracciare lo stato del mio ordine?</strong> Una volta spedito, ti forniremo via email un link per poter tracciare lo stato della spedizione.</li>
            <li><strong>Quali metodi di pagamento accettate?</strong> Accettiamo pagamenti con tutte le carte (di credito o di debito) dei principali circuiti ed anche via Paypal.</li>
            <li><strong>Offrite spedizioni internazionali?</strong> Sì, offriamo anche spedizioni internazionali, così che i nostri clienti possano essere liberi di ordinare da qualsiasi parte del mondo.</li>
        </ul>
    </div>
    <%@include file="/WEB-INF/footer.jsp" %>
</body>
</html>