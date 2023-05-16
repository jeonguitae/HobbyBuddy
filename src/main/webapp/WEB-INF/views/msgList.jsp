<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>쪽지함</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>쪽지함</h3>
	<input type="button" value="보낸 쪽지함으로 이동" onclick="location.href='msgList2.go'"/><br/><br/>
	<table>

		<thead>
			<tr>
				<th>쪽지 번호</th>
				<th>보낸 사람</th>
				<th>쪽지 내용</th>
				<th>쪽지 시간</th>
				<th>쪽지 답장</th>
				<th>쪽지 삭제</th>
				<th>쪽지 신고</th>
			</tr>
		</thead>		
		<tbody> 
			<c:if test="${msgList.size() == 0}">
				<tr>
					<th colspan="7">받은 쪽지가 없습니다.</th>
				</tr>
			</c:if>
			
				<c:forEach items="${msgList}" var="bbs">
					<tr>
						<td>${bbs.msgNo}</td>
						<td>${bbs.id_send}</td>
						<td>${bbs.msg_content}</td>
						<td>${bbs.msg_time}</td>
						<td><a href="msgReply.go?id_send=${bbs.id_send}">답장 하기</a></td>
						<td><a href="msgDel.do?msgNo=${bbs.msgNo}">삭제 하기</a></td>
						<td><a href="reportMsg.go?msgNo=${bbs.msgNo}&id_send=${bbs.id_send}&msg_content=${bbs.msg_content}">신고 하기</a></td>
					</tr>
				</c:forEach>			
		</tbody>
	</table>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		window.opener = self;
		window.close();
		alert("쪽지를 보냈습니다.");
		return true;
	}
</script>
</html>