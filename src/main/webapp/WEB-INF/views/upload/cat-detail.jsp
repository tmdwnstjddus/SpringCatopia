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
                        <form action="list?col=all&word=" method="get">
                            <input type="list" name="list" id="list" placeholder="검색어를 입력해주세요.">
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
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Cat</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${ product.name }</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                
               
                <div class="row">
                <c:forEach var="list" items="${ list.imgs }">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">                                
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="/catopia/resources/upload-files/${ list.savedImgName }">
                                            <img class="d-block w-100" src="/catopia/resources/upload-files/${ list.savedImgName }" alt="First slide" style="height:630;width:650">
                                        </a>
                                    </div>    
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
                                <p class="product-price">이름 : ${ list.catName }</p><br>
                                    <h6>종류 : ${ list.catRace }</h6><br>
                                    <h6>성별  : ${ list.catGender }</h6><br>
                                    <h6>나이 : ${ list.catAge }</h6><br>
                                    <h6>정보 : ${ list.catContent }</h6><br>
                                    <h6>작성자 : ${ list.uploader }</h6>
                  
                                   <div class="review">
                                        <button><a href="/catopia/re-upload/re-list">리뷰 쓰기</a></button>
                                  </div><br>
                                
                                
                                <!---------------------------------------------------------------------------- -->
                                
                                    <div class="buttons">
                                    <c:if test="${ loginuser.memberId eq list.uploader }">
                        <input type="button" id="update_button"
                           class="btn btn-outline-secondary" value="편집" />
                        <input type="button" id="delete_button"
                           class="btn btn-outline-secondary" value="삭제" />
                           </c:if>

                                                               
                        <input type="button" id="cancel_button"
                              class="btn btn-outline-secondary" value="목록보기" /><br>
                  <script type="text/javascript">                                                                           
                 //브라우저가 html을 모두 읽고 처리할 준비가 되었을 때
                 window.addEventListener("load", function(event) { //js의 main 함수
                    var btnCancel = document.querySelector("#cancel_button");
                    btnCancel.addEventListener("click", function(event){ 
                       location.href = "/catopia/cat-upload/cat-list?col=all&word="; //주소창에 list.action을 입력하고 엔터
                       //history.back(); //브라우저의 이전 버튼을 클릭
                         });
                    
                    var btnDelete = document.querySelector('#delete_button');
                    btnDelete.addEventListener('click', function(event) {
                       var ok = confirm("${list.catNo}번 자료를 삭제할까요?");
                       if(오케이){
                          //<a 를 통한 요청이므로 주소 뒤에 ?key=value 형식을 써서 데이터 전송
                          location.href = "/catopia/cat-upload/cat-delete/${ list.catNo }";
                       }
                    });
                    
                    var btnUpdate = document.querySelector('#update_button');
                    btnUpdate.addEventListener('click', function(event) {
                       //<a 를 통한 요청이므로 주소 뒤에 ?key=value 형식을 써서 데이터 전송
                       location.href = "/catopia/cat-upload/cat-update/${ list.catNo }";
                    });
                 });
                 </script>
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
    <!-- ##### Footer Area End ##### -->



</body>

</html>