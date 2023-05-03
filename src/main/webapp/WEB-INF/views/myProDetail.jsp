<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, tr, td{
	 border: 1px solid black;
	 border-collapse: collapse;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" value="" readonly/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="name" value=""/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" id="email"/></td>
		</tr>
		<tr>
			<th>폰 번호</th>
			<td><input type="number" id="phone"/></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="number" id="age"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>			
				<input id="male" type="radio" name="gender" value="남"/>남자
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="female" type="radio" name="gender" value="여"/>여자
			</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>
                <select id="city">
                	<option name="city" value=""></option>
					<c:forEach items="${city}" var="c">
						<option value="${c.city}">${c.city}</option>		
					</c:forEach>
				</select>
				<select id="area">
					<option name="area" value=""></option>
               </select>
            </td>			
		</tr>
		<tr>
			<th>매너온도</th>
			<td><input type="number" id="mannertp" readonly/></td>
		</tr>
		<tr>
			<th>본인확인질문</th>
			<td>
				<select id="chkreq">
					<option name="chkreq" value=""></option>
	            	<option value="가장 좋아하는 물건은?">가장 좋아하는 물건은?</option>
	                <option value="가장 좋아하는 장소는?">가장 좋아하는 장소는?</option>
	                <option value="어머니의 고향은?">어머니의 고향은?</option>
	                <option value="아버지의 고향은?">아버지의 고향은?</option>                  
               </select>
            </td>
		</tr>
		<tr>
			<th>본인확인답변</th>
			<td><input type="text" id="chkresp"/></td>
		</tr>
		<tr>
			<th>자기소개</th>
			<td><textarea id="intr"></textarea></td>
		</tr>
		<tr>
			<th>랜덤매칭여부</th>
			<td>
				<input id="yes" type="radio" name="random" value="1"/>동의
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="no" type="radio" name="random" value="0"/>미동의
			</td>
		</tr>
		<c:if test="${prodetail.new_file_name ne null}">
			<tr>
				<th>프로필 사진</th>
				<td><img width="300" src="/photo/${prodetail.newFileName}"/></td>
			</tr>
		</c:if>
		<tr>
			<th colspan="2">
			<button onclick="memberUpdate()">수정하기</button>
			<button id="dropOut">중복체크</button>
			</th>
		</tr>
	</table>	

</style>
</head>
<body>

</head>
<body>
</body>
<script>
	$.ajax({
		type:'get',
		url:'myProDetail.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data.id);
			$('input[id="id"]').attr('value',data.id);
			$('input[id="name"]').attr('value',data.name);
			$('input[id="email"]').attr('value',data.email);
			$('input[id="phone"]').attr('value',data.phone);
			$('input[id="age"]').attr('value',data.age);
			$('option[name="city"]').attr('value',data.city);
			$('option[name="city"]').html(data.city);
			$('option[name="area"]').attr('value',data.area);
			$('option[name="area"]').html(data.area);
			$('input[id="mannertp"]').attr('value',data.mannertp);
			$('option[name="chkreq"]').attr('value',data.chkreq);
			$('option[name="chkreq"]').html(data.chkreq);
			$('input[id="chkresp"]').attr('value',data.chkresp);
			$('#intr').html(data.intr);
			
			
			
			if(data.gender == '남'){
				//attr : 정지된 속성
				//prop : 동적인 속성(만들어진 요소)
				$('#male').prop('checked',true);
			}else{
				$('#female').prop('checked',true);
			}
			
			if(data.random == '1'){
				$('#yes').prop('checked',true);
			}else{
				$('#no').prop('checked',true);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
	
	function memberUpdate(){
		   console.log("myProDetail 수정하기");
		   if(true){         
		      var $id = $('#id');
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
		      } else if ($name.val()==''){
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
		              ,url: 'memberUpdate.ajax'
		              ,data:param
		              ,dataType:'json'
		              ,success:function(data){
		                 console.log(data);
		                 if(data.success==1){
		                    alert('수정 성공');
		                    location.href='./';
		                 }else{
		                    alert('수정 실패');
		                 }
		              }
		              ,error:function(e){
		                 console.log(e);
		                 alert('수정 실패');
		              }
		          });
		      }             
		   } else {
		      alert('오류 발생');
		   }
		}
	
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
		console.log("area ?" + area);
		var content = '';
		area.forEach(function(item,index){
			content +='<option value="'+item.area+'">'+item.area+'</option>';
		});
		$('#area').empty();
		$('#area').append(content);
	}
	
<<<<<<< HEAD
=======
	$('#dropOut').on('click', function(e){   
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
	


>>>>>>> origin/master
</script>
</html>