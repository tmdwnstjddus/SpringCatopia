<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <title>CatWebSite | OrderList</title>

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


		
		<h3 style="text-align:center;padding-top:5%">OrderList</h3>
		<br />
		
		<div class="container" style="padding-top:50;text-align:center">
		<c:choose>
		<c:when test="${map.count ==0 }">
			장바구니가 비었습니다.
		</c:when>
		<c:otherwise>
		<form name="form1" id="form1" method="post" action="/catopia/cart-upload/updatecart">
		<input type="hidden" name="memberId" value="${loginuser.memberId }">
		<table class="table table-hover">
			<tr style="background-color:;height: 50px">
				<th style="width: 30%;text-align: center">상품명</th>
				<th style="width: 20%;text-align: center">단가</th>
				<th style="width: 20%;text-align: center">수량</th>
				<th style="width: 20&;text-align: center">금액</th>
				<th style="width: 10%;text-align: center">취소</th>
				
				
			</tr>
			<c:forEach var="row" items="${map.carts}">
				<tr style="height: 30px">
					<td>
						${row.productName }
       				</td>					
					<td>${ row.productPrice }</td>
					<td>
						<input type="number" name="amount" value="${ row.amount }" min="1">
						<input type="hidden" name="productNo" value="${row.productNo }">
					</td>
					<td>${ row.money }</td>
					<td>
					<a href="/catopia/cart-upload/deletecart?orderId=${ row.orderId }&memberId=${loginuser.memberId}">
					삭제
					</a></td>
					
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
					금액 합계:	${map.sumMoney} <br>
					배송료:${map.fee }<br>
					전체 주문금액: ${map.allSum}
				</td>
			</tr>
		</table>
		<input type="hidden" name="count" value="${map.count }">
		<button type="submit" id="btnUpdate" class="btn btn-outline-secondary">수정</button>
		<input type="button" id="cancel" value="home" class="btn btn-outline-secondary">
	</form>
	</c:otherwise>
	</c:choose>
		
		<div>
		 
		 
		</div>
	</div>
	</div>
	</div>		
	</div>		
	</div>		
    
    
    <!-- ##### Main Content Wrapper End ##### -->

   

    <!-- ##### Footer Area Start ##### -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
	<script type="text/javascript">	        	
   	$(function(){
   		$('#cancel').on('click', function(event){
   			location.href="/catopia/home"; 
   			
   		});
   				
   	});
	</script>
</body>

</html>