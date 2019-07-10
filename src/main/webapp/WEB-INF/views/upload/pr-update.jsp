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
	
	<title>CatWebSite | Update</title>
	
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
	
		<h3 style="text-align:center;padding-top:50px">용품구매</h3>
		
		<div class="container" style="margin-top:20px; text-align:center; width: 60%;">	        
		        <form action="/catopia/pr-upload/pr-update"
						method="post"
						enctype="multipart/form-data" >
					<input type="hidden" name="productNo" value="${ product.productNo }">
		        <table class="table table-bordered">
			<tr style="height: 50px; width: 500px">
		                <th>용품이름</th>
		                <td>
		                    <input type="text" name="name" style="width:550px" class="form-control" value="${ product.name }"/>
		                </td>
		            </tr>
		            <tr>
		            	<th>용품종류</th>
		             <td>
		                    <select name="kind">
		                      <option value="사료" selected="selected">사료</option>
							  <option value="하우스">하우스</option>		                      
		                      <option value="미용">미용</option>
		                      <option value="목욕">목욕</option>	
							  <option value="장난감">장난감</option>
							  <option value="모래">모래</option>							  
							  <option value="캣타워">캣타워</option>							
						     </select>
		                </td>
		                </tr>
		            <tr>
		                <th>용품가격</th>
		                <td>
		                    <input type="text" name="price" style="width:550px" class="form-control" value="${ product.price }"/>
		                </td>
		            </tr>		            
		            <tr>
		                <th colspan="1">작성자</th>
		                <td colspan="2" style="text-align:left">
		              	<input  type="hidden" name="uploader" value="${loginuser.memberId}" >
		                	${ loginuser.memberId}
		                	
		                	<%-- 히든속성이 아님
		                	<input type="hidden" name="uploader" 
		                	value="<%= member.getMemberId() %>" readonly="readonly">
		                	--%>
		                	
		                </td>
		            </tr>
		            <tr>
		                <th colspan="1" >이미지</th>
		                <td colspan="2" style="text-align:left">
		                  	<c:forEach var="file" items="${ product.imgs }">
			                ${ file.userFileName } 
			               [<a href="/catopia/pr-upload/delete-file/${ product.productNo }/${ file.productImgNo }">삭제</a>]<br>
			                </c:forEach>
							  <div class="custom-file">
							    <input type="file" class="custom-file-input" id="image" name="attach">
							    <label class="custom-file-label" for="customFile">이미지를 선택해주세요.</label>
							  </div>
							
		                </td>
		            </tr>
		           
		            <tr>
		                <td colspan="3">
		                	<textarea name="content" style="width:750px" rows="20" class="form-control">${ product.content }</textarea>
		                </td>
		            </tr>
		            
		            
		            
		            
		        </table>
		        <div class="buttons">
		        	<input type="submit" value="자료등록"  class="btn btn-outline-secondary" />
		        	<input id="cancel_button" type="button" value="취소"  class="btn btn-outline-secondary"  />
		        </div>
		        </form>
		        
		        <script type="text/javascript">
						window.addEventListener('load', function(event) {
							var btnCancel = document
									.querySelector('#cancel_button');
							btnCancel.addEventListener('click',
									function(event) {
							
										history.back(); //브라우저의 이전 버튼을 클릭
									});
						});
					</script>
		    </div>
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
	
	<script>
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	</script>
	<script async src="https://www.google-analytics.com/analytics.js"></script>
	
</body>
</html>