<%@ page import="com.catwebsite.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <form action="pr-list?col=all&word=" method="get">
                            <input type="text" name="word" id="search" placeholder="검색어를 입력해주세요.">
                            <button type="submit"><img src="/catopia/resources/img/core-img/search.png" alt=""></button>
                            <select name="col">
							<option value="all">---선택---</option>
							<option value="name">용품이름</option>
							<option value="kind">용품종류</option>
							<option value="content">용품내용</option>
							</select>
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
<%-- 		<c:forEach var="product" items="${ product }"> --%>
        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h4 style="color:#fbb710; font-family: 바탕; font-weight: bold">Catagory</h4><br>

                <!--  카테고리  -->
                <div class="catagories-menu">
                      <form id="selectform" action="pr-kind" method="POST">
						<input type="radio" name="kind" value="all" id="kindCategory" <c:if test="${param.kind eq 'all'}"></c:if>/><label for="kindCategory">ALL</label> <br><br>                 
						<input type="radio" name="kind" value="사료" id="kindCategory2" <c:if test="${param.kind eq '사료'}"></c:if>/><label for="kindCategory2">Food</label><br><br>
						<input type="radio" name="kind" value="하우스" id="kindCategory3" <c:if test="${param.kind eq '하우스'}"></c:if>/><label for="kindCategory3">House</label><br><br>						
						<input type="radio" name="kind" value="미용" id="kindCategory4" <c:if test="${param.kind eq '미용'}"></c:if>/><label for="kindCategory4">Beauty</label><br><br>  						
						<input type="radio" name="kind" value="목욕" id="kindCategory5" <c:if test="${param.kind eq '목욕'}"></c:if>/><label for="kindCategory5">Bath</label><br><br>     
						<input type="radio" name="kind" value="장난감" id="kindCategory6" <c:if test="${param.kind eq '장난감'}"></c:if>/><label for="kindCategory6">Toy</label><br><br>
						<input type="radio" name="kind" value="모래" id="kindCategory7" <c:if test="${param.kind eq '모래'}"></c:if>/><label for="kindCategory7">Sand</label><br><br>  	
						<input type="radio" name="kind" value="캣타워" id="kindCategory8" <c:if test="${param.kind eq '캣타워'}"></c:if>/><label for="kindCategory8">Tower</label><br><br>   			 				                     
                     </form> 
                </div>
            </div>
          </div>
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">

				<div class="row">
					<div class="col-12">
						<div class="product-topbar d-xl-flex align-items-end justify-content-between">
							<div style="padding-left: 1%;" class="col">
								<a href="#" class="search-nav"> <input type="button" value="검색" class="btn btn-outline-secondary">
								 <img src="img/core-img/search.png" alt=""></a>
								  <c:if test="${loginuser.userType eq 'admin' }">
								 <a href="pr-write"> <input type="button" value="글작성" class="btn btn-outline-secondary"></a>
								 </c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<c:forEach begin="0" end="${ fn:length(product)/3 }" varStatus="i">
               <div class="row">
               <c:forEach var="product" begin="${i.index*3}" end="${i.index*3+2}" items="${ product }" varStatus="productnum">
               
                   <!-- Single Product Area -->
                   <div class="col-8 col-sm-4 col-md-8 col-xl-4">
                       <div class="single-product-wrapper">
                       	   
                           <!-- Product Image -->
                           <div class="product-img">
                               <img src="/catopia/resources/upload-files/${ product.img.savedFileName }" alt="" style="height:320px;width:310px">
                           </div>

                           <!-- Product Description -->
                           <div class="product-description d-flex align-items-center justify-content-between">
                               <!-- Product Meta Data -->
                               <div class="product-meta-data">
                                   <div class="line"></div>
                             		<a href="pr-detail?productNo=${ product.productNo }" data-toggle="tooltip" data-placement="right" title="용품 둘러보기">  
                                   		<p class="product-price">${ product.name }</p></a>
                                       <h6>${ product.kind }</h6>                                   		
                                       <h6>₩${ product.price }</h6>
                                       
                               </div>
                               <!-- Ratings & Cart -->
                               <div class="ratings-cart text-right">
                                   <div class="ratings">
                                       <i class="fa fa-star" aria-hidden="true"></i>
                                       <i class="fa fa-star" aria-hidden="true"></i>
                                       <i class="fa fa-star" aria-hidden="true"></i>
                                       <i class="fa fa-star" aria-hidden="true"></i>
                                       <i class="fa fa-star" aria-hidden="true"></i>
                                   </div>
                                   <div class="cart">
                                       <a href="/catopia/re-upload/re-list" data-toggle="tooltip" data-placement="left" title="용품 리뷰보기">리뷰보기<img src="/catopia/resources/img/core-img/cart.png" alt=""></a>
                                   </div>
                               </div>
                           </div>                       
                       </div>
                   </div>
                   </c:forEach>
               </div><!-- end row --> 
               <br>
               </c:forEach>
              
               <div class="row">
                    <div class="col-12">
                        <nav aria-label="navigation">
             <ul class="pagination justify-content-end mt-50">
                <li class="page-item">
                 <c:if test="${ProductPageMaker.prev}">
                  <a class="page-link" href="pr-listPage${ProductPageMaker.makeQuery(ProductPageMaker.startPage - 1)}">이전</a>
                 </c:if> 
                 </li>
              
               <c:forEach begin="${ProductPageMaker.startPage}" end="${ProductPageMaker.endPage}" var="idx">
                 <li class="page-item">
                  <a class="page-link" href="pr-listPage${ProductPageMaker.makeQuery(idx)}">${idx}</a>
               </li>
               </c:forEach>
                 
                
                <li class="page-item">
                 <c:if test="${ProductPageMaker.next && ProductPageMaker.endPage > 0}">
                  <a class="page-link" href="pr-listPage${ProductPageMaker.makeQuery(ProductPageMaker.endPage + 1)}">다음</a>
                 </c:if> 
                 </li>   
             </ul>
             </nav>
            </div>  
            </div>                                                
           
            </div>
        </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Footer Area Start ##### -->
 <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    <!-- ##### Footer Area End ##### -->


	<script type="text/javascript">
	
   	$(function(){	   		
   		$('#kindCategory').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});

   	$(function(){	   		
   		$('#kindCategory2').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});

   	$(function(){	   		
   		$('#kindCategory3').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});   	

   	$(function(){	   		
   		$('#kindCategory4').on('change', function(event){
   			this.form.submit();
   			
   		});
   	}); 

   	$(function(){	   		
   		$('#kindCategory5').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});   	
   	
   	$(function(){	   		
   		$('#kindCategory6').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});  
   	
   	$(function(){	   		
   		$('#kindCategory7').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});

   	$(function(){	   		
   		$('#kindCategory8').on('change', function(event){
   			this.form.submit();
   			
   		});
   	});     	
	</script>
</body>

</html>