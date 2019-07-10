<%@ page import="com.catwebsite.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>자료 목록</title>
	<link rel="Stylesheet" href="/movieproject/resources/styles/default.css" />
</head>
<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<div style="padding-top:25px;text-align:center">
			<h1>영화 리뷰</h1>
			<table border="1" style="width:860px;margin:0 auto">
				<tr style="background-color:firebrick;height:30px">
					<th style="color:white; width:50px">번호</th>
					<th style="color:white; width:50px">조회수</th>
					<th style="color:white; width:100px">개봉일</th>					
					<th style="color:white; width:300px">영화제목</th>
					<th style="color:white; width:125px">영화장르</th>
					<th style="color:white; width:125px">영화별점</th>				
					<th style="color:white; width:125px">작성자</th>
					<th style="color:white; width:125px;text-align:center">작성일</th>
				</tr>
				<c:forEach var="search" items="${ search }">
				<tr style="height:30px">
					<td>${ search.uploadNo }</td>			
					<td>${ search.readCount }</td>
					<td>${ search.opendate }</td>		
					<td style='text-align:left;padding-left:10px'>
			<a href="detail?uploadno=${ search.uploadNo }" style="text-decoration: none">
							${ search.title }
						</a>
					</td>
					<td>${ search.genre }</td>
					<td>${ search.grade }</td>
					<td>${ search.uploader }</td>
					<td>${ search.regDate }</td>
				</tr>
				</c:forEach>
				
				
			</table>
			<br /><br />
				<div class="buttons">
			 		<a href="write">
		        	<input type="submit" value="게시물 등록" style="height:25px" /></a>
		        </div>
			&emsp;&emsp;&emsp;
			<form action="search?col=all&word=" method="get">
			<select name="col">
			<option value="all">---선택---</option>
			<option value="writer">작성자</option>
			<option value="title">영화제목</option>
			<option value="genre">영화장르</option>
			<option value="content">영화리뷰</option>
			</select>
			&emsp;
			<input type="text" name="word" style="width:200px">&emsp;
			<input type="submit" value="검색">
			</form>
					

		</div>
	</div>
		

</body>
</html>











