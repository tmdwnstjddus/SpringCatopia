<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>




<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>CatWebSite | MemberTypeSet</title>

    <!-- Favicon  -->
    <link rel="icon" href="/catopia/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/catopia/resources/css/core-style.css">
    <link rel="stylesheet" href="/catopia/resources/style.css">
	
</head>

<body>
    
    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="/catopia/home"><img src="/resources/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

		<!--header start  -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<!--header end  -->
       

        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
		
		<div id="pageContainer">


		
		<h3 style="text-align:center;padding-top:5%">Member detail</h3>
		<br />
		
		
		
		<div class="container" style="padding-top:50;text-align:center">
		<form id="membertypeset-form" action="membertypeset" method="post">
		<table class="table table-hover">
			<tr style="height: 50px">
				<th style="width:;text-align: center">ID</th>
				<td>${ member.memberId }
					<input type="hidden" name="memberId" value="${ member.memberId }" style="width:280px" />
				</td>
			</tr>
			<tr style="height: 50px">
				<th style="width:;text-align: center">Name</th>
				<td>${ member.name }</td>
			</tr>
			<tr style="height: 50px">
				<th style="width:;text-align: center">Gender</th>
				<td>${ member.gender }</td>
			</tr>
			<tr style="height: 50px">
				<th style="width:;text-align: center">Email</th>
				<td>${ member.email }</td>
			</tr>
			<tr style="height: 50px">
				<th style="width:;text-align: center">Phone</th>
				<td>${ member.phone }</td>
			</tr>
			<tr style="height: 50px">
				<th style="width:;text-align: center">UserType</th>
				<td>
					<input type="radio" name="userType" value="user" checked="checked" >사용자
                	<input type="radio" name="userType" value="admin" >관리자
				</td>
			</tr>
			
		</table>
		</form>
		<br></br>
		<div style="padding-top: 10px; text-align: center">		
		 <input type="submit" id="btnmembertypeset" value="등록" class="btn btn-outline-secondary" >
		 <input type="button" id="btnmemberview" value="취소" class="btn btn-outline-secondary">				 				 
		</div>
		
	</div>
	</div>
	</div>		
	</div>		
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

   

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="/catopia/home"><img src="/catopia/resources/img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> & Re-distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-8">
                    <div class="single_widget_area">
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <nav class="navbar navbar-expand-lg justify-content-end">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                <div class="collapse navbar-collapse" id="footerNavContent">
                                    <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="/catopia/home">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/catopia/upload/shop">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/catopia/upload/productdetail">Product</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/catopia/upload/cart">Cart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/catopia/upload/checkout">Checkout</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="<c:url value="/resources/js/jquery/jquery-2.2.4.min.js" />"></script>
    <!-- Popper js -->
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
    <!-- Bootstrap js -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <!-- Plugins js -->
    <script src="<c:url value="/resources/js/plugins.js" />"></script>
    <!-- Active js -->
    <script src="<c:url value="/resources/js/active.js" />"></script>
	<script type="text/javascript">	        	
   	$(function(){
   		$('#btnmemberview').on('click', function(event){
   			location.href="/catopia/member/memberview?memberId=${member.memberId }"; 
   			
   		});
   		
   		$('#btnmembertypeset').on('click', function(event){
   			$('#membertypeset-form').submit();
   			
   		});
   	});
	</script>
	
</body>

</html>