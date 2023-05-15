<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">
<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   button {
      margin: 5px;
   }
   table{
      width: 500px;
   }
   input[type="text"]{
      width: 100%;
   }
   input[type="number"]{
      width: 100%;
   }
   textarea{
      width: 100%;
      height: 150px;
      resize: none;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>회원가입</h3>
	<table>
		<tr>
			<th>아이디</th>
            <td>
               <input type="text" id="id" placeholder="아이디를 입력해주세요 !"/>
                <button id="overlay">중복체크</button>
            </td>
		</tr>
		<tr>
			<th>비밀번호</th>
            <td><input type="password" id="pw" placeholder="비밀번호를 입력해주세요 !"/></td>
		</tr>
         <tr>
            <th>비밀번호 확인</th>
            <td>
            	<input type="password" id="confirm" placeholder="비밀번호 확인 !"/>
            	<span id="msg"></span>
            </td> 
         </tr>
         <tr>
            <th>이름</th>
            <td><input type="text" id="name" placeholder="이름을 입력해주세요 !"/></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><input type="email" id="email" placeholder="이메일을 입력해주세요 !"/></td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td><input type="number" id="phone" placeholder=" - 를 제외하고 번호를 입력해주세요 !"/></td>
         </tr>
         <tr>
            <th>나이</th>
            <td><input type="number" id="age" placeholder="나이를 입력해주세요 !"/></td>
         </tr>
         <tr>
            <th>성별</th>
            <td>
            	<input type="radio" name="gender" value="남성"/>남성
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="radio" name="gender" value="여성"/>여성
            </td>
         </tr>
         <tr>
               <th>지역</th>
               <td>
                  <select id="city" name="city">
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
               
                  <select id="area" name="area">
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
            <th>자기 소개</th>
            <td><textarea id="intr" placeholder="자기소개를 입력해주세요 !"></textarea></td>
         </tr>
         <tr>
            <th>본인확인 질문</th>
            <td>
            	<select id="chkreq">
	            	<option value="가장 좋아하는 물건은?">가장 좋아하는 물건은?</option>
	                <option value="가장 좋아하는 장소는?">가장 좋아하는 장소는?</option>
	                <option value="어머니의 고향은?">어머니의 고향은?</option>
	                <option value="아버지의 고향은?">아버지의 고향은?</option>                  
               </select>
            </td>
         </tr>   
         <tr>
            <th>본인확인 답변</th> 
            <td><input type="text" id="chkresp" placeholder="본인확인 답변을 입력해주세요 !"/></td>
         </tr>
		<tr>
			<th>랜덤매칭 동의여부</th>
            <td>
            <input type="radio" name="random" value="1"/>동의
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="random" value="0"/>미동의
           </td>
        </tr>
		<tr>
            <th colspan="2">
            	<button onclick="join()">회원가입</button>
            </th>            
		</tr>
	</table>   
</body>
<script>
	var pweq = false;
	var overlayChk = false;
	//pweq && overlayChk
	function join(){
	   console.log("회원가입");
	   if(pweq && overlayChk){         
	      var $id = $('#id');
	      var $pw = $('#pw');
	      var $name =$('#name');
	      var $email = $('#email'); 
	      var $phone = $('#phone'); 
	      var $age = $('#age');
	      var $gender = $('input[name="gender"]:checked');
	      var $city = $('#city'); 
	      var $area = $('#area'); 
	      var $intr = $('#intr'); 
	      var $chkreq = $('#chkreq'); 
	      var $chkresp = $('#chkresp');
	      var $random = $('input[name="random"]:checked');
	      
	      if($id.val()==''){
	         alert('아이디를 입력해 주세요!');
	      } else if ($pw.val()==''){
	         alert('비밀번호를 입력해 주세요!');
	      }else if ($name.val()==''){
	         alert('이름을 입력해 주세요!');
	      }else if ($email.val()==''){
	          alert('이메일을 입력해 주세요!');
	      }else if ($phone.val()==''){
	          alert('폰 번호를 입력해 주세요!');
	      }else if ($age.val()==''){
	         alert('나이를 입력해 주세요!');
	      }else if ($gender.val()==null){
	          alert('성별을 선택해 주세요!');             
	      }else if ($city.val()==''){
	          alert('시-도를 입력해 주세요!');             
	      }else if ($area.val()==''){
	          alert('지역을 입력해 주세요!');             
	      }else if ($intr.val()==''){
	          alert('자기소개를 입력해 주세요!');             
	      }else if ($chkreq.val()==''){
	          alert('질문을 선택해 주세요!');             
	      }else if ($chkresp.val()==''){
	          alert('답변을 선택해 주세요!');             
	      }else if ($random.val()==null){
	          alert('랜덤매칭여부를 선택해 주세요!');             
	      }else{    
	         var param = {};
	         param.id = $id.val();
	         param.pw = $pw.val();
	         param.name = $name.val();
	         param.email = $email.val();
	         param.phone = $phone.val();
	         param.age = $age.val();
	         param.gender = $gender.val();
	         param.city = $city.val();
	         param.area = $area.val();
	         param.intr = $intr.val();
	         param.chkreq = $chkreq.val();
	         param.chkresp = $chkresp.val();
	         param.random = $random.val();
	                    
	         console.log(param);            
	         $.ajax({
	              type: 'post'
	              ,url: 'join.ajax'
	              ,data:param
	              ,dataType:'json'
	              ,success:function(data){
	                 console.log(data);
	                 if(data.success==1){
	                    alert('회원가입 성공');
	                    location.href='./';
	                 }else{
	                    alert('회원가입 실패');
	                 }
	              }
	              ,error:function(e){
	                 console.log(e);
	                 alert('회원가입 실패');
	              }
	          });
	      }             
	   } else {
	      alert('아이디 중복 체크 또는 비밀번호를 확인해주세요.');
	   }
	}
	
	$('#overlay').on('click', function(e){
	   var chkId = $('#id').val();      
	   console.log("중복체크 요청 : " + chkId);      
	   $.ajax({
	      type: 'get'
	      ,url: 'overlay.ajax'
	      ,data:{'id':chkId}
	      ,dataType:'json'
	      ,success:function(data){
	         console.log(data);
	         if(data.overlay==0){
	            alert('사용 가능한 아이디 입니다.');
	            overlayChk=true;
	         } else {
	            alert('이미 사용중인 아이디 입니다.');
	            $('#id').val('');
	         }
	      }
	      ,error:function(e){
	         console.log(e);
	      }
	   });      
	});   
	
	$('#confirm').on('keyup',function(e){
	   if($('#pw').val() == $(this).val()){
	      $('#msg').css({'font-size': '10px', 'color': 'darkgreen' })
	      $('#msg').html('비밀번호가 일치 합니다.');
	      pweq = true;
	   } else{
	      $('#msg').css({'font-size': '10px', 'color': 'red' })
	      $('#msg').html('비밀번호가 일치 하지 않습니다.');
	   }      
	});
	/*
	$('#city').on('change', function(e){
		   var city = $('#city').val();      
		   console.log("city ? " + city);      
		   $.ajax({
		      type: 'get'
		      ,url: 'city.ajax'
		      ,data:{'city':city}
		      ,dataType:'json'
		      ,success:function(data){
		         console.log("data : " + data.area);
		         if(data != ""){
		        	 console.log("지역 호출");
		        	 areaDraw(data.area);
		         } else {
		            alert('오류가 발생하였습니다.');
		         }
		      }
		      ,error:function(e){
		         console.log(e);
		      }
		   });      
		})
	function areaDraw(area){
	console.log(area);
	var content = '';
	area.forEach(function(item,index){
		content +='<option value="'+item.area+'">'+item.area+'</option>';
	});
	$('#area').empty();
	$('#area').append(content);
}
*/	
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
