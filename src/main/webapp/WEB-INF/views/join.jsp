<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
               <input type="text" id="id"/>
                <button id="overlay">중복체크</button>
            </td>
		</tr>
		<tr>
			<th>비밀번호</th>
            <td><input type="password" id="pw"/></td>
		</tr>
         <tr>
            <th>비밀번호 확인</th>
            <td>
            	<input type="password" id="confirm"/>
            	<span id="msg"></span>
            </td> 
         </tr>
         <tr>
            <th>이름</th>
            <td><input type="text" id="name"/></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><input type="email" id="email"/></td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td><input type="number" id="phone"/></td>
         </tr>
         <tr>
            <th>나이</th>
            <td><input type="number" id="age"/></td>
         </tr>
         <tr>
            <th>성별</th>
            <td>
            	<input type="radio" name="gender" value="남"/>남자
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="radio" name="gender" value="여"/>여자
            </td>
         </tr>
         <tr>
            <th>*지역</th> 
            <td>
                <select id="city">
                	<option>시-도 선택</option>
					<c:forEach items="${city}" var="c">
						<option value="${c.city}">${c.city}</option>		
					</c:forEach>
				</select>
				<select id="area">
               </select>
            </td>
         </tr>
         <tr>
            <th>자기 소개</th>
            <td><textarea id="intr"></textarea></td>
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
            <td><input type="text" id="chkresp"/></td>
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
	      }else if ($chkresp.val()==''){
	          alert('답변을 선택해 주세요!');             
	      } else{    
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
</script>
</html>
