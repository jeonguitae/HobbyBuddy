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
      width: 30%;
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
      <h2 align="center">비밀글 처리 관리</h2>
      게시물 갯수 : 
         <select id="pagePerNum">
            <option value="100">100</option>
            <option value="150">150</option>
            <option value="200">200</option>
            <option value="250">250</option>
         </select>
      <form action="search.do">
      
         <select name="secret">
            <option value="default">선택</option>
            <option value="sobard_title">제목</option>
            <option value="writer_id">작성자</option>
         </select>
      
         <input type="text" name="secret_Search">
         <button>검색</button>
      </form>                            
      <table>
         <thead>
            <tr>
               <th>게시판 종류</th>
               <th>게시판 번호</th>
               <th>게시판 제목</th>
               <th>작성자</th>
               <th>처리한 관리자</th>
               <th>비밀글 여부</th>                        
               <th>비밀 일시</th>                       
            </tr>            
         </thead>
         <tbody id="list">             
         </tbody>
            <tr>
               <td colspan="7" id="paging">   
                  <!--    플러그인 사용   (twbsPagination)   -->
                  <div class="container">                           
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

var msg = "${msg}";
if(msg!=""){
   alert(msg);
}

var showPage = 1;

listCall(showPage);

 $('#pagePerNum').change(function() {
   listCall(showPage);
   // 페이지 처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
   // 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
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
      url:'secretList.ajax',
      data:{
          'page':page,
            'cnt':$('#pagePerNum').val()          
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.secretPageList);

         
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


function listPrint(list) {
	  var content = '';
	  // java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
	  // 해결방법 1. DTO 에서 Date 를 String 으로 반환
	  // 해결방법 2. js 에서 변환

	  list.forEach(function(item, idx) {
	    content += '<tr>';
	    content += '<td>'+item.sboard_class+'</td>';
	    content += '<td>'+item.sboard_num+'</td>';
	    content += '<td>'+item.sboard_title+'</td>';
	    content += '<td>'+item.writer_id+'</td>';
	    content += '<td>'+item.admin_id+'</td>';
	    content += '<td><button id="secretSet_Btn" onclick="confirmSecretRelease(' + item.sboard_num + ')">비밀 해제</button></td>';
	    var date = new Date(item.secret_time);
	    content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
	    content += '</tr>';
	  });

	  $('#list').empty();
	  $('#list').append(content);
	}

	function confirmSecretRelease(sboard_num) {
	  if (confirm('비밀 글을 해제하시겠습니까?')) {
	    // Perform additional logic if needed
	    location.href = './secretSet.do?sboard_num=' + sboard_num;
	  }
	}
	
	
	/* $('.chkBtn').off('click').on('click', function() {
    var $btn = $(this);
    var sboard_num = $btn.data('sboard-num');
    var secret_state = $btn.data('secret-state');
    var new_secret_state = secret_state;
    var newBtnText = '';

    if (secret_state) {
      if (confirm('해당 글 비밀글 해제하시겠습니까?')) {
        new_secret_state = false;
        newBtnText = '비밀글 설정';
      }
    } else {
      if (confirm('해당 글 비밀글 설정하시겠습니까?')) {
        new_secret_state = true;
        newBtnText = '비밀글 해제';
      }
    }

    if (new_secret_state !== secret_state) {
      $.ajax({
        type: 'POST',
        url: 'secret_chk.ajax',
        cache: false,
        data: { sboard_num: sboard_num, secret_state: new_secret_state },
        success: function(response) {
          console.log(response);
          $btn.text(newBtnText);
          $btn.data('secret-state', new_secret_state);
        },
        error: function(error) {
          console.error(error);
        }
      });
    } else {
      $btn.text(newBtnText);
      $btn.data('secret-state', new_secret_state);
    }
  }); */

</script>
</html>