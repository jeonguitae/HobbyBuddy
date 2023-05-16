<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}
</style>

</head>
<body>
<jsp:include page="gnb.jsp"/>
	<div class="profile">
		<form action="noNameList.do" method="get">
			<table>
				
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="남성" checked="checked"/>남성
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
			            <th>취미1</th>
				         <td>
				            <select name=big_hb1>
				               <c:forEach items="${big_hb}" var="b">
				                  <option value="${b.big_hb}">${b.big_hb}</option>      
				               </c:forEach>
				            </select>
				            <select name="small_hb1">
				           		 <option>x</option>
				            </select>
				           </td>
		      		</tr>
					
					 <tr>
			            <th>취미2</th>
				         <td>
				            <select name=big_hb2>
				               <c:forEach items="${big_hb}" var="b">
				                  <option value="${b.big_hb}">${b.big_hb}</option>      
				               </c:forEach>
				            </select>
				            <select name="small_hb2">
				           		 <option>x</option>
				            </select>
				           </td>
		      		</tr>
					
					 <tr>
			            <th>취미3</th>
				         <td>
				            <select name=big_hb3>
				               <c:forEach items="${big_hb}" var="b">
				                  <option value="${b.big_hb}">${b.big_hb}</option>      
				               </c:forEach>
				            </select>
				            <select name="small_hb3">
				           		 <option>x</option>
				            </select>
				           </td>
		      		</tr>

								
				<tr>
					<th colspan="2">
						<input type="submit" value="랜덤매칭"/>
					</th>
				</tr>			

			</table>
			
				<h3>
					조건을 설정 후 버튼을 클릭하여 취미를 함께 할 익명의 상대를 찾아보세요<br/>
					해당하는 회원을 랜덤으로 추천해드릴게요!
				</h3>

		</form>
	</div>
	
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>나이</th>
				<th>지역</th>
				<th>취미</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="member">
				<tr>
					<td><a href="nodetail.do?id=${member.id}">익명의 회원</a></td>
					<td>${member.age}</td>
					<td>${member.area}</td>
					<td>${member.small_hb}</td>
					<td>${member.gender}</td>
				</tr>			
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
	
/* 	function openPopup(memberId) {
	    var url = 'nodetail.do?id=' + memberId;
	    window.open(url, '_blank', 'width=1000,height=700');
	  } */
		
		
	var msg = "${msg}";
	if(msg != ""){
	   alert(msg);
	}
	
	var loginId = "${sessionScope.loginId}";   
	myHobbyList();
	function myHobbyList(){
	   
	   $.ajax({
	      type:'get',
	      url:'myHobbyList.ajax',
	      data:{id:loginId},
	      dataType:'json',
	      success:function(data){
	         console.log("data, myHobbyList : " + data.myHobbyList);
	         console.log("data, login : " + data.login);
	         if(!true){
	            alert('로그인이 필요한 서비스 입니다.');
	            location.href='./';
	         }else{
	         }
	      },
	      error:function(e){
	         console.log(e);
	      }
	   });   
	}
	
	
	
	$('select[name=big_hb1]').on('change', function(e){
	       var big_hb = $('select[name=big_hb1]').val();      
	       console.log("big_hb ? " + big_hb);      
	       $.ajax({
	          type: 'get'
	          ,url: 'big_hb.ajax'
	          ,data:{'big_hb':big_hb}
	          ,dataType:'json'
	          ,success:function(data){
	             console.log("big_hb data : " + data.small_hb);
	             if(data != ""){
	                console.log("big_hb 취미 호출");
	                small_hbDraw1(data.small_hb);
	             } else {
	                alert('오류가 발생하였습니다.');
	             }
	          }
	          ,error:function(e){
	             console.log(e);
	          }
	       });
	   })

	   function small_hbDraw1(small_hb){
	    console.log("small_hb : " + small_hb);
	    var content = '';
	    small_hb.forEach(function(item,index){
	       content +='<option value="'+item.small_hb+'">'+item.small_hb+'</option>';
	    });
	    $('select[name="small_hb1"]').empty();
	    $('select[name="small_hb1"]').append(content);
	   }
	
	$('select[name=big_hb2]').on('change', function(e){
	       var big_hb = $('select[name=big_hb2]').val();      
	       console.log("big_hb ? " + big_hb);      
	       $.ajax({
	          type: 'get'
	          ,url: 'big_hb.ajax'
	          ,data:{'big_hb':big_hb}
	          ,dataType:'json'
	          ,success:function(data){
	             console.log("big_hb data : " + data.small_hb);
	             if(data != ""){
	                console.log("big_hb 취미 호출");
	                small_hbDraw2(data.small_hb);
	             } else {
	                alert('오류가 발생하였습니다.');
	             }
	          }
	          ,error:function(e){
	             console.log(e);
	          }
	       });
	   })

	   function small_hbDraw2(small_hb){
	    console.log("small_hb : " + small_hb);
	    var content = '';
	    small_hb.forEach(function(item,index){
	       content +='<option value="'+item.small_hb+'">'+item.small_hb+'</option>';
	    });
	    $('select[name="small_hb2"]').empty();
	    $('select[name="small_hb2"]').append(content);
	   }
	
	$('select[name=big_hb3]').on('change', function(e){
	       var big_hb = $('select[name=big_hb3]').val();      
	       console.log("big_hb ? " + big_hb);      
	       $.ajax({
	          type: 'get'
	          ,url: 'big_hb.ajax'
	          ,data:{'big_hb':big_hb}
	          ,dataType:'json'
	          ,success:function(data){
	             console.log("big_hb data : " + data.small_hb);
	             if(data != ""){
	                console.log("big_hb 취미 호출");
	                small_hbDraw3(data.small_hb);
	             } else {
	                alert('오류가 발생하였습니다.');
	             }
	          }
	          ,error:function(e){
	             console.log(e);
	          }
	       });
	   })

	   function small_hbDraw3(small_hb){
	    console.log("small_hb : " + small_hb);
	    var content = '';
	    small_hb.forEach(function(item,index){
	       content +='<option value="'+item.small_hb+'">'+item.small_hb+'</option>';
	    });
	    $('select[name="small_hb3"]').empty();
	    $('select[name="small_hb3"]').append(content);
	   }

	
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