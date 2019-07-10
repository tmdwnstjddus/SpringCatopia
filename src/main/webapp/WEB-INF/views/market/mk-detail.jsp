<%@ page import="com.catwebsite.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%--jstl의 함수를 제공하는 taglib --%>
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
 

					<div style="padding-top: 30px; text-align: center">
						<div id="inputcontent">
							<div id="inputmain">
								<div class="inputsubtitle">회원장터 자료 정보</div>
								<table>
									<tr>
										<th>제목</th>
										<td>${ market.mkTitle }</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${ market.memberId }</td>
									</tr>
									<tr>
										<th>조회수</th>
										<td>${ market.mkreadCount }</td>
									</tr>
									<tr>
										<th>등록일자</th>
										<td>${ market.regDate }</td>
									</tr>
									<tr>
										<th>이미지</th>
										<td><c:forEach var="file" items="${ market.files }">
												<%-- <a href="/catopia/market/download/${ file.marketFileNo }">${ file.userFileName }</a>[${ file.downloadCount }]<br> --%>
												<img src="/catopia/resources/upload-files/${ file.savedFileName }" alt="${ file.userFileName }" /><br>
											</c:forEach></td>
									</tr>
									<tr>
										<th>상세설명</th>
<%-- 줄바꿈 문자열을 저장하고 있는 변수 만들기 --%>
<c:set var="enter" value="
" />
										<%-- market.content 문자열에서 \r\n을 <br>로 변경 --%>
										
										<td>${ fn:replace(market.mkContent, enter, '<br>') }</td>
										<a>*안전거래시 Cat Shop에서 순종여부, 건강상태 확인후 결재 및 수수료 수수. 개인간 직거래로 발생한 문제시 책임지지 않습니다.*</a>
									</tr>
								</table>
								<div class="buttons">
									<%-- 로그인한 사용자와 글의 작성자가 같으면 삭제, 수정 버튼 활성화 --%>
									<c:if test="${ loginuser.memberId eq market.memberId }">
										<input type="button" id="update_button" value="편집"
											style="height: 25px" />
										<input type="button" id="delete_button" value="삭제"
											style="height: 25px" />
									</c:if>

									<input type="button" id="cancel_button" value="목록보기"
										style="height: 25px" />
									<script type="text/javascript">
		        	//브라우저가 html을 모두 읽고 처리할 준비가 되었을 때 호출할 함수 지정
		        	window.addEventListener('load', function(event) {//js의 main 함수 역할
		        		
		        		var btnCancel = document.querySelector('#cancel_button');
		        		btnCancel.addEventListener('click', function(event) {
		        			location.href = "/catopia/market/mk-list"; //주소창에 list를 입력하고 엔터
		        			//history.back(); // 브라우저의 이전 버튼을 클릭
		        		});
		        		
		        		var btnDelete = document.querySelector('#delete_button');
		        		btnDelete.addEventListener('click', function(event) {
		        			var ok = confirm("${market.mkboardNo}번 자료를 삭제할까요?");
		        			if (ok) {
			        			location.href = "/catopia/market/delete/${ market.mkboardNo }";		        			
		        			}
		        		});
		        		
		        		var btnUpdate = document.querySelector('#update_button');
		        		btnUpdate.addEventListener('click', function(event) {
		        			location.href = "/catopia/market/mk-update/${ market.mkboardNo }";
		        		});
		        		
		        	});
		        	</script>
								</div>
							</div>
						</div>

						<br>
						<br>

						<!-- write comment area -->
						<form id="commentform">
							<input type="hidden" name="mkboardNo"
								value="${ market.mkboardNo }" /> <input type="hidden"
								name="memberId" value="${ loginuser.memberId }" />
							<table style="width: 800px; border: solid 1px; margin: 0 auto">
								<tr>
									<td style="width: 750px"><textarea id="comment_content"
											name="content" style="width: 730px" rows="3"></textarea></td>
									<td style="width: 50px; vertical-align: middle"><a
										id="writecomment" href="javascript:"
										style="text-decoration: none"> 댓글<br />등록
									</a></td>
								</tr>
							</table>
						</form>

						<!-- comment list -->
						<table id="comment-list" style="width: 800px; border: solid 1px; margin: 0 auto">
						<c:if
							test="${ not empty market.comments and market.comments[0].commentNo != 0 }">
							<br>
							<hr style="width: 800px; margin: 0 auto">
							<br>

								<c:forEach var="comment" items="${ market.comments }">
									<tr id="tr${ comment.commentNo }">
										<td
											style="text-align:left;margin:5px;border-bottom: solid 1px;padding-left:${comment.depth * 20}px">

											<div id='commentview${ comment.commentNo }'>
												${ comment.memberId } &nbsp;&nbsp; [${ comment.regDate }] <br />
												<br /> <span> ${ comment.content } </span> <br />
												<br />
												<div
													style='display:${ loginuser.memberId eq comment.memberId ? "block" : "none" }'>
													<a class="editcomment"
														data-commentno='${ comment.commentNo }' href="javascript:">편집</a>
													&nbsp; <a class="deletecomment" href="javascript:"
														data-commentno="${ comment.commentNo }">삭제</a>
												</div>
												<a class="recomment-link btn btn-sm btn-success"
													data-commentno="${ comment.commentNo }">댓글 쓰기</a>
											</div>
											<div id='commentedit${ comment.commentNo }'
												style="display: none">
												${ comment.memberId } &nbsp;&nbsp; [${ comment.regDate }] <br />
												<br />
												<form id="updateform${ comment.commentNo }">
													<input type="hidden" name="commentNo"
														value="${ comment.commentNo }" />
													<textarea name="content" style="width: 550px" rows="3"
														maxlength="200">${ comment.content }</textarea>
												</form>
												<br />
												<div>
													<a class="updatecomment" href="javascript:"
														data-commentno="${ comment.commentNo }">수정</a> &nbsp; <a
														class="cancel" data-commentno="${ comment.commentNo }"
														href="javascript:">취소</a>
												</div>
											</div>

										</td>
									</tr>
								</c:forEach>

							
						</c:if>
					</table>
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>

				

				<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
					integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
					crossorigin="anonymous"></script>
				<script
					src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
					integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
					crossorigin="anonymous"></script>


				<script type="text/javascript">
	$(function() {
		$('#writecomment').on('click', function(event) {
			
			//serialize : <form에 포함된 입력 요소의 값을 이름=값&이름=값&... 형식으로 만드는 함수
			var formData = $('#commentform').serialize();
			 // alert(formData)
			
 			$.ajax({
				url: "/catopia/market/write-comment",
				method: "POST",
				data: formData,
				success: function(data, status, xhr) {
					alert(data);
					$("#comment-list").load('/catopia/market/comment-list', 
											{ "mkboardNo" : ${ market.mkboardNo } }, 
											function() {})
				},
				error: function(xhr, status, err) {
					alert(err);
				}
			});
		});
		
		var currentCommentNo = -1;
		//$('.editcomment').on('click', function(event) {
		$('#comment-list').on('click', '.editcomment', function(event) {
			commentNo = $(this).attr('data-commentno'); // $(event.target) == $(this)
			
			//이전에 편집중인 항목을 원래 상태로 복구
			if (currentCommentNo != -1) {
				$('#commentview' + currentCommentNo).css('display', '');
				$('#commentedit' + currentCommentNo).css('display', 'none');
			}
			
			$('#commentview' + commentNo).css('display', 'none');
			$('#commentedit' + commentNo).css('display', '');
			currentCommentNo = commentNo;
		});
		
		$('#comment-list').on('click', '.cancel', function(event) {
			commentNo = $(this).attr('data-commentno'); // $(event.target) == $(this)
			$('#commentview' + commentNo).css('display', '');
			$('#commentedit' + commentNo).css('display', 'none');
			currentCommentNo = -1;			
		});
		
		$('#comment-list').on('click', '.deletecomment', function(event) {
			commentNo = $(this).attr('data-commentno');
			$.ajax({
				url: "/catopia/market/delete-comment",
				method: "GET",
				data: "commentNo=" + commentNo,
				success: function(data, status, xhr) {
					if (data == 'success') {
						$('#tr' + commentNo).remove();
						alert('삭제했습니다.');
					} else {
						alert('삭제 실패 1');
					}
				},
				error: function(xhr, status, err) {
					alert('삭제 실패 2');
				}
			});
		});
		
		$('#comment-list').on('click', '.updatecomment', function(event) {
			//현재 클릭된 <a 의 data-commentno 속성 값 읽기
			var commentNo = $(this).attr('data-commentno');
			var content = $('#updateform' + commentNo + ' textarea').val();
			var inputData = $('#updateform' + commentNo).serialize();
			
			//ajax 방식으로 데이터 수정
			$.ajax({
				"url": "/catopia/market/update-comment",
				"method": "POST",
				"data": inputData,
				"success": function(data, status, xhr) {
					alert('댓글을 수정했습니다.');
					var span = $('#commentview' + commentNo + ' span');					
					span.html(content.replace(/\n/gi, '<br>'));
					//view-div는 숨기고, edit-div는 표시하기	
					$('#commentview' + commentNo).css('display', 'block');
					$('#commentedit' + commentNo).css('display', 'none');
				},
				"error": function(xhr, status, err) {
					alert('댓글 수정 실패');
				}
			});
		});
		
		$('#comment-list').on('click', '.recomment-link', function(event) {
			var commentNo = $(this).attr('data-commentno');
			$('#write-recomment-modal input[name=commentNo]').val(commentNo);
			$('#write-recomment-modal').modal('show'); //show bootstrap modal
		});
		
		$('#write-recomment').on('click', function(event) {
			
			var content = $('#recomment-form textarea').val();
			if (content.length == 0) return;
			
			var recommentData = $('#recomment-form').serialize();
			
			$.ajax({
				url: "/catopia/market/write-recomment",
				method: "POST",
				data: recommentData,
				success: function(data, status, xhr) {
					alert('success');					
					$('#write-recomment-modal').modal('hide'); //hide bootstrap modal
					$('#recomment-form').each(function() {
						this.reset();
					});
					$("#comment-list").load('/catopia/market/comment-list', 
							{ "mkboardNo" : ${ market.mkboardNo } }, 
							function() {})
					
				},
				error: function(xhr, status, err) {
					alert('fail');
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






	<!-- The Modal -->
	<div class="modal" id="write-recomment-modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">댓글 쓰기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="recomment-form">
						<input type="hidden" name="commentNo"> <input
							type="hidden" name="memberId" value="${ loginuser.memberId }">
						<input type="hidden" name="mkboardNo"
							value="${ market.mkboardNo }">
						<textarea name="content" rows="5" style="width: 465px"></textarea>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="write-recomment" class="btn btn-info">댓글
						등록</button>
					<button type="button" class="btn btn-danger"
						data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>

</html>











