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


		
		<h3 style="text-align:center;padding-top:5%">Review</h3>
		<br />
		
		
		
		<div class="container" style="padding-top:50;text-align:center">
		<table class="table table-hover">
			<tr style="background-color:;height: 50px";>
				<th style="width: 50px;text-align: center">NO</th>
				<th style="width: 100px;text-align: center">
					<form id="selectform" action="viewcategory" method="POST">
                         <select name="category" id="selectcategory">
                             <option value="all" <c:if test="${param.category eq 'all'}">selected</c:if>>CATEGORY</option>
                             <option value="CAT" <c:if test="${param.category eq 'CAT'}">selected</c:if>>CAT</option>
                             <option value="PRODUCT" <c:if test="${param.category eq 'PRODUCT'}">selected</c:if>>PRODUCT</option>
                         </select>
                	</form>
				
				</th>
				<th style="width: 400px;text-align: center">CONTENTS</th>
				<th style="width: 125px;text-align: center">NAME</th>
				<th style="width: 150px;text-align: center; text-align: center">DATE</th>
			</tr>
			
			<c:forEach var="review" items="${review}">
				<tr style="height: 30px">
					<td style="text-align: center">${ review.reviewNo }</td>
					<td style="text-align: center">${ review.category }</td>
					<td style='text-align: left; padding-left: 10px'><a
						href="/catopia/re-upload/re-detail/${ review.reviewNo }">${ review.title }</a></td>
					<td style="text-align: center">${ review.uploader }</td>
					<td style="text-align: center">${ review.regDate }</td>
				</tr>
			</c:forEach>
		</table>
		
		<br></br>
		<div style="padding-top: 10px; padding-left:1000px; text-align: center" >
		 <input type="button" value="글작성" onclick="location.href='re-write' " class="btn btn-outline-secondary">
		</div>
	</div>
	</div>
	</div>		
	</div>		
			
        <!-- Product Catagories Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
    <!-- ##### Footer Area Start ##### -->
    	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	
	<script type="text/javascript">	        	
   	$(function(){
   		   		
   		$('#selectcategory').on('change', function(event){
   			
   			
   			this.form.submit();
   			
   		});
   	});
	</script>
</body>
</html>

