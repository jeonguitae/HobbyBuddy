<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>사진 관리</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>마이페이지 : 사진 관리</h3>
	<input type="button" onclick="location.href='./mypage.go'" value="마이 페이지로 이동"/><br/><br/>
	
	<c:if test="${dto.new_photo_name eq null}">	
		<form action="proPhotoUpload.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" value="${loginId}" readonly/></td>
				</tr>
				<tr> 
					<th>프로필 사진 등록</th>
					<td><input type="file" name="photo"/><td>
					<button>저장</button>	
				</tr>
			</table>	
		</form>
	</c:if>
	
	<c:if test="${dto.new_photo_name ne null}">	
		<form action="myProPhotoDel.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" value="${loginId}" readonly/></td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<img width="500" src="/photo/${dto.new_photo_name}"/>
						<br/><br/><button>사진 삭제</button>
					</td>
			    </tr>
			</table>	
		</form>
	</c:if>
	
	
</body>
<script>

</script>
</html>