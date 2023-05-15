<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	#writing, th, td{
	border : 1px solid black;
	}
	#comment{
	border : none;
	}
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
		<table id="writing">
			<tr>
				<th>분류</th>
				<td>${dto.big_hb} - ${dto.small_hb}</td>
			
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.fbTime}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.bhit}</td>
			</tr>
			<c:if test="${dto.new_photo_name ne null}">
			<tr>
				<th>사진</th>
				<td><img width="500" src="/photo/${dto.new_photo_name}"/></td>
			</tr>
			</c:if>
			<tr>
				<th>내용</th>
				<td>${dto.bContent}</td>
			</tr>
			
			
			<c:if test="${dto.id eq sessionScope.loginId}">
			<tr>
				<th colspan="2">
					<input type="hidden" name="board_class" value="${dto.board_class}">
					<input type="button" onclick="location.href='./fupdate.go?fbNo=${dto.fbNo}'" value="수정"/>
					<input type="button" onclick="location.href='./fdelete.do?fbNo=${dto.fbNo}'" value="삭제"/>
				</th>
			</tr>
			</c:if>
		</table>	
		<input type="button" onclick="location.href='./flist.go'" value="리스트"/>
		
		<br><br>
		<p>댓글 쓰기</p>
		<br>
		<form class="comment" method="post" action="cowrite.do?fbNo=${dto.fbNo}">
			<input type="hidden" name="id_receive" value="${dto.id}">
			<input type="hidden" name="alarm_title" value="${dto.title}">
			<input type="hidden" name="alarm_num" value="${dto.fbNo}">
			<input type="hidden" name="id" value="${sessionScope.loginId}">
			<input type="text" name="coContent" value=""/>
			<button>작성</button>	
		</form>

		<br><br>
				<table id="comment">
					<c:forEach items="${coList}" var="coList">
						<tr>
							<%-- <th class="coNo" hidden>${coList.coNo}</th> --%>
							<th>${coList.id}</th>
							<td>${coList.coContent}</td>
							<td>${coList.coTime}</td>
							<td>
							<c:if test="${coList.id eq loginId}">
								<button onclick="location.href='./coupdate.go?coNo=${coList.coNo}&fbNo=${dto.fbNo}'">수정</button>
								<button onclick="location.href='./codelete.go?coNo=${coList.coNo}&fbNo=${dto.fbNo}'">삭제</button>
							</c:if>
							<c:if test="${coList.id ne loginId}">
								<button onclick="location.href='./reportComent.go?reporter=${coList.id}&reptboard_num=${dto.fbNo}&rept_content=${coList.coContent}&coNo=${coList.coNo}'">신고</button>								
							</c:if>
							</td>	
						</tr>
					</c:forEach>
				</table>
	
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>