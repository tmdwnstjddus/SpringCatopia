<%@ page import="com.catwebsite.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>QnA</title>



<!-- Favicon  -->
<link rel="icon" href="/catopia/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/catopia/resources/css/core-style.css">
<link rel="stylesheet" href="/catopia/resources/style.css">



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

					<h3 style="text-align: center; padding-top: 5%">QnA</h3>

					<div style="padding-top: 50; text-align: center">
						<div id="inputcontent">
							<div>
								<div class="inputsubtitle"></div>
								<form action="/catopia/qa-upload/qa-update" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="questionNo"
										value="${ question.questionNo }">
									<table class="table table-bordered" style="width:50%;margin: auto">
										<tr>
											<th>제목</th>
											<td><select name="category">
													<option value="고양이문의" selected="selected">고양이문의</option>
													<option value="용품문의">용품문의</option>
													<option value="기타문의">기타문의</option>
											</select></td>
											<td><input type="text" name="title" style="width: 550px"
												class="form-control" /></td>
										</tr>
										<tr>
											<th colspan="1">작성자</th>
											<td colspan="2" style="text-align: left"><input
												type="hidden" name="uploader"
												value="${ loginuser.memberId }"> ${ loginuser.memberId }



											</td>
										</tr>
										<tr>
											<th colspan="1">첨부자료</th>
											<td colspan="2" style="text-align: left"><c:forEach
													var="file" items="${question.files }">
                         ${ file.userFileName } 
                         [<a
														href="/catopia/qa-upload/delete-file/${ question.questionNo }/${ file.questionFileNo }">삭제</a>]&nbsp;|&nbsp;
						</c:forEach>

												<div class="custom-file">
													<input type="file" class="custom-file-input"
														id="customFile" name="attach"> <label
														class="custom-file-label" for="customFile">Choose
														file</label>
												</div></td>
										</tr>
										<tr>
											<td colspan="3"><textarea name="content" id="editor"
													style="width: 750px" rows="20" class="form-control">${ question.content }</textarea>
											</td>
										</tr>
									</table>
									<div class="buttons">
										<input type="submit" value="자료등록" id="insertBoard"
											class="btn btn-outline-secondary" /> <input
											id="cancel_button" type="button" value="취소"
											class="btn btn-outline-secondary" />
									</div>
								</form>

								<script type="text/javascript">
									window
											.addEventListener(
													'load',
													function(event) {
														var btnCancel = document
																.querySelector('#cancel_button');
														btnCancel
																.addEventListener(
																		'click',
																		function(
																				event) {

																			history
																					.back(); //브라우저의 이전 버튼을 클릭
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
	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row align-items-center">
				<!-- Single Widget Area -->
				<div class="col-12 col-lg-4">
					<div class="single_widget_area">
						<!-- Logo -->
						<div class="footer-logo mr-50">
							<a href="index.html"><img
								src="/catopia/resources/img/core-img/logo2.png" alt=""></a>
						</div>
						<!-- Copywrite Text -->
						<p class="copywrite">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This website is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="http://www.goott.co.kr" target="_blank">GoottAcedemy</a> &
							by<a href="/catopia/home" target="_blank">Catopia</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
											href="/catopia/cat-upload/cat-list">Cat</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/pr-upload/pr-list?col=all&word=">Product</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/market/mk-list">Market</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/re-upload/re-list">Review</a></li>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="/catopia/qa-upload/qa-list">Q&A</a></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

	<script>
		// Add the following code if you want the name of the file appear on select
		$(".custom-file-input").on(
				"change",
				function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected")
							.html(fileName);
				});
	</script>
	<script async src="https://www.google-analytics.com/analytics.js"></script>

	<!-- editor -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript"
		src="/catopia/resources/editor/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			//전역변수
			var obj = [];
			//스마트에디터 프레임생성
			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : obj,
						elPlaceHolder : "editor",
						sSkinURI : "/catopia/resources/editor/SmartEditor2Skin.html",
						htParams : {
							// 툴바 사용 여부
							bUseToolbar : true,
							// 입력창 크기 조절바 사용 여부
							bUseVerticalResizer : true,
							// 모드 탭(Editor | HTML | TEXT) 사용 여부
							bUseModeChanger : true,
						}
					});
			//전송버튼
			$("#insertBoard").click(function() {
				//id가 smarteditor인 textarea에 에디터에서 대입
				obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				//폼 submit
				$("#insertBoardFrm").submit();
			});
		});
	</script>

</body>
</html>