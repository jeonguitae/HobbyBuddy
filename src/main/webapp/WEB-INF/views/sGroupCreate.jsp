<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
<form action="sgwrite.do" method="post">
		<table>
			<tr>
				<th>*작성자</th>
				<td><input type="text" name="id" readonly/></td>
			</tr>
			<tr>
				<th>*제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			
			<tr>
	         <td colspan="2">
	            <select name=big_hb>
	               <c:forEach items="${big_hb}" var="b">
	                  <option value="${b.big_hb}">${b.big_hb}</option>      
	               </c:forEach>
	            </select>
	            <select name="small_hb">
	           		 <option>x</option>
	            </select>
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
					<input type="date" id="date" name="meeting_date">
				</td>
			</tr>
			
			<tr>
				<th>최대 인원</th>
				<td>
					<input type="range" name="maxmem" min="2" max="100" step="1" value=""/>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="소모임 생성"/>
				</th>
			</tr>
		</table>
	</form>	
</body>
<script>
	myHobbyList();
	function myHobbyList(){
	   console.log("loginId : " + loginId);
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
	            myHobbyListDraw(data.myHobbyList);
	         }
	      },
	      error:function(e){
	         console.log(e);
	      }
	   });   
	}
	
	
	function myHobbyListDraw(myHobbyList){
	   console.log("myHobbyList : " + myHobbyList);
	   var content = '';
	   myHobbyList.forEach(function(item,index){
	      content += '<tr>';
	      content += '<td><input type="checkbox" value="'+item.my_hobby_no+'"/></td>';
	      content+='<td>'+item.big_hb + " / " + item.small_hb+'</td>';
	      content += '</tr>';
	      console.log(item.my_hobby_no);
	   });
	   
	   $('#myHobbyList').empty();
	   $('#myHobbyList').append(content);
	}
	
	$('select[name=big_hb]').on('change', function(e){
	    var big_hb = $('select[name=big_hb]').val();      
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
	             small_hbDraw(data.small_hb);
	          } else {
	             alert('오류가 발생하였습니다.');
	          }
	       }
	       ,error:function(e){
	          console.log(e);
	       }
	    });
	})
	
	function small_hbDraw(small_hb){
	 console.log("small_hb : " + small_hb);
	 var content = '';
	 small_hb.forEach(function(item,index){
	    content +='<option value="'+item.small_hb+'">'+item.small_hb+'</option>';
	 });
	 $('select[name="small_hb"]').empty();
	 $('select[name="small_hb"]').append(content);
	}
</script>
</html>