<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
<style>
	table, th, td {
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;     
   }
   button {
      margin: 5px;
   }
   table {
      width: 500px;
   }
   input[type="text"] {
      width: 40%;   
   }
   #search {
      display: inline-block;
   }
   colgroup {
      width: 30%;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
   <h3 align="center">문의 등록</h3>
   <!-- <form action="qBoardWrite.do" method="post" enctype="multipart/form-data"> -->
      <table>      
      
         <tr>
            <th>작성자 아이디</th>
            <td><input type="text" name="id" id="id" value="${sessionScope.loginId}" readonly></td>
         </tr>               
         <tr>
            <th>문의 유형</th>
            <td>
            	<select name="qboard_class" id="qboard_class">
            		<option value="question_default">선택</option>
            		<option value="계정 문의">계정문의</option>
            		<option value="게시판 문의">게시판문의</option>
            		<option value="채팅 문의">채팅문의</option>
            		<option value="기타 문의">기타문의</option>
            	</select>
            </td>
         </tr>
         <tr>
            <th>문의 제목</th>
            <td><input type="text" name="qboard_title" id="qboard_title"></td>
         </tr>
         <tr>
            <th>문의 내용</th>
            <td><textarea name="qboard_content" id="qboard_content"></textarea></td>
         </tr>
         <tr>
            <th>사진</th>
            <td>
               <input type="file" name="photo" id="photo" multiple="multiple">               
            </td>
         </tr>   
         <tr>
         	<th>
	         	공개여부
         	</th>
         	<th>
         		<input type="radio" name="qboard_openchk" value="true">공개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	         	<input type="radio" name="qboard_openchk" value="false">비공개
         	</th>         	
         </tr>      
         <tr>            
            <th colspan="2">               
               <!-- 이러면 submit 효과가 사라짐 -->
               <!-- <button type="button"></button> -->
               <button onclick="qboard_write()">등록</button>
               <input type="button" onclick="location.href='qboard.go'" value="취소">
            </th>
         </tr>
      </table>
   <!-- </form> -->
</body>
<script>
function qboard_write(){
	console.log("공지사항 등록");
	var $id = $('#id');
	var $qboard_class = $('#qboard_class');
	var $qboard_title = $('#qboard_title');
	var $qboard_content = $('#qboard_content');
	var $qboard_openchk = $('input[name="qboard_openchk"]:checked');
	
	if ($id.val()=="") {
		alert('세션이 만료되었습니다, 다시 로그인 해주세요.');
		location='./qboardList.go'
	}else if ($qboard_class.val() == "question_default") {
		alert('문의 종류를 선택하세요.');
		$qboard_class.focus();
	}else if ($qboard_title.val() == "") {
		alert('문의 제목을 입력하세요.');
		$qboard_title.focus();
	}else if ($qboard_title.val().length > 100) {
		alert('문의 제목은 100자 이내로 작성해주세요.');
		$qBoard_title.focus();
	}else if ($qboard_content.val() == "") {
		alert('문의 내용을 입력하세요.')
		$qboard_content.focus();
	}else if ($qboard_content.val().length > 1000) {
		alert('문의 내용은 1000자를 초과할 수 없습니다.');
		$qboard_content.focus();
	}else if($qboard_openchk.val()== null) {
		alert('공개 여부를 선택하세요.');
	}else{
   	 
		var formData = new FormData();

	    // 파일 선택
	    var files = $("#photo").get(0).files;

	    // FormData 객체에 파일 추가
	    for (var i = 0; i < files.length; i++) {
	        formData.append("photo", files[i]);
	    }

	    // 폼 데이터에 나머지 값 추가
	    formData.append("id", $id.val());
	    formData.append("qboard_class", $qboard_class.val());
	    formData.append("qboard_title", $qboard_title.val());
	    formData.append("qboard_content", $qboard_content.val());
	    formData.append("qboard_openchk", $qboard_openchk.val());
   	 
	    $.ajax({
	        type: "POST",
	        enctype: "multipart/form-data",
	        url: "qboard_write.ajax",
	        data: formData,
	        processData: false,
	        contentType: false,
	        cache: false
            ,dataType:'json'
            ,success:function(data){
               console.log(data);
               
               if (data.success == 1) {
   				alert('문의사항 등록이 완료 되었습니다.');
   				location.href = 'qboardList.go';   				
   			}else{
   				alert('문의사항 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
   			}
            }
            ,error:function(e){
               console.log(e);
               alert('문의사항 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
            }
        });      
    }    	
}




/* var msg = "${msg}";
if (msg != "") {
	alert(msg);
} */
</script>
</html>