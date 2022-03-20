<%-- 
    Document   : manageer
    Created on : Mar 24, 2021, 2:06:38 PM
    Author     : HuyenPT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- CSS only -->
         <script>
             
            function handleProduct (modalId) {
                    document.getElementById("book-modal").style.display = "none";
                    document.getElementById("clothes-modal").style.display = "none";
                    document.getElementById("laptop-modal").style.display = "none";
                    document.getElementById("phone-modal").style.display = "none";
                    document.getElementById(modalId).style.display = null;
            }
           
        </script>
        <!-- JavaScript Bundle with Popper -->

        <style>
            img{
                width: 120px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <c:if test="${message != null}">
            <div class="alert alert-success" role="alert" style="text-align: center;margin-right:30%;margin-left: 30%">
                ${message}
            </div>  
        </c:if>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b><a class="manager" href="manager">Manage Product</a></b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="#deleteProductModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                            <a href="managerAccount"><button type="button" class="btn btn-primary">Manage Account</button></a>
                            <a href="logout"><button type="button" class="btn btn-primary">Logout</button></a>
                        </div>
                    </div>
                </div>
                <c:choose>

                    <c:when test="${list == null}">
                        <h3 style="color: black">Oops! Your store is empty!</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="o">
                                    <tr>
                                        <td>${o.pid}</td>
                                        <td>${o.name}</td>
                                        <td>
                                            <img src="images/${o.image}">
                                        </td>
                                        <td>${o.price}</td>
                                        <td>${o.quantity}</td>
                                        <td>
                                            <a href="update?pid=${o.pid}&pageIndex=${pageIndex}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="delete?pid=${o.pid}&pageIndex=${pageIndex}" data-id="${o.pid}" class="delete" data-toggle="modal" onclick="javascript:return confirm('Are you sure to delete this product?');">
                                                <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!--pagging-->
                        <div class="clearfix">
                            <div class="hint-text">Showing <b>${pageSize}</b> out of <b>${totalPorduct}</b> entries</div>
                            <ul class="pagination">

                                <c:forEach begin="1" end="${totalPage}" var="i">
                                    <c:choose>
                                        <c:when test="${pageIndex == i}">
                                            <li class="page-item active">
                                                <a class="page-link">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a href="manager?pageIndex=${i}" class="page-link">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Add new product HTML -->
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog" >
                <div class="modal-content" style="width: 500px;">
                    <form action="add" method="POST" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <!--                            <h4 class="modal-title">Add Product</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                            <div class="btn-group"  role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" id="btnbook" name="btnradio" autocomplete="off" checked>
                                <label class="btn btn-outline-primary"  onclick="handleProduct('book-modal')" for="btnbook">Book</label>

                                <input type="radio" class="btn-check" id="btnphone" name="btnradio"  autocomplete="off">
                                <label class="btn btn-outline-primary"  onclick="handleProduct('phone-modal')" for="btnphone">Phone</label>

                                <input type="radio" class="btn-check" id="btnlaptop" name="btnradio"  autocomplete="off">
                                <label class="btn btn-outline-primary" onclick="handleProduct('laptop-modal')" for="btnlaptop">Laptop</label>

                                <input type="radio" class="btn-check" id="btnclothes" name="btnradio"  autocomplete="off">
                                <label class="btn btn-outline-primary"  onclick="handleProduct('clothes-modal')" for="btnclothes">Clothes</label>
                            </div>

                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">                                
                                <input type="hidden" class="form-control" id="categorySelected" name="cat" value="1" >  
                            </div> 
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" id ="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" 
                                       class="form-control" enctype="multipart/form-data" name="image" placeholder="Enter photo" required>
                                <!--                                <input name="image" type="text" class="form-control" required>-->
                            </div>
                            <div id="book-modal">
                                <div class="form-group">
                                    <label>Author</label>
                                    <input name="author" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Publisher</label>
                                    <input name="publisher" type="text" class="form-control" required>
                                </div>
                            </div>
                            <div id="clothes-modal">
                                <div class="form-group">
                                    <label>Brand</label>                                  
                                    <input name="brand" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Size</label>
                                    <br/>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">S</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">M</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">L</label>
                                    </div>
                                </div>
                            </div>
                            <div id="laptop-modal">
                                <div class="form-group">
                                    <label>Brand</label>
                                    
                                    <input name="brand" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>RAM</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">8GB</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">16GB</label>
                                    </div>                                   
                                </div>
                            </div>
                            <div id="phone-modal">
                                <div class="form-group">
                                    <label>Brand</label>
                                    <br/>
                                    <input name="brand" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>RAM</label>
                                    <br/>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">64GB</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">128GB</label>
                                    </div>    
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">256GB</label>
                                    </div> 
                                </div>
                                <div class="form-group">
                                    <label>Color</label>
                                    <br/>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">Black</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">Red</label>
                                    </div>    
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">Gold</label>
                                    </div> 
                                </div>
                            </div>
                        </div>                      
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--end-->

        <!-- Delete product HTML -->
        <div id="deleteProductModal" class="modal fade"  >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delete?deleteAll=1" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure to delete all products?</p>
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
        <!--end-->

        <script>
            document.getElementById('category').addEventListener('change', function () {
                console.log('You selected: ', this.value);
                document.getElementById("categorySelected").value = this.value;
            });

        </script>
        <script>
            document.getElementById("book-modal").style.display = null;
            document.getElementById("clothes-modal").style.display = "none";
            document.getElementById("laptop-modal").style.display = "none";
            document.getElementById("phone-modal").style.display = "none";
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>        
        <!--        <script src="js/manager.js" type="text/javascript"></script>-->
    </body>
</html>
