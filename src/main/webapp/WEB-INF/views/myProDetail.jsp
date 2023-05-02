<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<th>매너온도</th>
			<td><input type="number" id="mannertp"/></td>
		</tr>
		<tr>
			<th>본인확인질문</th>
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
				<input id="yes" type="radio" name="random" value="1"/>남자
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="no" type="radio" name="random" value="0"/>여자
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
			<input type="button" onclick="location.href='./prodetailUpdate.go?id=${prodetail.id}'" value="수정"/>
			</th>
		</tr>
	</table>	
</body>
<script>
	$.ajax({
		type:'get',
		url:'myProDetail.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data);
			$('#id').value(data.id);
			$('#name').value(data.name);
			$('#email').value(data.email);
			$('#phone').value(data.phone);
			$('#age').value(data.age);
			$('#mannertp').value(data.mannertp);
			$('#chkreq').value(data.chkreq);
			$('#chkresp').value(data.chkresp);
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
</script>
</html>