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
   
   
   <title>자료업로드</title>
   
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
   
   
      <h3 style="text-align:center; padding-top:50px;">고양이 정보 등록</h3>
      
      <div class="container" style="margin-top:20px; text-align:center; width: 60%;">
              <form action="cat-write"
                  method="post"
                  enctype="multipart/form-data" >
                  
              <table class="table table-hover">
         <tr style="height: 50px; width: 500px">
            <th style="width:;text-align: center">이름</th>        
                <td>
                    <input type="text" name="catName" style="width:500px" class="form-control"/>
                </td>
         </tr>
         <tr style="height: 50px">
            <th style="width:;text-align: center">종류</th>
             <td>
                    <input type="text" name="catRace" style="width:500px" class="form-control"/>
                </td>
         </tr>
         <tr style="height: 50px">
            <th style="width:;text-align: center">나이</th>
            <td>
                <input type="text" name="catAge" style="width:500px" class="form-control"/>
            </td>
         </tr>
         <tr style="height: 50px">
            <th style="width:;text-align: center">성별</th>
            <td>
               <select name="catGender">
                      <option value="성별선택" selected="selected">성별선택</option>
                      <option value="수컷">수컷</option>
                 <option value="암컷">암컷</option>
               </select>
            </td>
         </tr>
         <tr style="height: 50px">
            <th style="width:;text-align: center">작성자</th>
            <td >
               <input  type="hidden" name="uploader" value="${loginuser.memberId}" >
                   ${ loginuser.memberId}
            </td>
         </tr>
         <tr style="height: 50px">
            <th style="width:;text-align: center">사진</th>
            <td>
               <div class="custom-file" >
                   <input type="file" class="custom-file-input" id="customFile" name="attach">
                   <label class="custom-file-label" for="customFile">이미지를 선택해주세요.</label>
                 </div>
            </td>
         </tr>
         <tr style="height: 50px">
            <th style="width:;text-align: center">정보</th>
            <td>
               <textarea name="catContent" style="width:550px" rows="13" class="form-control"></textarea>
            </td>
         </tr>
         
      </table>
      
              <div class="buttons">
                 <input type="submit" value="자료등록"  class="btn btn-outline-secondary"  />
                 <input id="cancel_button" type="button" value="취소"  class="btn btn-outline-secondary" />
              </div>
              </form>

               <script type="text/javascript">
                  //브라우저가 html을 모두 읽고 처리할 준비가 되었을 때 호출 할 함수 지정
                  window.addEventListener('load', function(event) {//js의 main 함수 역할
                     var btnCancel = document
                           .querySelector('#cancel_button');
                     btnCancel.addEventListener('click',
                           function(event) {
                              //location.href = "list";//주소창에 list.action을 입력하고 엔터
                              history.back(); //브라우저의 이전 버튼을 클릭
                           });
                  });
               </script>
      </div>      
   </div>
</div>
   </div>
   </div>
    <!-- Product Catagories Area End -->
    <!-- ##### Main Content Wrapper End ##### -->
    
    
     <!-- ##### Footer Area Start ##### -->
 <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    <!-- ##### Footer Area End ##### -->
   

   
   <script>
   // Add the following code if you want the name of the file appear on select
   $(".custom-file-input").on("change", function() {
     var fileName = $(this).val().split("\\").pop();
     $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
   });
   </script>
</body>
</html>