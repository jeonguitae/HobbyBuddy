<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
   
   <form action="myp.do" method="post">
      <table>
      
         <tr>
            <th>ID</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.id}&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
        
         <tr>
            <th>이름</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
         
         <tr>
            <th>나이</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.age}&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
         
         <tr>
            <th>성별</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.gender}&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
         
         <tr>
            <th>지역</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.area}&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
         
         <tr>
            <th>취미</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
         
         <tr>
            <th>자기소개</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.intr}&nbsp;&nbsp;&nbsp;&nbsp;</td>
         </tr>
         
         <tr>
            <th>
               <input type="submit" value="즐겨찾기"/>
            </th>
            <th>
               <input type="submit" value="쪽지 보내기"/>
            </th>
            <th>
               <input type="button" value="프로필 신고" onclick="location.href='./report.go'"/>
            </th>
            <th>
               <input type="button" value="뒤로가기" onclick="location.href='./'"/>
            </th>
         </tr>
      </table>
   </form>
</body>
<script>
</script>
</html>