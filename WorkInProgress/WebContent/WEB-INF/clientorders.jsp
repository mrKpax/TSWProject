<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>

<%
	ClientBean client = (ClientBean) request.getSession().getAttribute("utente");
	if(client == null){
		response.sendRedirect("login");	
		return;
	}

	ArrayList<OrderBean> orders = (ArrayList<OrderBean>) request.getAttribute("ordini");
		if(orders == null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/clientorders");
			dispatcher.forward(request, response);
			return;
		}

		String dateError = (String)request.getAttribute("dateError");
		String clientError = (String)request.getAttribute("clientError");
		%>    

		<!DOCTYPE html>
		<html lang="en">

		<head>
			

			<link rel="stylesheet" type="text/css" href="./styles/tableStyle.css">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<meta charset="UTF-8">
			<meta content="width=device-width, initial-scale=1" name="viewport" />
			<title>Orders</title>
			<style>
			
			input[type="checkbox"]{
				accent-color: #9590a8;
			}
			
			.searchbar input[type="text"]{
            border-radius: 10px;
            padding: 2px;
            width: 30%;
            height: auto;
            border-top: solid;
        	border-bottom: solid;

        	}
			
			#adminForm{
			 color: #18020C;
			}
			
			
        @media screen and (max-width: 700px){

            img{

                width:70px;
                height:70px;

            }

            table, th, td{
                border: none;
                font-size: 8px;
                padding:1%;

            }


            table th:first-child{
                border-radius:10px 0 0 10px;
            }

            table th:last-child{
                border-radius:0 10px 10px 0;
            }


            button {
			  padding: 0 3px;
			  padding-bottom: 5px;
			  margin: 0 5px;
			  border: 2px solid #4C8577;
			  border-radius: 20px;
			  background-color: #fff;
			  cursor: pointer;
			  text-align: center;
			  letter-spacing: 1px;
			  width: 25px;
              height: 15px;
              font-size: 10px;
			}

			button:hover {
			  color: white;
			  background-color: #4c8577;
			}

			button:active {
			  transform: scale(0.9);
			}

			#adminForm {
				font-size: 10px;
			}

			input[type="text"] {
				font-size: 10px;	
				width: 50px;
				height: 10px;
			}

			input[type="date"] {
				font-size: 10px;	
				width: 50px;
				height: 10px;
			}


			input[type="submit"] {
                background-color: #18020C;
                color: #fff;
                border: none;
                padding: 0;
                margin-top: 2px;
                cursor: pointer;
                border-radius: 20px;
                font-size:5px;
                width: 20px;
                height: 15px;
            }

            input[type="submit"]:hover {
                background-color: #84A8A1;
                color: #fff;
                border: none;
                padding: none;
                margin-top: 2px;
                cursor: pointer;
                font-size:5px;
                
	
            }
            
			 #reset:hover {
				background-color: #84A8A1;
				color: #fff;
				border: none;
				padding: 2%;
				margin-top: 2px;
				cursor: pointer;
				font-size:5px;
				transform: scale(0.6);
			}
            
			#reset {
				background-color: #18020C;
				color: #fff;
				border: none;
				padding: 5px;
				margin-top: 2px;
				cursor: pointer;
				border-radius: 20px;
				font-size:5px;
				width: 20px;
				height: 15px;
			}
			
			@media screen and (max-width: 450px){
				
					input[type="submit"]:hover{
					background-color: #84A8A1;
					color: #fff;
					border: none;
					padding: 2%;
					margin-top: 2px;
					cursor: pointer;
					font-size:5px;
					text-align: center;
					width: 15px;
					height: 10px;
				}
				
			
        }
			</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

		</head>

		<body>
			<div class="header" >
        		<%@include file="/WEB-INF/header.jsp" %></div>

			<%	if(!client.getEmail().equals("WorkInProgress@gmail.com"))  { %>
				<!-- ------------------------------------------------------ -->
				<h1> Ordini di ${utente.username}</h1>
				<table>
					<tr>
						<th>  Data ordine  </th>
						<th>  Prezzo totale  </th>
						<th>  Dettagli  </th>

					</tr>

					<%

					for(OrderBean order: orders){
						%>
						<tr>
							<td><%=order.getData() %></td>
							<td><%=order.getPrezzo_totale() %></td>

<td><button onclick="redirectToServlet(this)" class="clientbutton" value="<%=order.getId()%>"><i class="fa fa-eye" aria-hidden="true"></i></button></td>

						</tr>
						<%
					}	
					%>
				</table>

				<% }else{ %>

					<!--	---------------------------------------------------------------- -->
					<form action="admin" method="get">
						<input type="hidden" name="action" value="ordersNoFilter">
						<h1> Ordini di Work in Progress </h1>
					</form>
					
					<form id="adminForm" action="admin?action=orders" method="post">
						
						<% if (clientError != null){%>
							<span class="errorNoTranslate"><%=clientError%></span>
							<%}%>
							
						<label for= "cliente"> Inserisci cliente </label>
						<div class="searchbar">
						<input name="cliente" type = "text"  placeholder = "user" autocomplete="off">
						</div>
						<label for= "Order By Client"> Ordina per cliente </label>
						<input name="Order By Client" type="checkbox"  value="true">
						<br>
						

							<label for= "data_da"> Inserisci prima data </label>
							<input name = "data_da" type = "date" placeholder = "yyyy/mm/dd" >
							<label for= "data_a"> Inserisci seconda data  </label>
							<input name = "data_a" type = "date" placeholder = "yyyy/mm/dd" >
							<label for= "Order By Date"> Ordina per data </label>
							<input name="Order By Date" type="checkbox"  value="true"> 
							<br>

							<% if (dateError != null){%>
								<span class="errorNoTranslate"><%=dateError%></span>
								<%}%>

								<input type="submit" value="Order">
								<a href="admin?action=ordersNoFilter" id="reset">Reset</a>

							</form>


							<table>

								<tr>
									<th> Data ordine </th>
									<th> Prezzo totale </th>
									<th> Cliente </th>
									<th> Dettagli </th>


								</tr>


								<%

								for(OrderBean order: orders){
									%>
									<tr>
										<td><%=order.getData() %></td>
										<td><%=order.getPrezzo_totale() %></td>
										<td><%=order.getClient().getUsername() %></td>

<td><button onclick="redirectToServlet2(this)" class="adminbutton" value="<%=order.getId()%>"><i class="fa fa-eye" aria-hidden="true"></i></button></td>

									</tr>
									<%
								}	
								%>
							</table>

							<% } %>


							<br>


							<%@include file="footer.jsp" %>

							<script>

							function redirectToServlet(buttonElement) {
							    var id = $(buttonElement).val();
							    window.location.href = "orderdetails?ordine=" + id;
							}

							function redirectToServlet2(buttonElement) {
							    var id = $(buttonElement).val();
							    window.location.href = "orderdetails?ordine=" + id;
							}

							</script>

						</body>
						</html>