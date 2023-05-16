<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>비밀번호 확인</title>
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
   <h3>비밀번호 확인</h3>
   <table>
      <tr>
         <th>PW</th>
         <td><input type="password" id="pw" placeholder="비밀번호를 입력해주세요 !"></td>
      </tr>
      <tr>
         <th colspan="2">
            <button onclick="pwChk()">마이페이지 이동</button>
         </th>         
      </tr>
   </table>
</body>
<script>
	function pwChk(){
	   var pw = $('#pw').val();
	   
	   console.log(pw);
	   $.ajax({
	      type:'post',
	      url : 'pwChk.ajax',
	      data:{
	         pw:$('#pw').val()
	      },
	      dataType:'json',
	      success : function(data){
	         console.log(data);
	         if (data.member!= null) {
	            location.href='./mypage.go';
	         }else{
	            alert('아이디 또는 비밀번호를 확인해주세요.');
	         }
	      },
	      error:function(e){
	         console.log(e);
	         alert('아이디 또는 비밀번호를 확인해주세요.');
	      }
	   });
	   
	}
</script>
</html>