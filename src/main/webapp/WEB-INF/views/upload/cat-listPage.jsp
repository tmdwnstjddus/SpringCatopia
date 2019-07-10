<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>CatWebSite | Cat</title>

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
                        <form action="cat-list?col=all&word=" method="get">
                            <select class="nice-select" name="col">    
                               <option value="all" class="all">---선택---</option>
                               <option value="catRace" class="catRace">고양이종류</option>
                               <option value="catAge" class="catAge">고양이나이</option>
                               <option value="catGender" class="catGender">고양이성별</option>
                            </select>
                            <input type="text" name="word" id="list" placeholder="검색어를 입력해주세요.">
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

        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h4 style="color:#fbb710; font-family: 바탕; font-weight: bold">Category</h4><br>

<!--  카테고리  -->
                <div class="categories-menu">
                      <form id="selectform" action="cat-kind" method="POST">
                  <input type="radio" name="catGender" value="all" id="kindCategory" />
                  <a href="/catopia/cat-upload/cat-listPage"><h6>&nbspALL</h6></a> <br>                   
                  <input type="radio" name="catGender" value="수컷" id="kindCategory2" <c:if test="${param.catGender eq '수컷'}"></c:if>/>
                  <label for="kindCategory2"><h6>수컷</h6></label><br><br>
                  <input type="radio" name="catGender" value="암컷" id="kindCategory3" <c:if test="${param.catGender eq '암컷'}"></c:if>/>
                  <label for="kindCategory3"><h6>암컷</h6></label><br><br>      
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
                         <a href="cat-write"> <input type="button" value="글작성" class="btn btn-outline-secondary"></a>
                         </c:if>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <c:forEach begin="0" end="${ fn:length(list)/3 }" varStatus="i">
               <div class="row">
               <c:forEach var="list" begin="${i.index*3}" end="${i.index*3+2}" items="${ list }" >


                    <!-- Single Product Area -->
                    <div class="col-8 col-sm-4 col-md-8 col-xl-4">
                        <div class="single-product-wrapper">
                        
                            
                            <!-- Product Image -->
                            <div class="product-img">                        
                                <img src="/catopia/resources/upload-files/${ list.img.savedImgName }" style="height: 280px; width: 400px;" alt="">
                            </div>
                     
                     <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                               <div class="product-meta-data">
                                   <div class="line"></div>
                                   <a href="/catopia/cat-upload/cat-detail/${ list.catNo }" data-toggle="tooltip" data-placement="right" title="고양이 정보보기"> 
                                         <p class="product-price">이름 : ${ list.catName }</p></a>
                                       <h6>종류 : ${ list.catRace }</h6>
                                       <h6>성별 : ${ list.catGender }</h6>
                                       <h6>나이 : ${ list.catAge }</h6>
                                       <h6>작성자 : ${ list.uploader }</h6>
                                     </div>
                                <!-- Ratings & Cart -->
                                <div class="ratings-cart text-right">
             
                                    <div class="cart">
                                        <a href="/catopia/re-upload/re-list.html" data-toggle="tooltip" data-placement="left" title="고양이 리뷰보기">리뷰보기<img src="/catopia/resources/img/core-img/cart.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            </div>
                            </c:forEach>
                   &nbsp;
               </div><!-- end row -->
               <br>
               </c:forEach>
               
               
               <div class="row">
                    <div class="col-12">
                        <nav aria-label="navigation">
             <ul class="pagination justify-content-end mt-50">
                <li class="page-item">
                 <c:if test="${CatPageMaker.prev}">
                  <a class="page-link" href="cat-listPage${CatPageMaker.makeQuery(CatPageMaker.startPage - 1)}">이전</a>
                 </c:if> 
                 </li>
              
               <c:forEach begin="${CatPageMaker.startPage}" end="${CatPageMaker.endPage}" var="idx">
                 <li class="page-item">
                  <a class="page-link" href="cat-listPage${CatPageMaker.makeQuery(idx)}">${idx}</a>
               </li>
               </c:forEach>
                 
                
                <li class="page-item">
                 <c:if test="${CatPageMaker.next && CatPageMaker.endPage > 0}">
                  <a class="page-link" href="cat-listPage${CatPageMaker.makeQuery(CatPageMaker.endPage + 1)}">다음</a>
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
      
   </script>

</body>

</html>