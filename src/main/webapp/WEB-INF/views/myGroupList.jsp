<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>참여중인 모임 방</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
<jsp:include page="gnb.jsp"/>

<table>
    <thead>
       <tr>
          <th>글 번호</th>
          <th>취미</th>
          <th>지역</th>
          <th>모임날짜</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>조회</th>
       </tr>
    </thead>
    <tbody>
       <c:if test="${list.size() == 0}">
          <tr><th colspan="5">게시물이 없습니다.</th></tr>
       </c:if>
       <c:forEach items="${list}" var="bbs">
          <tr>
             <td>${bbs.gidx}</td>
             <td>${bbs.small_hb}</td>
             <td>${bbs.area}</td>
             <td>${bbs.meeting_date}</td>
             <td><a href="openchat.go?gidx=${bbs.gidx}">${bbs.subject}</a></td>
             <td>${bbs.id}</td>
             <td>${bbs.reg_date}</td>
             <td>${bbs.bHit}</td>
          </tr>
       </c:forEach>
	</tbody> 
</table>  
</body>
<script></script>
</html>