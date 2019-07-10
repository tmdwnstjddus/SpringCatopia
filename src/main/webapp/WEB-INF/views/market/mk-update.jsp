<%@ page import="com.catwebsite.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%--jstl의 함수를 제공하는 taglib --%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<title>자료업로드</title>

<!-- Favicon  -->
<link rel="icon" href="/catopia/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/catopia/resources/css/core-style.css">
<link rel="Stylesheet" href="/catopia/resources/styles/default.css" />
<link rel="Stylesheet" href="/catopia/resources/styles/input2.css" />

</head>
<body>

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<!-- Mobile Nav (max width 767px)-->
		<div class="mobile-nav">
			<!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="/catopia/home"><img
					src="/resources/img/core-img/logo.png" alt=""></a>
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



					<div style="padding-top: 25px; text-align: center">
						<div id="inputcontent">
							<div id="inputmain">
								<div class="inputsubtitle">업로드 자료 정보</div>
								<form action="/catopia/market/mk-update" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="mkboardNo"
										value="${ market.mkboardNo }">
									<table>
										<tr>
											<th>제목</th>
											<td><input type="text" name="mkTitle"
												style="width: 580px" value="${ market.mkTitle }" /></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="hidden" name="memberId"
												value="${ loginuser.memberId }"> ${ loginuser.memberId }
											</td>
										</tr>
										<tr>
											<th>첨부자료</th>
											<td><c:forEach var="file" items="${ market.files }">
													<div id="file-${ file.marketFileNo }">
														${ file.userFileName } [<a
															id="delete-link-${ file.marketFileNo }"
															href="javascript:" data-fileno="${ file.marketFileNo }">삭제</a>]
													</div>
												</c:forEach> <br> <input type="file" name="attach"
												style="width: 580px; height: 20px" /></td>
										</tr>
										<tr>
											<th>자료설명</th>
											<td><textarea name="mkContent" style="width: 580px"
													rows="15">${ market.mkContent }</textarea></td>
										</tr>
									</table>
									<div class="buttons">
										<input type="submit" value="자료등록" style="height: 25px" /> 
										<input id="do-cancel" type="button" value="취소" style="height: 25px" />
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>


				<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
				<script type="text/javascript">
					$(function() {
						
						$('#do-cancel').on('click', function(event) {
							history.back();
						});
						
						$('a[id ^=delete-link]').on(
								'click',
								function(event) {

									var mkboardNo = '${ market.mkboardNo }';
									var fileNo = $(event.target).attr(
											'data-fileno');

									var yes = confirm(fileNo + '번 파일을 삭제할까요?');
									if (!yes) {
										return;
									}

									$.ajax({
										url : '/catopia/market/delete-file/'
												+ mkboardNo + '/' + fileNo,
										method : "GET",
										success : function(data, status, xhr) {
											if (data == 'success') { //data : 서버에서 응답한 값
												$('#file-' + fileNo).remove();
												alert('삭제했습니다.');
											} else {
												alert('삭제 실패 1');
											}
										},
										error : function(xhr, status, err) {
											alert('삭제 실패 2');
										}
									});

								});
					});
				</script>
			</div>
			<!-- Product Catagories Area End -->
		</div>
		<!-- ##### Main Content Wrapper End ##### -->
	</div>



	<!-- ##### Footer Area Start ##### -->
	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row align-items-center">
				<!-- Single Widget Area -->
				<div class="col-12 col-lg-4">
					<div class="single_widget_area">
						<!-- Logo -->
						<div class="footer-logo mr-50">
							<a href="/catopia/home"><img
								src="resources/img/core-img/logo2.png" alt=""></a>
						</div>
						<!-- Copywrite Text -->
						<p class="copywrite">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> &
							Re-distributed by <a href="https://themewagon.com/"
								target="_blank">Themewagon</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
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
											href="/catopia/upload/shop">Shop</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/upload/productdetail">Product</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/upload/cart">Cart</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/upload/checkout">Checkout</a></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->

	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script
		src="<c:url value="/resources/js/jquery/jquery-2.2.4.min.js" />"></script>
	<!-- Popper js -->
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<!-- Bootstrap js -->
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<!-- Plugins js -->
	<script src="<c:url value="/resources/js/plugins.js" />"></script>
	<!-- Active js -->
	<script src="<c:url value="/resources/js/active.js" />"></script>

</body>

</html>

















