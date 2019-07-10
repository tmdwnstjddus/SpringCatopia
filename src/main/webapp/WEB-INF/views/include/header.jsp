<%@ page language="java" 
       contentType="text/html; charset=utf-8" 
       pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      

      
      <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="/catopia/home"><img src="/catopia/resources/img/core-img/logo.png" alt=""></a>
            </div>
            
            
            
            <!-- Amado Nav -->
            <nav class="amado-nav">
                 
                <ul>
                    <li class="active"><a href="/catopia/home">||&nbsp;Home</a></li>
                     <li><a href="/catopia/cat-upload/cat-listPage">||&nbsp;Cat</a></li>
                    <li><a href="/catopia/pr-upload/pr-listPage">||&nbsp;Product</a></li>
                     <li><a href="/catopia/market/mk-list">||&nbsp;Market</a></li>
                      <li><a href="/catopia/re-upload/re-list">||&nbsp;Review</a></li>                  
                    <li><a href="/catopia/qa-upload/qa-list">||&nbsp;Q&A</a></li>
                     <c:if test="${loginuser.userType eq 'admin' }">
                   <li><a href="/catopia/member/memberlist">||&nbsp;Management</a></li>
                  </c:if>
                </ul>
            </nav>
            
            
           
            <!--  Login Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
            <c:choose>
            <c:when test="${ empty loginuser }">
                <a href="/catopia/account/login" class="btn amado-btn mb-15">Login</a>
                <a href="/catopia/account/register" class="btn amado-btn active">Register</a>
            </c:when>
            <c:otherwise>               
               <a href="#" class="btn amado-btn active">${ loginuser.memberId }님 </a>
               <a href="/catopia/account/logout" class="btn amado-btn mb-15">로그아웃</a>
            </c:otherwise>
            </c:choose>
       
            </div>
            
            
            <c:choose>
            <c:when test="${ empty loginuser }">
                
            </c:when>
            <c:otherwise>    
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="/catopia/cart-upload/ordercart?memberId=${loginuser.memberId }" class="cart-nav"><img src="/catopia/resources/img/core-img/cart2.png" alt=""> Cart <span>(0)</span></a>
                <a href="/catopia/member/membermypage?memberId=${loginuser.memberId }" class="fav-nav"><img src="/catopia/resources/img/core-img/favorites.png" alt=""> MyPage</a>             
            </div>
           </c:otherwise>
           </c:choose>
           
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->
        
        
        
        