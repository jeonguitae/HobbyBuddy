<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
   <h3>로그인</h3>
   <table>
      <tr>
         <th>ID</th>
         <td><input type="text" id="id"></td>
      </tr>
      <tr>
         <th>PW</th>
         <td><input type="password" id="pw"></td>
      </tr>
      <tr>
         <th colspan="2">
            <button onclick="login()">login</button>
            <button onclick="location.href='join.go'">회원가입</button>
            <button onclick="location.href='idFind.go'">아이디 찾기</button>
            <button onclick="location.href='pwFind.go'">비밀번호 찾기</button>
         </th>         
      </tr>
   </table>
</body>
<script>
	function login(){
	   var id = $('#id').val();
	   var pw = $('#pw').val();
	   
	   console.log(id,pw);
	   $.ajax({
	      type:'post',
	      url : 'login.ajax',
	      data:{
	         id:$('#id').val(),
	         pw:$('#pw').val()
	      },
	      dataType:'json',
	      success : function(data){
	         console.log(data);
	         if (data.member != null) {
	            alert('로그인에 성공했습니다.');
	            
	            location.href='./';
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