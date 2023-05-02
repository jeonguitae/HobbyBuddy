<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	button{
		margin: 5px;
	}
	table{
		width: 500px;
	}
</style>
</head>
<body>
	<form action="gupdate.do" method="post">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" value="${board.id}" readonly/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${board.subject}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content">${board.content}</textarea></td>
			</tr>
			<tr>
				<th>분류</th>
					<td>
						<select name="bhobby">
						    <option value="운동">운동</option>
						    <option value="맛집">맛집</option>
						    <option value="반려동물">반려동물</option>
						    <option value="여가">여가</option>
						</select>
					
						<select name="mhobby">
							<option value="축구">축구</option>
							<option value="헬스">헬스</option>
							<option value="야구">야구</option>
							<option value="골프">골프</option>
							<option value="테니스">테니스</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td>
						<input type="text" name="minage" value="${board.minage}"/> &nbsp; ~ &nbsp;
						<input type="text" name="maxage" value="${board.maxage}"/>
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
					<th>지역</th>
					<td>
						<select name="city">
						    <option value="서울특별시">서울특별시</option>
						    <option value="인천광역시">인천광역시</option>
						    <option value="경기도">경기도</option>
						    <option value="부산광역시">부산광역시</option>
						    <option value="대구광역시">대구광역시</option>
						    <option value="대전광역시">대전광역시</option>
						    <option value="광주광역시">광주광역시</option>
						    <option value="울산광역시">울산광역시</option>
						    <option value="세종특별자치시">세종특별자치시</option>
						    <option value="강원도">강원도</option>
						    <option value="충청북도">충청북도</option>
						    <option value="충청남도">충청남도</option>
						    <option value="전라북도">전라북도</option>
						    <option value="전라남도">전라남도</option>
						    <option value="경상북도">경상북도</option>
						    <option value="경상남도">경상남도</option>
						    <option value="제주특별자치도">제주특별자치도</option>
						</select>
					
						<select name="area">
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="용산구">용산구</option>
							<option value="성동구">성동구</option>
							<option value="광진구">광진구</option>
							<option value="동대문구">동대문구</option>
							<option value="중랑구">중랑구</option>
							<option value="성북구">성북구</option>
							<option value="강북구">강북구</option>
							<option value="도봉구">도봉구</option>
							<option value="노원구">노원구</option>
							<option value="은평구">은평구</option>
							<option value="서대문구">서대문구</option>
							<option value="마포구">마포구</option>
							<option value="양천구">양천구</option>
							<option value="강서구">강서구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="영등포구">영등포구</option>
							<option value="동작구">동작구</option>
							<option value="관악구">관악구</option>
							<option value="서초구">서초구</option>
							<option value="강남구">강남구</option>
							<option value="송파구">송파구</option>
							<option value="강동구">강동구</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>약속 날짜</th>
					<td>
						<input type="date" id="date" name="meeting_date" value="${board.meeting_date}">
					</td>
				</tr>
				
				<tr>
					<th>최대 인원</th>
					<td>
						<input type="range" name="maxmem" min="2" max="100" step="1" value=""/>
					</td>
				</tr>
				
				<tr>
					<th>메너온도</th>
					<td>
						<input type="range" name="mannertp" min="0" max="100" step="1" value=""/>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="저장"/>
					</td>
				</tr>
		</table>
			
	</form>
</body>
<script></script>
</html>