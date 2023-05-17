<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="resources/css/css.css">
<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;  
   }
   button{
      margin: 5px;
   }
   table {
      width: 1000px;
   }
   input[type="text"]{
      width: 40%;   
   }
   #search{
      display: inline-block;
   }
   colgroup {
      width: 50%;
   }
   #paging{
      text-align: center;
   }
   #profileIcon{
		display:inline;
		background-color: #0074D9;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	.panel{
		display: none;
		background-color: #ffffff;
 		color: #22c55e;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	.panel2{
		display: none;
		background-color: #ffffff;
 		color: #22c55e;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	.panel3{
		display: none;
		background-color: #ffffff;
 		color: #22c55e;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
	}
	
	#alarmIcon{
		display:inline;
		background-color: #FFA500;
 		color: #ffffff;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;
		
	}
	
	.beforeAlarm{
		display: none;	
	}
	.alarmList{
		display: none;
		background-color: #ffffff;
 		color: #22c55e;
		border: none;
	 	border-radius: 5px;
		padding: 0.5rem 1rem;
		cursor: pointer;
		font-size: 1.2rem;	
		position: static;
	}
	
	.menu{
		display:inline;
	}
   .container {
    display: flex;
    justify-content: center;
  }
   
</style>
<head>
<meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
 <title th:text="${pageTitle}">Default Page Title</title>
</head>
<body>      
${sessionScope.loginId} 님 안녕하세요 ? / 새 알림 : <span id="alarmCount2"> ${sessionScope.alarmCount}</span> 개 <br/><br/>
	
	<a href="./"><img width="100" src="/photo/HBL.png"/></a>
	<br/><br/><br/>
	
	<div class="menu">
		<div id="profileIcon">프로필</div>
		<input type="button" class="panel2" value="로그인" onclick="location.href='login.go'"/>	
		<input type="button" class="panel" value="로그아웃" onclick="location.href='logout.go'"/>
		<input type="button" class="panel" value="마이페이지" onclick="location.href='pwChk.go'"/>
		<input type="button" class="panel" value="작성한 글/댓글" onclick="location.href='myBoardList.go'"/>
		<input type="button" class="panel" value="참여한 모임" onclick="location.href='myGroupList.go'"/>
		<input type="button" class="panel" value="쪽지방" onclick="location.href='msgList.go'"/>
		<input type="button" class="panel" value="즐겨찾기" onclick="location.href='bmarklist.go'"/>
		<input type="button" class="panel3" value="관리자" onclick="location.href='admin.go'"/>
	</div>
	<br/><br/><br/>	
	
	<div class="menu">
		<input type="button" value="취미 모임" onclick="location.href='glist.go'"/>
		<input type="button" value="프로필" onclick="location.href='profile.go'"/>
		<input type="button" value="랜덤 매칭" onclick="location.href='randomList.go'"/>
		<input type="button" value="익명 매칭" onclick="location.href='noNameList.do'"/>
		<input type="button" value="자유 게시판" onclick="location.href='flist.go'"/>
		<input type="button" value="고객센터" onclick="location.href='qboard.go'"/>
		<input type="button" value="공지사항" onclick="location.href='nboard.go'"/>
	</div>
	
	
		<div id="alarmIcon">알림</div>
		<br/><br/>
		<input type="button" value="알림 읽음 처리" class="beforeAlarm" onclick="alarmListRead()"/>
		<input type="button" value="이전 알림 보기" class="beforeAlarm" onclick="location.href='beforeAlarm.go'"/>
		<br/><br id="beforeAlarm"/>
		<br/><br/><hr/><br/><br/>
      <h2 align="center">쪽지 신고 관리 리스트</h2>
      <br/>
		   <input type ="text" id="msgSearchInput" placeholder="피신고자 아이디를 입력해 주세요.">
		   <button id ="msgSearchButton">검색</button>
		
		 <br/>                          
      <table>
         <thead>
            <tr>
               <th>신고 번호</th>
               <th>신고 분류</th>
               <th>피신고자 아이디</th>
               <th>신고자 아이디</th>
               <th>신고 제목</th>
               <th>신고 일시</th>
               <th>처리 상태</th>                        
               <th>처리 일시</th>                        
               <th>처리자</th>                        
            </tr>            
         </thead>
         <tbody id="list">             
         </tbody>
            <tr>
               <td colspan="9" id="paging">   
                  <!--    플러그인 사용   (twbsPagination)   -->
                  <div class="container" style="justify-content: center; display: flex;">                           
                     <nav aria-label="Page navigation" style="text-align:center">
                        <ul class="pagination" id="pagination"></ul>
                     </nav>               
                  </div>
               </td>
            </tr>                     
      </table>
      
	</body>
<script>
var loginId = "${sessionScope.loginId}";
var adminChk = "${sessionScope.adminChk}";
var alarmCount = "${sessionScope.alarmCount}";

$('#profileIcon').on('click',function(){
	if(loginId == ""){
		$('.panel2').slideToggle('slow');
	}else{
		$('.panel').slideToggle('slow');
   }
	if(adminChk == "1" || adminChk == "true"){
		$('.panel3').slideToggle('slow');
	}		
})

$('#alarmIcon').on('click',function(){		
	$('.beforeAlarm').slideToggle('slow');
	$('.alarmList').slideToggle('slow');				
});

if(alarmCount != 0){
	$('#alarmIcon').css('background-color', 'red');
}

alarmList();
function alarmList(){
	console.log("loginId : " + loginId);
	$.ajax({
		type:'get',
		url:'alarmList.ajax',			
		data:{},
		dataType:'json',
		success:function(data){
			console.log("data : " + data.alarmList);
			alarmListDraw(data.alarmList);				
		},
		cache: false,
		error:function(e){
			console.log(e);
		}
	});	
}	

function alarmListDraw(alarmList) {
	console.log("alarmList : " + alarmList);
	  var content = '';
	  if (alarmList && alarmList.length) {
	    alarmList.forEach(function(item, index) {
	    	console.log("alarmList : " + alarmList);
	      content += '<div class="alarmList">';
	      content += '<input type="checkbox" value="' + item.alarm_no + '"/>&nbsp;&nbsp;&nbsp;&nbsp;';
	      content += '<a href="alarmDetail.do?alarm_num=' + item.alarm_num + '&alarm_class=' + item.alarm_class + '&alarm_no=' + item.alarm_no + '">';
	      content += '('+ item.alarm_class+')&nbsp;&nbsp;<b>ID</b> : \" ' + item.id_send + ' \" &nbsp;&nbsp;&nbsp;<b>제목</b> : \" '
	      			+ item.alarm_title + ' \" &nbsp;&nbsp;&nbsp;<b>내용</b> : \ "' + item.alarm_content;
	      content += ' /" </a></div>';
	      console.log("alarmList : " + alarmList);
	    });
	  } else {
		console.log("alarmList : " + alarmList);
	    content = '<div class="alarmList">새로운 알림이 없습니다.</div>';
	  }
	  
	  // 이전 알림 리스트 요소 삭제
	  $('.alarmList').empty();
	  
	  // 새로운 알림 리스트 요소 생성 및 삽입
	  $(content).insertBefore($('#beforeAlarm').parent().find('#beforeAlarm').next());
	  
	}


// 읽음 처리
function alarmListRead(){
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
		type:'post',
		url:'alarmListRead.ajax',
		data:{'alarmListRead':checkArr},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success){
				alert(data.msg);
				alarmList();
				location.reload();
			}
		},
		error:function(e){
			console.log(e);
		}		
	});		
}

var searchText = 'default';
var showPage = 1;

listCall(showPage);

 $('#pagePerNum').change(function() {
   listCall(showPage);
   // 페이지 처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
   // 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
   $('#pagination').twbsPagination('destroy');
}); 
 
 $('#msgSearchButton').click(function(){
	   searchText = $('#msgSearchInput').val();
	   listCall(showPage);
	   $('#pagination').twbsPagination('destroy');
	});

 

/* $('#search_btn').click(function() {
	var searchClass = $("#search_Class").val();
    var searchText = $("#search_text").val();
	   listCall(showPage, searchClass, searchText);
	   $('#pagination').twbsPagination('destroy');
}); */


function listCall(page){
   $.ajax({
      type:'post',
      url:'msgList.ajax',
      data:{
          'page':page,
            /* 'cnt':$('#pagePerNum').val()     */     
          'search':searchText
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.report_msgList);

         
         // 총 페이지 수
         // 현재 페이지 
         
         //paging plugin
         $('#pagination').twbsPagination({
            startPage:data.currPage,    // 시작 페이지
            totalPages:data.pages,    // 총 페이지 수
            visiblePages:5,  // 보여줄 페이지[1][2][3][4][5]
            onPageClick:function(event, page){// 페이지 클릭시 동작되는 함수(콜백)
               console.log(event,page);      
            
               if (page != showPage) {
                  showPage = page;               
                  listCall(page);
               }
                  
            }
         });
      },
      error:function(e){
         console.log(e);
      }
   });
}


function listPrint(list){
	   var content='';
	   list.forEach(function(item,idx){
	      content += '<tr>';
	      content += '<td>'+'<input type="hidden" value="'+item.msgNo+'">'+item.rept_no+'</td>';
	      content += '<td>'+item.reptboard_class+'</td>';
	      content += '<td>'+item.preporter+'</td>';
	      content += '<td>'+item.reporter+'</td>';
	      content += '<td><a href="report_msgDetail.go?rept_no='+item.rept_no+'">'+item.rept_title+'</td>';
	      var date = new Date(item.rept_date);
	      content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
	      content += '<td>'+item.rept_state+'</td>';
	      date = new Date(item.proc_date);
	      var procDate = date.getTime() === 0 ? '' : date.toLocaleDateString('ko-KR'); // 조건문 추가
	      content += '<td>'+ procDate +'</td>';
	      content += '<td>'+(item.admin_id ? item.admin_id : '')+'</td>'; // 조건문 추가
	      content += '</tr>';
	   });
	   $('#list').empty();
	   $('#list').append(content);
	}


</script>
</html>