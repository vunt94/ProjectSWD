<%-- 
    Document   : detail
    Created on : Mar 20, 2021, 10:06:25 PM
    Author     : HuyenPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${p.name}</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
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
                                <li class="breadcrumb-item"><a>Detail</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!--category menu-->
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase">
                                <i class="fa fa-list"></i>
                                Categories
                            </div>
                            <ul class="list-group category_block">
                            <c:forEach items="${listC}" var="c">
                                <li class="list-group-item text-white ${cid == c.id ? "active" : ""}"><a href="category?cid=${c.id}">${c.name}</a></li>
                                </c:forEach>
                        </ul>
                        <ul id="accordion" class="accordion">
                            <li>
                                <div class="link"></i>Mobile<i class="fa fa-chevron-down"></i></div>
                                <ul class="submenu">
                                    <li><a href="#">Iphone</a></li>
                                    <li><a href="#">Samsung</a></li>
                                    <li><a href="#">Google</a></li>
                                    <li><a href="#">Sony</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--end of category menu-->

                <!--product's information-->
                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a><img src="images/${p.image}"></a></div>
                                        </div> 
                                    </article> 
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="productName">${p.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">${p.price} $</span>
                                            </span> 
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${p.description} </p></dd>
                                        </dl>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <dt>Quantity: ${p.quantity}</dt>
                                                </dl>  
                                            </div> 

                                        </div> 
                                        <hr>
                                        <!--<a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>-->
                                        <!--cause detail page has not pageIndex 
                                        >> set pageIndex = 1 to avoid exception when (addToCart) parse pageIndex
                                        >> automatically go to first page in home
                                        -->
                                        <a href="addToCart?pid=${p.pid}&pageIndex=1" class="btn btn-lg btn-outline-primary text-uppercase"> Add to cart </a>
                                    </article> 
                                </aside> 
                            </div> 
                        </div> 
                    </div>
                </div>
                <!--end of product's information-->
            </div>
        </div>
        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script>
        $(function () {
            var Accordion = function (el, multiple) {
                this.el = el || {};
                this.multiple = multiple || false;

                // Variables privadas
                var links = this.el.find('.link');
                // Evento
                links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
            }

            Accordion.prototype.dropdown = function (e) {
                var $el = e.data.el;
                $this = $(this),
                        $next = $this.next();

                $next.slideToggle();
                $this.parent().toggleClass('open');

                if (!e.data.multiple) {
                    $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
                }
                ;
            }

            var accordion = new Accordion($('#accordion'), false);
        });
    </script>
</html>

