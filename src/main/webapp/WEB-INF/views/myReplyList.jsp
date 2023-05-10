<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>작성한 글/댓글 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>작성한 댓글의 게시판 목록</h3>
	<input type="button" value="작성한 게시판 목록 보기" onclick="location.href='myBoardList.go'"/><br/><br/><br/>
	<table>
		<colgroup>
			<col width="5%"/>
			<col width="25%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="30%"/>
			<col width="10%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>게시판 제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>작성한 댓글 내용</th>
				<th>댓글 작성일</th>
				<th>조회수</th>
			</tr>
		</thead>		
		<tbody> 
			<c:if test="${myReplyList.size() == 0}">
				<tr>
					<th colspan="6">등록한 댓글이 없습니다.</th>
				</tr>
			</c:if>
			
				<c:forEach items="${myReplyList}" var="bbs">
					<tr>
						<td>${bbs.fbNo}</td>
						<td><a href="fdetail.do?fbNo=${bbs.fbNo}">${bbs.title}</a></td>
						<td>${bbs.fbTime}</td>
						<td>${bbs.id}</td>
						<td>${bbs.coContent}</td>
						<td>${bbs.coTime}</td>
						<td>${bbs.bhit}</td>
					</tr>
				</c:forEach>
			
		</tbody>
	</table>
</body>
<script>
</script>
</html>