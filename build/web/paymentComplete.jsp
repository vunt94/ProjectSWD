<%-- 
    Document   : paymentComplete
    Created on : Feb 8, 2022, 1:47:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Payment</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 120px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!--begin cart-->
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>User information and products purchased</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
                        </div>
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>STT </th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCart}" var="c">
                            <tr>
                                <td>${c.productID}</td>
                                <td>${c.productName}</td>
                                <td>
                                    <img src="images/${c.productImage}">
                                </td>
                                <td>
                                    <span> ${c.quantity} </span>
                                </td>
                                <td>${c.productPrice}</td>                                                                  
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="${name}" class="form-control" placeholder="Enter consignee's name..." required>
                </div>
                <div class="form-group">
                    <label>Phone number</label>
                    <input type="text" name="phone" value="${phone}" class="form-control" placeholder="Enter consignee's phone number..." required>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <textarea class="form-control" rows="3" name="address" placeholder="Enter consignee's address..." required>${address}</textarea>
                </div>
                <div>
                    <label>Shipment</label>
                    </br>
                    <label style="margin-left: 20px;" for="fast">Fast Delivery</label>
                    <input id="fast" type="radio" name="shipment" value='1' ${fast}>
                    <label style="margin-left: 20px;" for="standard">Standard Delivery</label>
                    <input id="standard" type="radio" name="shipment" value='0' ${standard}>
                    <label style="margin-left: 20px;" for="price">Price</label>
                    <input id="price" type="text" name="payment" value='${price}' readonly>
                </div>
                <div style="margin-top: 10px;">
                    <label>Payment Method</label>
                    </br>
                    <label style="margin-left: 20px;" for="credit">Credit Card</label>
                    <input id="credit" type="radio" name="payment" value='1' ${credit}>
                    <label style="margin-left: 20px;" for="cod">Ship COD</label>
                    <input id="cod" type="radio" name="payment" value='0' ${cod}>
                </div>

                <div class="form-group">
                    <label>Note</label>
                    <textarea class="form-control" rows="3" name="note" placeholder="Enter note...">${note}</textarea>
                </div>
                <h3 style="color: black">Total money: ${total}$ </h3>     
            </div>
            <!--end cart-->

            <!-- begin payment-->

            <!--end payment-->
        </div>
    </body>
</html>
