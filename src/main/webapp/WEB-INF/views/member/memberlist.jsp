<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>


<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>CatWebSite | MemberList</title>

    <!-- Favicon  -->
    <link rel="icon" href="/catopia/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/catopia/resources/css/core-style.css">
    <link rel="stylesheet" href="/catopia/resources/style.css">
	<!-- <link rel="Stylesheet" href="/catopia/resources/styles/input.css" />	 -->
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


		
		<h3 style="text-align:center;padding-top:5%">MemberList</h3>
		<br />
		
		
		
		<div class="container" style="padding-top:50;text-align:center">
		
		<table class="table table-hover">
			<tr style="background-color:;height: 50px">
				<th style="width: 10%;text-align: center">ID</th>
				<th style="width: 10%;text-align: center">Name</th>
				<th style="width: 10%;text-align: center">Gender</th>
				<th style="width: 20&;text-align: center">Email</th>
				<th style="width: 20%;text-align: center">Phone</th>
				<th style="width: 10%;text-align: center">UserType</th>
				<th style="width: 20%;text-align: center">RegDate</th>
			</tr>
			<c:forEach var="member" items="${members}">
				<tr style="height: 30px">
					<td>
						<a href="memberview?memberId=${member.memberId }">
        					${member.memberId }
        				</a>
       				</td>					
					<td>${ member.name }</td>
					<td>${ member.gender }</td>
					<td>${ member.email }</td>
					<td>${ member.phone }</td>
					<td>${ member.userType }</td>
					<td>${ member.regDate }</td>
					
				</tr>
			</c:forEach>
		</table>
	
		<br></br>
		<div>
		 <input type="button" id="cancel" value="home" class="btn btn-outline-secondary">
		 
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
							<a href="index.html"><img
								src="/catopia/resources/img/core-img/logo2.png" alt=""></a>
						</div>
						<!-- Copywrite Text -->
						<p class="copywrite">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This website is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="http://www.goott.co.kr" target="_blank">GoottAcedemy</a> &
							by<a href="/catopia/home" target="_blank">Catopia</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
				<!-- Single Widget Area -->
				<div class="col-12 col-lg-8">
					<div class="single_widget_area">
						<!-- Footer Menu -->
						<div class="footer_menu">
							<nav class="navbar navbar-expand-lg justify-content-end">
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#footerNavContent"
									aria-controls="footerNavContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<i class="fa fa-bars"></i>
								</button>
								<div class="collapse navbar-collapse" id="footerNavContent">
									<ul class="navbar-nav ml-auto">
										<li class="nav-item active"><a class="nav-link"
											href="/catopia/home">Home</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/cat-upload/cat-list">Cat</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/pr-upload/pr-list?col=all&word=">Product</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/market/mk-list">Market</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/re-upload/re-list">Review</a></li>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/qa-upload/qa-list">Q&A</a></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

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
   		$('#cancel').on('click', function(event){
   			location.href="/catopia/home"; 
   			
   		});
   		  		
   	});
	</script>
</body>

</html>