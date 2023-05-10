<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>취미 관리</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
   }

</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>마이페이지 : 취미 관리</h3>
	<table>    	
		<tr>
			<th colspan="2">나의 취미 목록</th>
		</tr>
		<tbody id="myHobbyList">		
		</tbody>
		<tr>
     		<th colspan="2">
				<button onclick="myHobbyDel()">취미삭제</button>
      		</th>         
		</tr>
		<tr>
			<th colspan="2">나의 취미 추가</th>
		</tr>
		<tr>
			<td colspan="2">
				<select id=big_hb>
					<c:forEach items="${big_hb}" var="b">
						<option value="${b.big_hb}">${b.big_hb}</option>		
					</c:forEach>
				</select>
				<select id="small_hb">
				<option>x</option>
           		</select>
        	</td>
		</tr>
  		<tr>
     		<th colspan="2">
        		<button onclick="hbPlus()">취미추가</button>
      		</th>         
		</tr>
		<tr>
     		<th colspan="2">
        		<button onclick="location.href='mypage.go'">마이페이지 돌아가기</button>
      		</th>         
		</tr>		
</table>



</body>
<script>

	var loginId = "${sessionScope.loginId}";	
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
				if(!data.login){
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
	
	function myHobbyDel(){
		var checkArr = [];
		$('input[type="checkbox"]:checked').each(function(idx,item){		
			//checkbox 에 value 를 지정하지 않으면 기본값을 on 으로 스스로 지정한다.
			if($(this).val()!='on'){
				console.log(idx,$(this).val());
				checkArr.push($(this).val());
			}	
		});
		console.log(checkArr);			
		$.ajax({
			type:'get',
			url:'myHobbyDel.ajax',
			data:{'myHobbyDelList':checkArr},
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.success){
					alert(data.msg);
					myHobbyList();
				}
			},
			error:function(e){
				console.log(e);
			}		
		});		
	}
	
	
	function hbPlus(){
		   var id = "${sessionScope.loginId}";
		   var big_hb = $('#big_hb').val();
		   var small_hb = $('#small_hb').val();

		   console.log(id,big_hb,small_hb);
		   $.ajax({
		      type:'get',
		      url : 'hbPlus.ajax',
		      data:{
		    	  id:"${sessionScope.loginId}",
		    	  big_hb:$('#big_hb').val(),
		    	  small_hb:$('#small_hb').val()
		      },
		      dataType:'json',
		      success:function(data){
	                 console.log("hbPlus : "+data);
	                 if(data.success==1){
	                    alert('취미등록 완료');
	                    location.href='myHobbyList.go';
	                 }else{
	                    alert('취미등록 실패');
	                 }
	          },
	          error:function(e){
	                 console.log(e);
	                 alert('취미등록 실패');
		         }
		      })
		   };
		
		
	$('#big_hb').on('change', function(e){
		   var big_hb = $('#big_hb').val();      
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
		$('#small_hb').empty();
		$('#small_hb').append(content);
	}
	
</script>
</html>