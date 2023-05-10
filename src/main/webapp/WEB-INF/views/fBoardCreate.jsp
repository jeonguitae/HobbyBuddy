<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 800px;
		margin : 5px;
	}
	input.title, input.user, textarea.content{
		width : 640px;
	}
</style>
<script type="text/javascript">

	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("date");
		bir.value = today;
	}
	
</script>
</head>
<body>
	<form action="fwrite.do" method="post" enctype="multipart/form-data">
		<table>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
			<tr>
				<th>분류</th>
				<td>
				<select name="bhobby">
					<option value="운동">운동</option>
					<option value="맛집">맛집</option>
					<option value="반려동물">반려동물</option>
					<option value="여가">여가</option>
				</select>
				<select name="mhobby">
					<option value="헬스">헬스</option>
					<option value="축구">축구</option>
					<option value="야구">야구</option>
					<option value="풋살">풋살</option>
					<option value="탁구">탁구</option>
					<option value="골프">골프</option>
					<option value="테니스">테니스</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input class="title" type="text" name="title"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" value="${sessionScope.loginId}" readonly/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="content" name="bContent"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="photo"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='flist.go'" value="리스트"/>
					<button>저장</button>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script>
	
	$('select[name="bhobby"]').on('change',function(){
		var val = $(this).val();
		var content = '';
		
		if (val == '운동') {
			content += '<option value="헬스">헬스</option>'
			content += '<option value="축구">축구</option>'
			content += '<option value="야구">야구</option>'
			content += '<option value="풋살">풋살</option>'
			content += '<option value="탁구">탁구</option>'
			content += '<option value="골프">골프</option>'
			content += '<option value="테니스">테니스</option>'
			content += '<option value="선택 안함">선택 안함</option>'
		}
		
		else if(val == '맛집'){
	         content += '<option value="식사">식사</option>'
	         content += '<option value="술">술</option>'
		     content += '<option value="카페">카페</option>'
	         content += '<option value="선택 안함">선택 안함</option>'
	      }
	      
	    else if(val == '반려동물'){
	    	content += '<option value="산책">산책</option>'
		    content += '<option value="쇼핑">쇼핑</option>'
			content += '<option value="미용">미용</option>'
		    content += '<option value="선택 안함">선택 안함</option>'
	    
	    }
	    else if(val == '여가'){
	    	
	    	content += '<option value="영화">영화</option>'
		    content += '<option value="게임">게임</option>'
			content += '<option value="노래방">노래방</option>'
			content += '<option value="보드게임">보드게임</option>'
			content += '<option value="방탈출">방탈출</option>'
		    content += '<option value="선택 안함">선택 안함</option>'
	    }

		$('select[name="mhobby"]').html(content);
		});
	
	$('.writefin').on('click',function(){
		alert("글이 저장되었습니다.");
	})
</script>
</html>