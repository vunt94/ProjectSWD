<%-- 
    Document   : home
    Created on : Mar 20, 2021, 12:56:40 PM
    Author     : HuyenPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--begin of menu-->
        <jsp:include page="headerComponent.jsp"></jsp:include>
        <!--end of menu-->
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!--category-->
                <%@include file="leftBarComponent.jsp" %>
                <!--list product-->
                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="images/${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.pid}" title="View Product">${o.name}</a></h4>
                                        <div class="row">
                                            <div class="col">
                                                <p>${o.price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="#" class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!--end list product-->
            </div>
        </div>

        <!--page filter-->
        <nav aria-label="..." class="d-flex justify-content-center">
            <ul class="pagination pagination-lg">
                <c:forEach begin="1" end="${totalPage}" var="i">
                    <!--active page Index which choose-->
                    <c:choose>
                        <c:when test="${pageIndex == i}">
                            <li class="page-item active">
                                <span class="page-link">
                                    ${i}
                                    <span class="sr-only">(current)</span>
                                </span>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <!--each time needs send 'keyword' to servlet 'search' to get new list of products-->
                            <li class="page-item"><a class="page-link" href="search?pageIndex=${i}&keyword=${keyword}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
            </ul>
        </nav>     
        <!--end page filter-->
        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>


