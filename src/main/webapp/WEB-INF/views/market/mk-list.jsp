<%@ page import="com.catwebsite.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>



<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>CatWebSite | List</title>

    <!-- Favicon  -->
    <link rel="icon" href="/catopia/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    <link rel="stylesheet" href="/catopia/resources/css/core-style.css">
    
	
	

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
       
		
	
        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
            
            
	     <div id="pageContainer">

		
		<h3 style="text-align:center;padding-top:5%">Market</h3>
		<br />
	

		
		<div class="container" style="padding-top:50;text-align:center">
			<table class="table table-hover" >
				<tr style="background-color:;height: 50px";>
					<th style="width:50px;text-align: center">NO</th>
					<th style="width: 100px;text-align: center">
					  <form id="selectform" action="marketcategory" method="POST">
                         <select name="category" id="marketselectcategory">
                             <option value="all">CATEGORY</option>
                             <option value="고양이거래" <c:if test="${param.category eq '고양이거래'}">selected</c:if>>고양이거래</option>
                             <option value="용품거래" <c:if test="${param.category eq '용품거래'}">selected</c:if>>용품거래</option>
                             <option value="기타거래" <c:if test="${param.category eq '기타거래'}">selected</c:if>>기타거래</option>
                         </select>
                	  </form>
				    </th>
					<th style="width:300px">CONTENTS</th>
					<th style="width:125px">NAME</th>
					<th style="width:125px;text-align:center">DATE</th>
				</tr>
				<c:forEach var="market" items="${ markets }">
				<tr style="height:30px">
					<td>${ market.mkboardNo }</td>
					<td>${ market.category }</td>
					<td style='text-align:left;padding-left:10px'>
						 
						<br>
						<a href="mk-detail/${ market.mkboardNo }" style="text-decoration: none">
							${ market.mkTitle }
						</a>
					</td>
					
					<td>${ market.memberId }</td>
					<td>${ market.regDate }</td>
				</tr>
				</c:forEach>
				
				
			</table>
		 <a href="mk-write"> <input type="button" value="글작성" class="btn btn-outline-secondary"></a>
			<br /><br /><br /><br />
		
		 </div>
	   </div>
	   </div>
     </div>
 <!-- Product Catagories Area End -->
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
                            <a href="/catopia/home"><img src="resources/img/core-img/logo2.png" alt=""></a>
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
    
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
   		   		
   		$('#marketselectcategory').on('change', function(event){
   			
   			
   			this.form.submit();
   			
   		});
   	});
	</script>

</body>

</html>











