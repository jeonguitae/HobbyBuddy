<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 800px;
		margin : 5px;
	}
	table[class="second"]{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 1000px;
	}
</style>
</head>
<body>
	<table class="first">
	<colgroup>
		<col width="15%"/>
		<col width="85%"/>
	</colgroup>
		<thead>
			<tr>
				<th>대분류</th>
					<td class="bhobby">
						<input type="radio" name="bhobby" value="운동">운동
						<input type="radio" name="bhobby" value="맛집">맛집
						<input type="radio" name="bhobby" value="반려동물">반려동물
						<input type="radio" name="bhobby" value="기타여가">기타 여가
					</td>
			</tr>
			<tr>
				<th>중분류</th>
					<td class="mhobby">
					</td>
			</tr>
			
		</thead>
		<tbody>
			
		</tbody>
	</table>
		<button class="fbutton">검색</button>
	<table class="second">
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
			<c:if test="${list eq null}">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			
			<c:forEach items="${list}" var="bbs">
				<c:if test="${not empty sessionScope.loginId}">
					<tr>
						<td>${bbs.fbNo}</td>
						<td><a href="fdetail.do?fbNo=${bbs.fbNo}" id="login">${bbs.title}</a></td>
						<td>${bbs.id}</td>
						<td>${bbs.fbTime}</td>
						<td>${bbs.bhit}</td>
					</tr>
				</c:if> 
				<c:if test="${empty sessionScope.loginId}">
					<tr>
						<td>${bbs.fbNo}</td>
						<td><a href="javascript:showAlert();">${bbs.title}</a></td>
						<td>${bbs.id}</td>
						<td>${bbs.fbTime}</td>
						<td>${bbs.bhit}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="필터링검색"/>
	<c:if test="${not empty sessionScope.loginId}">
	<button onclick="location.href='fwrite.go'">글쓰기</button>
	</c:if>
</body>
<script>

	function showAlert() {
		alert("로그인이 필요한 페이지입니다.");
	}

	//선택이 안 됐다고 value가 null은 아닌가봐
	var count = 0;
	$('.fbutton').click(function(){
		if(count == 0){
			alert('대분류는 필수 선택 항목입니다.');
		}
	})
	
	$('input[name="bhobby"]').click(function(){
		count = 1;
	var content='';
	var val = $(this).val();
	console.log(val);
	
	 if(val == '운동'){
		 content += '<input type="checkbox" name="mhobby" value="헬스">헬스';
		 content += '<input type="checkbox" name="mhobby" value="축구">축구'; 
         content += '<input type="checkbox" name="mhobby" value="야구">야구';
         content += '<input type="checkbox" name="mhobby" value="풋살">풋살';
         content += '<input type="checkbox" name="mhobby" value="탁구">탁구';
         content += '<input type="checkbox" name="mhobby" value="골프">골프';
         content += '<input type="checkbox" name="mhobby" value="테니스">테니스';
      }
      
      else if(val == '맛집'){
         content += '<input type="checkbox" name="mhobby" value="식사">식사';
         content += '<input type="checkbox" name="mhobby" value="술">술';
         content += '<input type="checkbox" name="mhobby" value="카페">카페';
      }
      
      else if(val == '반려동물'){
         content += '<input type="checkbox" name="mhobby" value="산책">산책';
         content += '<input type="checkbox" name="mhobby" value="쇼핑">쇼핑';
         content += '<input type="checkbox" name="mhobby" value="미용">미용';
      }
      
      else{
         content += '<input type="checkbox" name="mhobby" value="영화">영화';
         content += '<input type="checkbox" name="mhobby" value="게임">게임';
         content += '<input type="checkbox" name="mhobby" value="노래방">노래방';
         content += '<input type="checkbox" name="mhobby" value="보드게임">보드게임';
         content += '<input type="checkbox" name="mhobby" value="방탈출">방탈출';
      }

	$('.mhobby').html(content);
	});
</script>
</html>