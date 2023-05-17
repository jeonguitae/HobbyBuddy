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
    <jsp:include page="gnb.jsp"/>
    <h3>프로필 신고하기</h3>
    <form action="report.do" method="get" onsubmit="closePopup()">
        <table>
            <tr>
                <th>신고 아이디</th>
                <td><input type="text" name="preporter" value="${id}" readonly/></td>
            </tr>
            <tr>
                <th>내 아이디</th>
                <td><input type="text" name="reporter" value="${sessionScope.loginId}" readonly/></td>
            </tr>
            <tr>
                <th>분류</th>
                <td><input type="text" name="reptboard_class" value="프로필" readonly></td>
            </tr>
            <tr>
                <th>번호</th>
                <td><input type="text" name="reptboard_num" value="0" readonly></td>
            </tr>            
            <tr>
                <th>신고 내용</th>
                <td><input type="text" name="rept_content" value="프로필 부적절" readonly></td>
            </tr>
            <tr>
                <th>신고 제목(사유)</th>
                <td><input type="text" name="rept_title" value=""></td>
            </tr>
            <tr>
                <th>신고 하기</th>
                <td><button>신고 하기</button></td>
            </tr>
        </table>
    </form>
</body>
<script>
function closePopup() {
    window.opener = self;
    window.close();
    /* alert("신고가 완료되었습니다."); */
    return true;
  }
</script>
</html>