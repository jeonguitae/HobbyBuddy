<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>

  
   .liner{
   padding:10px;
   	width : 50%;
   	display: inline;
   	float: right;
   	display: inline-block; /* 변경된 부분 */
    vertical-align: top; /* 변경된 부분 */
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>	
		<table class="liner">
	      <thead>
	         <tr>
	            <td colspan="2">쪽지/프로필 신고 관리	            
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button onclick="location.href='report_msg_profileList.go'">신고 관리 가기</button></td>
	            
	         </tr>
	         <tr>
	            <td align="left">하비버디 관리자...
	            
	            
	            2022-04-23</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">자냐??</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">신고 제목</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">신고 제목</td>
	            
	         </tr>         
	      </thead>
	   </table>
	   
	   <table class="liner">
	      <thead>
	         <tr>
	            <td colspan="2">모임방 신고 관리 
	             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
	            
	            <button onclick="location.href='report_gboardList.go'">신고 관리 가기</button></td>
	            
	         </tr>
	         <tr>
	            <td align="left">하비버디 관리자...
	            
	            
	            2022-04-23</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">자냐??</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">신고 제목</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">신고 제목</td>
	            
	         </tr>         
	      </thead>
	   </table>
	   
	   <table class="liner">
	      <thead>
	         <tr>
	            <td colspan="2">자유게시판 신고 관리 
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	            <button onclick="location.href='report_fboardList.go'">신고 관리 가기</button></td>
	            
	         </tr>
	         <tr>
	            <td align="left">하비버디 관리자...
	            
	            
	            2022-04-23</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">자냐??</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">신고 제목</td>
	            
	         </tr>         
	         <tr>
	            <td align="left">신고 제목</td>
	            
	         </tr>         
	      </thead>
	   </table>  
   
   
   <table class="liner">
      <thead>
         <tr>
            <td colspan="2">회원 관리 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	 &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
            <button onclick="location.href='memberList.go'">리스트 보기</button></td>
            
         </tr>
         <tr>
            <td align="left">하비버디 관리자...
            
            
            2022-04-23</td>
            
         </tr>         
         <tr>
            <td align="left">자냐??</td>
            
         </tr>         
         <tr>
            <td align="left">신고 제목</td>
            
         </tr>         
         <tr>
            <td align="left">신고 제목</td>
            
         </tr>         
      </thead>
   </table>
   
   <table class="liner">
      <thead>
         <tr>
            <td colspan="2">비밀글 관리 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          	 &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <button onclick="location.href='secretList.go'">리스트 보기</button></td>
            
         </tr>
         <tr>
            <td align="left">하비버디 관리자...
            
            
            2022-04-23</td>
            
         </tr>         
         <tr>
            <td align="left">자냐??</td>
            
         </tr>         
         <tr>
            <td align="left">신고 제목</td>
            
         </tr>         
         <tr>
            <td align="left">신고 제목</td>
            
         </tr>         
      </thead>
   </table>   
   
   <table class="liner">
      <thead>
         <tr>
            <td colspan="2">공지사항 관리 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          	 &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <button onclick="location.href='noticeList.go'">리스트 보기</button></td>
            
         </tr>
         <tr>
            <td align="left">하비버디 관리자...
            
            
            2022-04-23</td>
            
         </tr>         
         <tr>
            <td align="left">자냐??</td>
            
         </tr>         
         <tr>
            <td align="left">신고 제목</td>
            
         </tr>         
         <tr>
            <td align="left">신고 제목</td>
            
         </tr>         
      </thead>
   </table>   
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

</script>
</html>