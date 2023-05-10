<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>작성한 글/댓글 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 1000px;
		margin : 5px;
	}

</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>작성한 글 목록</h3>
	<input type="button" value="작성한 댓글 목록 보기" onclick="location.href='myReplyList.go'"/>
	<table>
		<colgroup>
			<col width="10%"/>
			<col width="40%"/>
			<col width="15%"/>
			<col width="25%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>		
		<tbody> 
			<c:if test="${myBoardList.size() == 0}">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			
				<c:forEach items="${myBoardList}" var="bbs">
					<tr>
						<td>${bbs.fbNo}</td>
						<td><a href="fdetail.do?fbNo=${bbs.fbNo}">${bbs.title}</a></td>
						<td>${bbs.id}</td>
						<td>${bbs.fbTime}</td>
						<td>${bbs.bhit}</td>
					</tr>
				</c:forEach>
			
		</tbody>
	</table>
</body>
<script>
</script>
</html>