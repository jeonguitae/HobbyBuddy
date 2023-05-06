<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
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
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>비밀번호 수정</h3>
		<table>
			<tr>
				<th>현재 비밀번호</th>
				<td>
	            	<input type="password" id="nowPw"/>                     
	         	</td>
	      	</tr>
	      	<tr>
	        	 <th>새 비밀번호</th>
	        	 <td>
					<input type="password" id="changePw"/></br>        
	        	 </td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td>
					<input type="password" id="confirm"/></br>
	        	    <span id="pwMsg"></span>         
				</td>
			</tr>
	      	<tr>
				<th colspan="2">
					<button onclick="changePw()">확인</button>
					<button onclick="location.href='./mypage.go'">마이페이지 돌아가기</button>
				</th>
			</tr>
	   </table>
</body>
<script>
var nowPwChk = false;
var pweq = false;

function changePw(){
   
   if(nowPwChk && pweq){
      
      var $nowPw = $('#nowPw');
      var $changePw = $('#changePw').val();
      var $confirm = $('#confirm');
      
      if($nowPw.val()==''){
         alert('현재 비밀번호를 입력해주세요.')
      }else if($nowPw.val()==''){
         alert('새 비밀번호를 입력해주세요.')
      }else{
         
         $.ajax({
            type:'post'
            ,url:'changePw.ajax'
            ,data:{'changePw':$changePw}
            ,dataType:'json'
            ,success:function(data){
               console.log(data);
               console.log(data.success);
               if(data.success == 1){
                  alert('비밀번호 수정이 완료 되었습니다.');
                  location.href ='./mypage.go';
               }else{
                  alert('비밀번호 수정에 실패 했습니다.\r\n 다시 시도해 주세요');
               }
            },
            error:function(e){
               console.log(e);
               alert('오류가 발생 했습니다.\r\n 다시 시도해 주세요');
            }
         });         
      }      
   }else{
      alert('비밀번호 확인를 해주세요');
   }
}

$('#nowPw').on('keyup', function(e){
   var nowPw = $('#nowPw').val();  
   nowPwChk=false;
   
    $.ajax({
        type: 'get'
        ,url: 'overlayNowPw.ajax'
        ,data:{'nowPw':nowPw}
        ,dataType:'json'
        ,success:function(data){
           console.log(data);
           
           if(data.overlayNowPw != null) {                           
              nowPwChk=true;  
         }                      
      }
        ,error:function(e){
           console.log(e);
        }
     });  
});

   $('#confirm').on('keyup',function(e){  
	   pweq = false;
      if($('#changePw').val() == $('#confirm').val()){
         $('#pwMsg').css({'font-size': '10px','color': 'darkgreen'});
         $('#pwMsg').html('비밀번호가 일치 합니다.');
         pweq = true;
      }else{
         $('#pwMsg').css({'font-size':'10px','color': 'red'});
         $('#pwMsg').html('비밀번호가 일치 하지 않습니다');
      }      
   });
   

</script>
</html>