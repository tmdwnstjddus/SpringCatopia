<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>CatWebSite | Product</title>

    <!-- Favicon  -->
    <link rel="icon" href="/catopia/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/catopia/resources/css/core-style.css">
    <link rel="stylesheet" href="/catopia/resources/style.css">

</head>

<body>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="search?col=all&word=" method="get">
                            <input type="search" name="search" id="search" placeholder="검색어를 입력해주세요.">
                            <button type="submit"><img src="/catopia/resources/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="/catopia/resources/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!--header start  -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<!--header end  -->
		
		<div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="/catopia/home">홈</a></li>
                                <li class="breadcrumb-item"><a href="/catopia/pr-upload/pr-list?col=all&word=">용품</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${ product.name }</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                
               <c:forEach var="file" items="${ product.imgs }">
                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
<%--                                 <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(/catopia/resources/upload-files/${ file.savedFileName });">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(/catopia/resources/img/product-img/product1.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(/catopia/resources/img/product-img/product2.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(/catopia/resources/img/product-img/product2.jpg);">
                                    </li>
                                </ol> --%>
                                
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="/catopia/resources/upload-files/${ file.savedFileName }">
                                            <img class="d-block w-100" src="/catopia/resources/upload-files/${ file.savedFileName }" alt="First slide" style="height:700;width:750">
                                        </a>
                                    </div>
                                 <!--    <div class="carousel-item">
                                        <a class="gallery_img" href="/catopia/resources/img/product-img/product2.jpg">
                                            <img class="d-block w-100" src="/catopia/resources/img/product-img/product2.jpg" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="/catopia/resources/img/product-img/product1.jpg">
                                            <img class="d-block w-100" src="/catopia/resources/img/product-img/product1.jpg" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="/catopia/resources/img/product-img/product1.jpg">
                                            <img class="d-block w-100" src="/catopia/resources/img/product-img/product1.jpg" alt="Fourth slide">
                                        </a>
                                    </div> -->
                                </div>                            
                            </div>
                        </div>
                  </div>
                 </c:forEach>
                       
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">${ product.name }</p>
                                <a href="product-details.html">
                                    <h6>₩${ product.price }</h6>
                                </a>
                                 <h3>${ product.kind }</h3>
                                   <div class="review">
                                        <a href="/catopia/re-upload/re-list">Write A Review</a>
                                  </div>
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <!---------------------------------------------------------------------------- -->
                           			<div class="buttons">
									<c:if test="${ loginuser.memberId eq product.uploader }">
										<input type="button" id="update_button"
											class="btn btn-outline-secondary" value="편집" />
										<input type="button" id="delete_button"
											class="btn btn-outline-secondary" value="삭제" />
									</c:if>				
									<input type="button" id="cancel_button"
										class="btn btn-outline-secondary" value="목록보기" /><br>						
									<script type="text/javascript">																									
		        		window.addEventListener('load',function(event){
						var btnCancel =document.querySelector('#cancel_button');
		        		btnCancel.addEventListener('click', function(event) {
		        			location.href="/catopia/pr-upload/pr-list";
		        		});
		        		
		        		var btnDelete = document.querySelector('#delete_button');
		        		btnDelete.addEventListener('click', function(event){
		        			var ok = confirm("${product.productNo}번 자료를 삭제할까요?");
		        			if(ok){
		        			location.href="/catopia/pr-upload/delete/${ product.productNo }";
		        			}
		        		});
		        		
		        		var btnUpdate = document.querySelector('#update_button');
		        		btnUpdate.addEventListener('click', function(event){
		        			location.href="/catopia/pr-upload/pr-update/${ product.productNo }";
		        		});
		        		
		        	});
		        	</script>
		        	<form name="form1" method="post" action="/catopia/cart-upload/insertcart">
		        	<input type="hidden" name="memberId" value="${loginuser.memberId }">
					<input type="hidden" name="productNo" value="${product.productNo }">
		        	<select name="amount">
		        	<c:forEach begin="1" end="10" var="i">
		        	<option value="${i}">${i}</option>
		        	</c:forEach>
		        	<br>
		        	</select>&nbsp;개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	<input type="submit" class="btn btn-outline-secondary" value="장바구니">    	
		        	</form>
								</div>
                            </div>

                            <div class="short_overview my-5">
                                <p>${ product.content }</p>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>

</html>