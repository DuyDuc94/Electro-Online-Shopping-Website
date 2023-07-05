<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import = "java.util.*" %>
<%@page import = "model.*" %>
<%@page import = "dal.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Your Wishlist</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 1200px;
                margin: 0px auto;
            }

            .wishlist-title {
                font-size: 40px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .product-card {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 20px;
                padding: 15px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            }

            .product-card {
                width: auto;
                height: auto;
                margin-right: 20px;
                object-fit: contain;
            }

            .product-image img{
                width: 150px;
                height: 150px;
            }

            .product-card .product-info {
                flex-grow: 0.6;
            }

            .product-card .product-info .product-name {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .product-name{
                font-size: 25px;

            }
            .product-card .product-info .product-price {
                color: #888;
                margin-bottom: 10px;
                font-size: 20px;
            }


            .product-card .view-to-cart {
                text-align: right;
            }

            .view-product-button {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 200px;
                padding: 10px;
                background-color: #337ab7;
                color: #fff;
                font-weight: bold;
                text-align: center;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .view-product-button:hover {
                background-color: #23527c;
            }
            
            .remove-product-button {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 200px;
                padding: 10px;
                margin-top: 10px;
                background-color: #d9534f;
                color: #fff;
                font-weight: bold;
                text-align: center;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .remove-product-button:hover {
                background-color: #c9302c;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet"/>
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="templates/css/bootstrap.min.css" />
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="templates/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="templates/css/slick-theme.css" />
        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="templates/css/nouislider.min.css" />
        <!-- Font Awesome Kit v5 -->
        <script src="https://kit.fontawesome.com/db3e6c46fb.js" crossorigin="anonymous"></script>
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="templates/css/style.css" />
    </head>
    <body>
        <%@include file="templates/header.jsp" %>
        <%@include file="templates/navigation.jsp" %>

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Wishlist</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="homepage.jsp">Home</a></li>
                            <li class="active">Your Wishlist</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <div class="container">
                <c:if test="${user==null}">
                    <div class="text-center">
                        <p><a href="login.jsp">Login</a> to see your wishlist</p>
                    </div>
                </c:if>
                <c:if test="${user!=null}">
                    <c:if test="${wishlist!=null}">
                        <c:forEach var="product" items="${wishlist}">
                            <div class="row">
                                <div class="product-card">
                                    <div class="product-image">
                                        <img src="templates/img${product.getImage()}" alt="${product.getName()}">
                                    </div>
                                    <div class="product-info">
                                        <div class="product-name">${product.getName()}</div>
                                        <div class="product-price">$${product.getPrice()}</div>
                                    </div>
                                    <div class="view-to-cart">
                                        <button onclick="window.location.href = 'homepage.jsp'" class="view-product-button">View Product</button>  
                                        <button onclick="#" class="remove-product-button">Remove Product</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${wishlist==null}">
                        <p class="text-center">You haven't add wishlist produt</p>
                    </c:if>
                </c:if>
            </div>
        </div>
        <!-- /SECTION -->

        <%@include file="templates/footer.jsp" %>

        <!-- jQuery Plugins -->
        <script src="templates/js/jquery.min.js"></script>
        <script src="templates/js/bootstrap.min.js"></script>
        <script src="templates/js/slick.min.js"></script>
        <script src="templates/js/nouislider.min.js"></script>
        <script src="templates/js/jquery.zoom.min.js"></script>
        <script src="templates/js/main.js"></script>
        <!-- /jQuery Plugins -->

    </body>
</html>