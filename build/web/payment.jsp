<%-- 
    Document   : payment
    Created on : Mar 30, 2021, 8:56:02 PM
    Author     : HuyenPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
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
                            <h2><b>List Of Products</b></h2>
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
                <h3 style="color: black">Total money: ${totalPrice} $ </h3>     
            </div>
            <!--end cart-->

            <!-- begin payment-->
            <div class="table-wrapper">
                <div class="table-title" style="background-color: orange">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Information of Customer</b></h2>
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <form action="/" id='inforCheckout'>
                           
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter consignee's name..." required>
                            </div>
                            <div class="form-group">
                                <label>Phone number</label>
                                <input type="text" name="phone" class="form-control" placeholder="Enter consignee's phone number..." required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" rows="3" name="address" placeholder="Enter consignee's address..." required></textarea>
                            </div>
<!--                            <div>
                                <label>Shipment</label>
                                </br>
                                <label style="margin-left: 20px;" for="fast">Fast Delivery</label>
                                <input id="fast" type="radio" name="shipment" value='0' checked>
                                <label style="margin-left: 20px;" for="standard">Standard Delivery</label>
                                <input id="standard" type="radio" name="shipment" >
                                <label style="margin-left: 20px;" for="price">Price</label>
                                <input id="price" type="text" name="payment" value='50$' readonly>
                            </div>
                            <div style="margin-top: 10px;">
                                <label>Payment Method</label>
                                </br>
                                <label style="margin-left: 20px;" for="credit">Credit Card</label>
                                <input id="credit" type="radio" name="type" value='0' checked>
                                <label style="margin-left: 20px;" for="cod">Ship COD</label>
                                <input id="cod" type="radio" name="type">
                            </div>-->
                            
                            <div class="form-group">
                                <label>Note</label>
                                <textarea class="form-control" rows="3" name="note" placeholder="Enter note..."></textarea>
                            </div>

                            <button id="checkout" type="submit" class="btn btn-success w-100" style="background-color: orange; border: orange; margin-bottom: 50px;">Checkout</button>
                        </form>
                    </div>
                </div>
                <div class='card mt-3'>
                    <div id="paymentmethod">
                        <div id='row'>

                        </div>
                        <div id='title'>

                        </div>
                    </div>  
<!--                <div class="row">
                    <div class="col-sm-6">
                        <h2><b>Payment Method</b></h2>
                    </div>
                </div>
                <br>
    -->             <div id="paypal-button-container">

                    </div>
            
                </div>   
                
            </div>
            
            <!--end payment-->
        </div>
<!--    <script>
        const price = document.getElementById('price');
        const fast = document.getElementById('fast');
        const credit = document.getElementById('credit');
        const standard = document.getElementById('standard');  
        if (credit.checked) {
            credit.value = '1';
        }
        else {
            credit.value = '0';
        }
        if (fast.checked) {
            fast.value = '1';
        }
        else {
            fast.value = '0';
        }
        fast.addEventListener('click', check);
        standard.addEventListener('click', check);
        function check() {
            
            if (fast.checked) {
                price.value = '50$';
            }
            else{
                price.value = '20$';
            }
        }      
    </script>  -->
    <script type="text/javascript" src="https://www.paypal.com/sdk/js?client-id=ASSmKoAHfKajUa9hle72zBqkjZFz_CnKBRF97VX71-81YGuB0LmKBf1u4YVbz4ISNJ4MTUHOG3qoS3Wm"></script>
    <script>
        document.getElementById('checkout').addEventListener('click', function() {
        console.log("done");
        document.getElementById('paymentmethod').classList.add("table-title");
        document.getElementById('paymentmethod').style.backgroundColor = "orange";
        document.getElementById('paymentmethod').style.height = '70px';
        document.getElementById('row').className = 'row';
        document.getElementById('title').className = 'col-sm-6';
        var text = document.createElement('h2');
        text.innerHTML = "<b>Payment Method</b>";
        document.getElementById('title').appendChild(text);
            paypal.Buttons({
                createOrder: function(data, actions) {
                    return actions.order.create({
                       intent: 'CAPTURE',
                       payer: {
                           fullname: $('.name').val()
                          
                       }
                    });
                }
            }).render("#paypal-button-container");
                
        }); 
    </script>
    </body>
</html>
