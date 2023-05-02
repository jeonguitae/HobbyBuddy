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

	button[id="gcreate"]{
		margin-bottom: 5px
	}
</style>

<script type="text/javascript">

	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("date");
		bir.value = today;
	}
	
</script>

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
					<th>인원 수</th>
					<td>
						<input type="text" name="participant" value=""/>
					</td>
				</tr>
				
				<tr>
					<th>약속 날짜</th>
					<td>
						<input type="date" id="date" name="date">
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input type="submit" value="검색"/>
					</th>
				</tr>
			</table>
		</form>
	</div>
	
	<button onclick="location.href='gwrite.go'" id="gcreate">모임 생성하기</button>
	
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
	$('input[name="bhobby"]').click(function(){
		
		var content = '';
		var val = $(this).val();
		console.log(val);
		
		if(val == '운동'){
			content += '<input type="checkbox" name="mhobby" value="축구">축구';
			content += '<input type="checkbox" name="mhobby" value="헬스">헬스';
			content += '<input type="checkbox" name="mhobby" value="야구">야구';
			content += '<input type="checkbox" name="mhobby" value="골프">골프';
			content += '<input type="checkbox" name="mhobby" value="테니스">테니스';
		}
		
		else if(val == '맛집'){
			content += '<input type="checkbox" name="mhobby" value="한식">한식';
			content += '<input type="checkbox" name="mhobby" value="중식">중식';
			content += '<input type="checkbox" name="mhobby" value="양식">양식';
			content += '<input type="checkbox" name="mhobby" value="양식">일식';
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
	
	$('select[name="city"]').on('change',function(){
		var val = $(this).val();
		var content = '';
		
		if(val == '서울특별시'){
			content += '<option value="종로구">종로구</option>';
			content += '<option value="중구">중구</option>';
			content += '<option value="용산구">용산구</option>';
			content += '<option value="성동구">성동구</option>';
			content += '<option value="광진구">광진구</option>';
			content += '<option value="동대문구">동대문구</option>';
			content += '<option value="중랑구">중랑구</option>';
			content += '<option value="성북구">성북구</option>';
			content += '<option value="강북구">강북구</option>';
			content += '<option value="도봉구">도봉구</option>';
			content += '<option value="노원구">노원구</option>';
			content += '<option value="은평구">은평구</option>';
			content += '<option value="서대문구">서대문구</option>';
			content += '<option value="마포구">마포구</option>';
			content += '<option value="양천구">양천구</option>';
			content += '<option value="강서구">강서구</option>';
			content += '<option value="구로구">구로구</option>';
			content += '<option value="금천구">금천구</option>';
			content += '<option value="영등포구">영등포구</option>';
			content += '<option value="동작구">동작구</option>';
			content += '<option value="관악구">관악구</option>';
			content += '<option value="서초구">서초구</option>';
			content += '<option value="강남구">강남구</option>';
			content += '<option value="송파구">송파구</option>';
			content += '<option value="강동구">강동구</option>';
		}
		
		else if(val == '인천광역시'){
			content += '<option value="강화군">강화군</option>';
			content += '<option value="계양구">계양구</option>';
			content += '<option value="남동구">남동구</option>';
			content += '<option value="동구">동구</option>';
			content += '<option value="미추홀구">미추홀구</option>';
			content += '<option value="부평구">부평구</option>';
			content += '<option value="서구">서구</option>';
			content += '<option value="연수구">연수구</option>';
			content += '<option value="옹진군">옹진군</option>';
			content += '<option value="중구">중구</option>';
		}
		
		else if(val == '경기도'){
			content += '<option value="수원시">수원시</option>';
			content += '<option value="성남시">성남시</option>';
			content += '<option value="안양시">안양시</option>';
			content += '<option value="고양시">고양시</option>';
			content += '<option value="부천시">부천시</option>';
			content += '<option value="안산시">안산시</option>';
			content += '<option value="의정부시">의정부시</option>';
			content += '<option value="파주시">파주시</option>';
			content += '<option value="양주시">양주시</option>';
			content += '<option value="동두천시">동두천시</option>';
			content += '<option value="의왕시">의왕시</option>';
			content += '<option value="군포시">군포시</option>';
			content += '<option value="시흥시">시흥시</option>';
			content += '<option value="화성시">화성시</option>';
			content += '<option value="오산시">오산시</option>';
			content += '<option value="안성시">안성시</option>';
			content += '<option value="김포시">김포시</option>';
			content += '<option value="구리시">구리시</option>';
			content += '<option value="남양주시">남양주시</option>';
			content += '<option value="광주시">광주시</option>';
			content += '<option value="이천시">이천시</option>';
			content += '<option value="포천시">포천시</option>';
			content += '<option value="용인시">용인시</option>';
			content += '<option value="광명시">용인시</option>';
			content += '<option value="과천시">과천시</option>';
			content += '<option value="하남시">하남시</option>';
			content += '<option value="평택시">평택시</option>';
			content += '<option value="가평군">가평군</option>';
			content += '<option value="양평군">양평군</option>';
			content += '<option value="여주군">여주군</option>';
			content += '<option value="연천군">연천군</option>';
		}
		
		else if(val == '부산광역시'){
			content += '<option value="강서구">강서구</option>';
			content += '<option value="북구">북구</option>';
			content += '<option value="금정구">금정구</option>';
			content += '<option value="기장군">기장군</option>';
			content += '<option value="사상구">사상구</option>';
			content += '<option value="부산진구">부산진구</option>';
			content += '<option value="연제구">연제구</option>';
			content += '<option value="동래구">동래구</option>';
			content += '<option value="해운대구">해운대구</option>';
			content += '<option value="수영구">수영구</option>';
			content += '<option value="남구">남구</option>';
			content += '<option value="동구">동구</option>';
			content += '<option value="서구">서구</option>';
			content += '<option value="사하구">사하구</option>';
			content += '<option value="중구">구중구</option>';
			content += '<option value="영도구">영도구</option>';
		}
		
		else if(val == '대구광역시'){
			content += '<option value="달성군">달성군</option>';
			content += '<option value="북구">북구</option>';
			content += '<option value="동구">동구</option>';
			content += '<option value="서구">서구</option>';
			content += '<option value="중구">중구</option>';
			content += '<option value="달서구">달서구</option>';
			content += '<option value="남구">남구</option>';
			content += '<option value="수성구">수성구</option>';
		}
		
		else if(val == '대전광역시'){
			content += '<option value="대덕구">대덕구</option>';
			content += '<option value="유성구">유성구</option>';
			content += '<option value="동구">동구</option>';
			content += '<option value="서구">서구</option>';
			content += '<option value="중구">중구</option>';
		}
		
		else if(val == '광주광역시'){
			content += '<option value="광산구">대덕구</option>';
			content += '<option value="북구">북구</option>';
			content += '<option value="동구">동구</option>';
			content += '<option value="서구">서구</option>';
			content += '<option value="남구">남구</option>';
		}
		
		else if(val == '울산광역시'){
			content += '<option value="울주군">울주군</option>';
			content += '<option value="북구">북구</option>';
			content += '<option value="동구">동구</option>';
			content += '<option value="서구">서구</option>';
			content += '<option value="중구">중구</option>';
		}
		
		else if(val == '세종특별자치시'){
			content += '<option value="소정면">울주군</option>';
			content += '<option value="전의면">북구</option>';
			content += '<option value="전동면">동구</option>';
			content += '<option value="조치원읍">서구</option>';
			content += '<option value="연서면">중구</option>';
			content += '<option value="연기면">울주군</option>';
			content += '<option value="장군면">북구</option>';
			content += '<option value="연동면">동구</option>';
			content += '<option value="부강읍">서구</option>';
			content += '<option value="금남면">중구</option>';
		}
		
		else if(val == '강원도'){
			content += '<option value="철원군">철원군</option>';
			content += '<option value="화천군">화천군</option>';
			content += '<option value="양구군">양구군</option>';
			content += '<option value="고성군">고성군</option>';
			content += '<option value="속초시">속초시</option>';
			content += '<option value="인제군">인제군</option>';
			content += '<option value="춘천시">춘천시</option>';
			content += '<option value="홍천군">홍천군</option>';
			content += '<option value="양양군">양양군</option>';
			content += '<option value="강릉시">강릉시</option>';
			content += '<option value="횡성군">횡성군</option>';
			content += '<option value="원주시">원주시</option>';
			content += '<option value="정선군">정선군</option>';
			content += '<option value="동해시">동해시</option>';
			content += '<option value="영월군">영월군</option>';
			content += '<option value="삼척시">삼척시</option>';
			content += '<option value="태백시">태백시</option>';
		}
		
		else if(val == '충청북도'){
			content += '<option value="충주시">충주시</option>';
			content += '<option value="제천시">제천시</option>';
			content += '<option value="음성군">음성군</option>';
			content += '<option value="진천군">진천군</option>';
			content += '<option value="증평군">증평군</option>';
			content += '<option value="괴산군">괴산군</option>';
			content += '<option value="단양군">단양군</option>';
			content += '<option value="청주시">청주시</option>';
			content += '<option value="상당구">상당구</option>';
			content += '<option value="흥덕구">흥덕구</option>';
			content += '<option value="서원구">서원구</option>';
			content += '<option value="보은군">보은군</option>';
			content += '<option value="옥천군">옥천군</option>';
			content += '<option value="영동군">영동군</option>';
		}
		
		else if(val == '충청남도'){
			content += '<option value="태안군">태안군</option>';
			content += '<option value="당진시">당진시</option>';
			content += '<option value="서산군">서산군</option>';
			content += '<option value="아산군">아산군</option>';
			content += '<option value="천안군">천안군</option>';
			content += '<option value="예산군">예산군</option>';
			content += '<option value="홍성군">홍성군</option>';
			content += '<option value="청양군">청양군</option>';
			content += '<option value="공주시">공주시</option>';
			content += '<option value="보령시">보령시</option>';
			content += '<option value="부여군">부여군</option>';
			content += '<option value="계룡시">계룡시</option>';
			content += '<option value="논산시">논산시</option>';
			content += '<option value="서천군">서천군</option>';
			content += '<option value="금산군">금산군</option>';
		}
		
		else if(val == '전라북도'){
			content += '<option value="신덕면">신덕면</option>';
			content += '<option value="관촌면">관촌면</option>';
			content += '<option value="성수면">성수면</option>';
			content += '<option value="신평면">신평면</option>';
			content += '<option value="운암면">운암면</option>';
			content += '<option value="임실읍">임실읍</option>';
			content += '<option value="청웅면">청웅면</option>';
			content += '<option value="강진면">강진면</option>';
			content += '<option value="덕치면">덕치면</option>';
			content += '<option value="삼계면">삼계면</option>';
			content += '<option value="오수면">오수면</option>';
			content += '<option value="지사면">지사면</option>';
		}
		
		else if(val == '전라남도'){
			content += '<option value="장성군">장성군</option>';
			content += '<option value="담양군">담양군</option>';
			content += '<option value="곡성군">곡성군</option>';
			content += '<option value="구례군">구례군</option>';
			content += '<option value="순천시">순천시</option>';
			content += '<option value="화순군">화순군</option>';
			content += '<option value="나주시">나주시</option>';
			content += '<option value="함평군">함평군</option>';
			content += '<option value="영광군">영광군</option>';
			content += '<option value="목포시">목포시</option>';
			content += '<option value="신안군">신안군</option>';
			content += '<option value="영암군">영암군</option>';
			content += '<option value="장흥군">장흥군</option>';
			content += '<option value="보성군">보성군</option>';
			content += '<option value="여수시">여수시</option>';
			content += '<option value="고흥군">고흥군</option>';
			content += '<option value="완도군">완도군</option>';
			content += '<option value="해남군">해남군</option>';
			content += '<option value="진도군">진도군</option>';
			content += '<option value="무안군">무안군</option>';
			content += '<option value="광양시">광양시</option>';
		}

		else if(val == '경상북도'){
			content += '<option value="울릉군">울릉군</option>';
			content += '<option value="독도">독도</option>';
			content += '<option value="울진군">울진군</option>';
			content += '<option value="영양군">영양군</option>';
			content += '<option value="봉화군">봉화군</option>';
			content += '<option value="영주시">영주시</option>';
			content += '<option value="안동시">안동시</option>';
			content += '<option value="예천군">예천군</option>';
			content += '<option value="문경시">문경시</option>';
			content += '<option value="상주시">상주시</option>';
			content += '<option value="의성군">의성군</option>';
			content += '<option value="청송군">청송군</option>';
			content += '<option value="영덕군">영덕군</option>';
			content += '<option value="포항시">포항시</option>';
			content += '<option value="군위군">군위군</option>';
			content += '<option value="구미시">구미시</option>';
			content += '<option value="김천시">김천시</option>';
			content += '<option value="칠곡군">칠곡군</option>';
			content += '<option value="영천시">영천시</option>';
			content += '<option value="성주군">성주군</option>';
			content += '<option value="경산시">경산시</option>';
			content += '<option value="경주시">경주시</option>';
			content += '<option value="청도군">청도군</option>';
			content += '<option value="고령군">고령군</option>';
		}
		
		else if(val == '경상남도'){
			content += '<option value="거창군">거창군</option>';
			content += '<option value="함양군">함양군</option>';
			content += '<option value="합천군">합천군</option>';
			content += '<option value="산청군">산청군</option>';
			content += '<option value="창녕군">창녕군</option>';
			content += '<option value="밀양시">밀양시</option>';
			content += '<option value="양산시">양산시</option>';
			content += '<option value="김해시">김해시</option>';
			content += '<option value="창원시">창원시</option>';
			content += '<option value="함안군">함안군</option>';
			content += '<option value="의령군">의령군</option>';
			content += '<option value="산청군">산청군</option>';
			content += '<option value="하동군">하동군</option>';
			content += '<option value="진주시">진주시</option>';
			content += '<option value="마산시">마산시</option>';
			content += '<option value="진해시">진해시</option>';
			content += '<option value="고성군">고성군</option>';
			content += '<option value="남해군">남해군</option>';
			content += '<option value="통영시">통영시</option>';
			content += '<option value="거제시">거제시</option>';
		}
		
		else{
			content += '<option value="제주시">제주시</option>';
			content += '<option value="서귀포시">서귀포시</option>';
		}
		$('select[name="area"]').html(content);
	});
</script>
</html>