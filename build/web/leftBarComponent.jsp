<%-- 
    Document   : leftBarComponent
    Created on : Mar 28, 2021, 9:15:43 AM
    Author     : HuyenPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--category-->
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listC}" var="o">
                <li class="list-group-item text-white ${cid == o.id ? "active":""}"><a href="category?cid=${o.id}">${o.name}</a></li>
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
    <!--end category-->
    <!--new product-->
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">New product</div>
        <div class="card-body">
            <img class="img-fluid" src="images/${last.image}" />
            <h5 class="card-title"><a href="detail?pid=${last.pid}">${last.name}</a></h5>
            <p class="bloc_left_price">${last.price} $</p>
        </div>
    </div>
    <!--end new product-->
</div>
