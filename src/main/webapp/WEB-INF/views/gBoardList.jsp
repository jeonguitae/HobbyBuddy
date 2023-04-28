<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}

</style>
</head>
<body>
	
	<div class="sort">
		<form action="sorting.do" method="get">
			<table>
				<tr>
					<th>대분류</th>
					<td class="bhobby">
						<input type="radio" name="bhobby" value="운동"/>운동
						<input type="radio" name="bhobby" value="맛집"/>맛집
						<input type="radio" name="bhobby" value="반려동물"/>반려동물
						<input type="radio" name="bhobby" value="여가"/>여가
					</td>
				</tr>
				
				<tr>
					<th>중분류</th>
					<td class="mhobby">
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="남성"/>남성
						<input type="radio" name="gender" value="여성"/>여성
						<input type="radio" name="gender" value="성별 무관"/>성별 무관
					</td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td>
						<input type="text" name="minage" value=""/> &nbsp; ~ &nbsp;
						<input type="text" name="maxage" value=""/>
					</td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td>
						<input type="text" name="minage" value=""/> &nbsp; ~ &nbsp;
						<input type="text" name="maxage" value=""/>
					</td>
				</tr>
				
				<tr>
					<th>지역</th>
					<td>
						<select id="city">
							   
						</select>
					
						<select id="area">
						
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="list">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0 }">
					<tr><th colspan="5">게시물이 없습니다.</th></tr>
				</c:if>
				<c:forEach items="${list}" var="bbs">
					<tr>
						<td>${bbs.idx}</td>
						<td><a href="detail.do?id=${bbs.idx}">${bbs.subject}</a></td>
						<td>${bbs.user_name}</td>
						<td>${bbs.bHit}</td>
						<td><a href="del.do?id=${bbs.idx}">삭제</a></td>
					</tr>			
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
	$('input[type="radio"]').click(function(){
		
		var content = '';
		var val = $(this).val();
		console.log(val);
		
		if(val == '운동'){
			content += '<input type="checkbox" value="축구">축구';
			content += '<input type="checkbox" value="헬스">헬스';
			content += '<input type="checkbox" value="야구">야구';
			content += '<input type="checkbox" value="골프">골프';
			content += '<input type="checkbox" value="테니스">테니스';
		}
		
		else if(val == '맛집'){
			content += '<input type="checkbox" value="한식">한식';
			content += '<input type="checkbox" value="중식">중식';
			content += '<input type="checkbox" value="양식">양식';
		}
		
		else if(val == '반려동물'){
			content += '<input type="checkbox" value="산책">산책';
			content += '<input type="checkbox" value="쇼핑">쇼핑';
			content += '<input type="checkbox" value="미용">미용';
		}
		
		else{
			content += '<input type="checkbox" value="영화">영화';
			content += '<input type="checkbox" value="게임">게임';
			content += '<input type="checkbox" value="노래방">노래방';
			content += '<input type="checkbox" value="보드게임">보드게임';
			content += '<input type="checkbox" value="방탈출">방탈출';
		}
		
		$('.mhobby').html(content);
	});
</script>
</html>