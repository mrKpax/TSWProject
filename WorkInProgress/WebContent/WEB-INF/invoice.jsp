<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.unisa.model.*" pageEncoding="UTF-8"%>
<%
ArrayList<OrderProductBean> products = (ArrayList<OrderProductBean>)request.getAttribute("orderProducts");
ArrayList<ProductBean> Products = (ArrayList<ProductBean>)request.getAttribute("Products");
InvoiceBean invoice = (InvoiceBean) request.getAttribute("invoice");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Invoice</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      text-align: center; 
    }
    h1 {
      margin-bottom: 20px; 
    }
    .table-container {
      margin: 0 auto; 
      width: 80%; 
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      border-top: 3px solid #000;
      margin: 0 auto; 
    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    .item-name {
      width: 60%;
    }
    
    .item-price, .item-quantity, .item-total {
      text-align: right;
    }
    
    .total-row {
      font-weight: bold;
    }
    .invoice-total {
      font-size: 1.2em;
      text-align: right;
    }
    .invoice-details {
      text-align: right;
    }
    .divider {
      width: 100%;
      border-top: 1px solid #ddd;
      margin: 20px 0;
    }
    #stampButton {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px 20px;
    }
    #stampButton:hover {
      background-color: #4C8577;
      border-radius: 14px;
    }
  </style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.3/jspdf.umd.min.js"></script>
</head>
<body>
  <h1>Invoice</h1>
  
  <button id="stampButton" onclick="eseguiComandoRapido()">Download</button><br>
  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th class="item-name">Item</th>
          <th class="item-price">Price</th>
          <th class="item-quantity">Quantity</th>
          <th class="item-total">Total</th>
        </tr>
      </thead>
      <tbody>
      <% float iva_totale=0;
      	for(int i=0 ;i< products.size();i++){
      		iva_totale=iva_totale+products.get(i).getPrezzo() * products.get(i).getIVA()/100*products.get(i).getQuantita();
      %>
        <tr>
          <td class="item-name"><%=Products.get(i).getNome()%></td>
          <td class="item-price"><%=products.get(i).getPrezzo()%></td>
          <td class="item-quantity"><%=products.get(i).getQuantita()%></td>
          <td class="item-total"><%=products.get(i).getPrezzo() * products.get(i).getQuantita()%></td>
        </tr>
        
        <% } 
       iva_totale=(float) (Math.round(iva_totale * 100.0) / 100.0);
        %>
       
      </tbody>
      <tfoot>
        <tr class="total-row">
          <td colspan="3">IVA</td>
          <td class="invoice-total">€<%= iva_totale %></td>
        </tr>
        <tr class="total-row">
          <td colspan="3">Total</td>
          <td class="invoice-total">€<%= invoice.getImporto() + iva_totale%></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <div class="table-container">
    <table>
      <tbody>
        <tr>
          <td><strong>Invoice Details</strong></td>
        </tr>
        <tr>
          <td>SDI (Supplier Delivery Information)</td>
          <td class="invoice-details"><%= invoice.getSdi() %></td>
        </tr>
        <tr>
          <td>Emission Date</td>
          <td class="invoice-details"><%= invoice.getData_emissione() %></td>
        </tr>
        <tr>
          <td>Expiration Date</td>
          <td class="invoice-details"><%= invoice.getData_scadenza() %></td>
        </tr>
        <tr>
          <td>Payment State</td>
          <td class="invoice-details"><%= invoice.getStato_pagamento() %></td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="divider"></div>
  
  <script>
    function handleKeyDown(event) {
      if (event.ctrlKey && event.key === 'p') {
        eseguiComandoRapido();
      }
    }
    function eseguiComandoRapido() {
      let stampButton = document.getElementById('stampButton');
      stampButton.classList.add('hidden');
      document.getElementById("stampButton").style.visibility = "hidden";
      window.print();
      document.getElementById("stampButton").style.visibility = "initial";
    }
  </script>

</body>
</html>
