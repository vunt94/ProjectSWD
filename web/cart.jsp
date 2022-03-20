<%-- 
    Document   : card
    Created on : Mar 28, 2021, 6:57:47 PM
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
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Shopping Carts</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#deleteProductModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                            <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
                        </div>
                    </div>
                </div>
                <!-- listCart.size() == 0 when user deletes all products/list cart == null when user has not selected any producta-->
                <c:choose>
                    <c:when test="${sessionScope.listCart.size() == 0 || sessionScope.listCart == null}">
                        <form action="home">
                            <h3 style="color: black">Oops! Your shopping cart is empty!</h3>
                            <input style="color: green" type="submit" value="Go to shopping" />
                        </form>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>STT </th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Action</th>
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
                                            <form action="addToCart?button=plus&pid=${c.productID}" method="POST">
                                                <button type="submit" name="button">+</button>
                                            </form>
                                            <span> ${c.quantity} </span>
                                            <form action="addToCart?button=minus&pid=${c.productID}" method="POST">
                                                <button type="submit" name="button">-</button>
                                            </form>
                                        </td>
                                        <td>${c.productPrice} $</td>                                                                  
                                        <td>
                                            <a href="deleteCart?pid=${c.productID}" data-id="${c.productID}" class="delete" data-toggle="modal" onclick="javascript:return confirm('Are you sure to delete this product?');">
                                                <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <h3 style="color: black">Total money: ${totalPrice} $ </h3>    
                        <div class="row">
                            <div class="col-sm-6">
                                <a href="payment?totalPrice=${totalPrice}"><button type="button" class="btn btn-primary" style="background-color: orange; border-color: orange">Payment</button></a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Delete Modal HTML -->
        <div id="deleteProductModal" class="modal fade"  >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deleteCart?deleteAll=1" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure to delete all products in your cart?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
