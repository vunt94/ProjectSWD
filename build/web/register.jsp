<%-- 
    Document   : register
    Created on : Mar 21, 2021, 5:23:52 PM
    Author     : HuyenPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-form-title" style="background-image: url(images/slider2.jpg);">
                        <span class="login100-form-title-1">
                            Register
                        </span>
                    </div>

                    <form class="login100-form validate-form" action="register" method="POST">
                        <c:choose>
                            <c:when test="${flag != null}">
                                <div class="alert alert-danger" role="alert" style="background-color: #f8d7da">
                                    <p> ${flag}</p>
                                </div>
                            </c:when>
                        </c:choose>

                        <div class="wrap-input100 validate-input m-b-18" >
                            <span class="label-input100">Phone number</span>
                            <input class="input100" type="text" name="phone" placeholder="Enter phone number">
                            <span class="focus-input100"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-26">
                            <span class="label-input100">Username</span>
                            <input class="input100" type="text" name="username" placeholder="Enter username">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-18" >
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="pass" placeholder="Enter password">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="flex-sb-m w-full p-b-30">
                            <div>

                            </div>

                            <div>
                                <a href="login" class="txt1">
                                    You have an account?
                                </a>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Sign up
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html> 