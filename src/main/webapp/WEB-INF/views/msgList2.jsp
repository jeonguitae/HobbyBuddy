<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>보낸 쪽지함</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>보낸 쪽지함</h3>
	<input type="button" value="받은 쪽지함으로 이동" onclick="location.href='msgList.go'"/><br/><br/>
	<table>
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="50%"/>
			<col width="15%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>쪽지 번호</th>
				<th>받은 사람</th>
				<th>쪽지 내용</th>
				<th>쪽지 시간</th>
				<th>쪽지 삭제</th>
			</tr>
		</thead>		
		<tbody> 
			<c:if test="${msgList2.size() == 0}">
				<tr>
					<th colspan="5">받은 쪽지가 없습니다.</th>
				</tr>
			</c:if>
			
				<c:forEach items="${msgList2}" var="bbs">
					<tr>
						<td>${bbs.msgNo}</td>
						<td>${bbs.id_receive}</td>
						<td>${bbs.msg_content}</td>
						<td>${bbs.msg_time}</td>
						<td><a href="msgDel.do?msgNo=${bbs.msgNo}">삭제 하기</a></td>
					</tr>
				</c:forEach>			
		</tbody>
	</table>
</body>
<script>
</script>
</html>