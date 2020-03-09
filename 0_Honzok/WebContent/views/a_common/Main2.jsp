<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.Message"  import="b_member.model.vo.Member"%>
<%@ page import="b_member.model.vo.Member"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
   //System.out.println(loginUser);
   String msg = (String)request.getAttribute("msg"); 

   Message m = new Message();
   int view = m.getView();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼족옵서예</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
   body {overflow-x: hidden; height: auto;}
   header {width: 100%; height: auto; text-align: center;}
   #mainHeader {width: 1170px; height: 50px; display: inline-block;}
   .menuBtn {padding:3px; display: inline-table; float: right;
          background-color: transparent; border: none; cursor: pointer;}
   .messageBtn {padding:3px; display: inline-table; float: right;
          background-color: transparent; border: none; cursor: pointer;}
   #icon {height: 50px%; width: 50px; float: right;}
   #main {width: 100%;text-align: center;overflow: hidden;height: auto;}
   #realMain {width: 900px; display: inline-table; min-height: 600px; overflow: hidden; height: auto;}
   #subHeader{width:100%; height:250px; margin-top: 150px;}
   #logo {height: 100%; width: auto; float: center;}
   #travel {position:relative; left:50px; top:100px;}
   
   #list {
		height : 100%;
		width : auto;
		float : right;
		cursor: pointer;
		margin-left: 10px;
	}
   #login {
   		margin-top: 100px;
   		width: 100%;
   		height: 100px;
   		text-align: center;
   		font-family: 'Nanum Gothic', sans-serif;
		font-size: 15pt;
   }
   #loginbtn{
		width : 150px;
		height : 60px;
		background-color : rgba(118, 129, 73, 0.8);
		color : white;
		border-radius: 10px;
		line-height: 60px;
		font-weight: bold;
		display: inline-table;
		cursor: pointer;
	}
   #nickname {
		float : right;
		padding : 10px;
		color: rgb(241,131,50);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12pt;
		cursor: pointer;
		font-weight: bold;
	}
	#logout {
		float : right;
		padding : 10px;
		color: rgb(118,129,73);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12pt;
		cursor: pointer;
	}
   #readmore {
   		position: fixed;
   		bottom: 0%;
   		height: 100px;
   		width: 100%;
   }
   #readmoreImg {
   		float: center;
   		height: 100%;
   		width: auto;
   		cursor: pointer;
   }
   
   nav {
      background-color:#fff4c7;
      position: fixed;
      width: 99%;
      height: 90%;
      top: 60px;
      z-index: 1;
   }
   .menu {margin:100px auto;}
   .menu img {width: 100%; height: 100%; cursor: pointer;}
   .circle {width:300px; height: 300px; border-radius: 80%; background-color:gray;
         margin:30px auto; margin-left:20px; margin-right:20px; display:inline-block;}
         
   #mainText {
      margin-top: 400px;
      width: 100%;
      height: auto;
      text-align: center;
      
      /* border:1px solid black; */
   }
   .textarea {
      display: inline-table;
      width: 45%;
      height: 500px;
      
      /* border: 1px solid black; */
   }
   p{
   	font-size: 22px;
   }
   #text1{
      position: absolute;
      left: -50%;
      transition: All 0.5s ease; 
      -webkit-transition: All 0.5s ease; 
      -moz-transition: All 0.5s ease; 
      -o-transition: All 0.5s ease;
   }
   #text1.open {
      left: 18%;
   }
   #text2{
      position: absolute;
      right: -50%;
      transition: All 0.5s ease; 
      -webkit-transition: All 0.5s ease; 
      -moz-transition: All 0.5s ease; 
      -o-transition: All 0.5s ease;
   }
   #text2.open {
      right: 18%;
   }
   #text3{
      position: absolute;
      left: -50%;
      transition: All 0.5s ease; 
      -webkit-transition: All 0.5s ease; 
      -moz-transition: All 0.5s ease; 
      -o-transition: All 0.5s ease;
   }
   #text3.open {
      left: 18%;
   }

</style>

</head>

<body>
	<header>
		<div id="mainHeader">
			<img alt="메뉴" src="<%= request.getContextPath() %>/images/list.png" id="list" onclick="slideMenu()">
			
			<span id="message">
				<button type="button" class="messageBtn" onclick="goMessage();">
 				<% if(view == 0) {%> 
					<img alt="메세지" src="images/receive_letter.png" style="width:40px; height:40px;">
				<% } else { %>
					<img alt="메세지" src="images/basic_letter.png" style="width:40px; height:40px;">
				<% } %>
				</button>
			</span>
			
			<% if(loginUser == null){ %>
				<div id="nickname" class="login">로그인</div>
			<%}else{ %>
				<div id="logout">로그아웃</div>
				<div id="nickname" onclick="location.href='<%= request.getContextPath()%>/myPage.me'"><%= loginUser.getUserName() %>님</div>
			<%} %>
					
			<img alt="아이콘" src="<%= request.getContextPath() %>/images/blanket.png" id="icon">
			
			<script>
				$('.login').click(function(){
					location.href='views/b_member/login.jsp?page=' + window.location.pathname.substring(10);
				})
				
				$('#login').click(function(){
					location.href="<%= request.getContextPath()%>/logout.me?page=" + window.location.pathname.substring(10);
				})
				
				$('#logout').click(function(){
					location.href="<%= request.getContextPath()%>/logout.me?page=" + window.location.pathname.substring(10);
				})
			</script>
      	</div>
		
		<div id="subHeader">
			<img alt="로고" src="images/BigLogo.png" id="logo" onclick="location.href='index.jsp'">
		</div>
		
		<!-- html 높이는 454 -->
		
		<div id="readmore">
			<img id="readmoreImg" src="images/readmore.png" >
		</div>
		
		<script>
			$('#readmoreImg').click(function(){
				$('#readmoreImg').hide();
				$('#mainText').show();
				
				var offset = $('#mainText').offset(); //선택한 태그의 위치를 반환
	        	$('html').animate({scrollTop : offset.top}, 400);
			});
		</script>
		
		<!-- 메뉴 -->
		<nav hidden="">
			<table class="menu">
				<tr>
					<td><div class="circle" id="circle1" onclick="goInfo();"><img src="images/menu_info.png"></div></td>
					<td></td>
					<td><div class="circle" id="circle2" onclick="goFree();"><img src="images/menu_free.png"></div></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="circle" id="circle1" onclick="goGy();"><img src="images/menu_barter.png"></div></td>
					<td></td>
					<td><div class="circle" id="circle2" onclick="goMarket();"><img src="images/menu_market.png"></div></td>
				</tr>
			</table>
		</nav>
	</header>
	
	<br>
	<div id="mainText" hidden="">
		<div class="textarea">
			<div id="text1">
				<br><br><br>
				<h1>혼족옵서예?</h1>
				<br>
				<p>혼족들을 위한 커뮤니티 사이트로</p> 
				<p>당신의 빛나는 Single Life를 응원합니다.</p>
			</div>
		</div>
		<div class="textarea"><br><img src="images/main1.jpg" width=auto height=450px></div>
		<div class="textarea"><br><img src="images/main2.jpg" width=auto height=450px></div>
		<div class="textarea">
			<div id="text2">
				<br><br><br>
				<h1>욜로홀로솔로</h1>
				<br>
				<p>혼자만 알고있기 아까운</p> 
				<p>좋은 여행지나 숨은 맛집이 있나요?</p>
				<p>좋은 정보는 우리 함께 공유해요</p>
			</div>
		</div>
		<div class="textarea">
			<div id="text3">
				<br><br><br>
				<h1>물귤교환 & 혼플리마켓</h1>
				<br>
				<p>함께 나누고 싶은 물건이 있나요?</p>
				<p>아니면 나한테는 필요하지 않지만</p>
				<p>다른 누군가한테는 필요할 것 같다고요?</p>
			</div>
		</div>
		<div class="textarea"><br><img src="images/main3.jpg" width=auto height=450px></div>
	</div>

	<section></section>
	<footer></footer>
	
	<script>
		$('nav').height($(document).height()-50)
		var updownCheck = true;
		
		function slideMenu() {
			if(updownCheck) {
				$('nav').slideDown(300);
				updownCheck = false;
				document.body.style.overflow= 'hidden';
			} else {
				$('nav').slideUp(300);
				updownCheck = true;
				document.body.style.overflow= 'visible';
			}
		}
	
		function goMessage(){
			<% if(loginUser != null) {%>
				window.open("<%= request.getContextPath() %>/list.re", "messgaeHome", "width=1000", "height=1000");
			<% } else {%>
				alert("로그인 후 이용해주세요.");
			<% } %>
		}	
		
		function goInfo(){
			location.href="<%= request.getContextPath()%>/list.food";
		}

		function goFree(){
			location.href="<%= request.getContextPath()%>/list.bo";
		}
		function goMarket(){
			location.href="<%= request.getContextPath()%>/list.m";
		}
		function goGy(){
			location.href="<%= request.getContextPath()%>/list.gy";
		}
		
		$(window).scroll(function(){
			/* console.log($(window).scrollTop()) // 이거는 보고있는 창의 최상단
			console.log($(document).height()) // 이거는 페이지 길이 밑에거는 보고있는 화면길이
			console.log($(window).height())  */
			
		    var scrolltop = $(window).scrollTop();
		    var winheight = $(window).height();
			
			if(scrolltop > 680 && scrolltop < 950) {
				$("#text1").addClass("open");
			} else {
				$("#text1").removeClass("open");
			}
			
			if(scrolltop > 1050 && scrolltop < 1450) {
				$("#text2").addClass("open");
			} else {
				$("#text2").removeClass("open");
			}
			
		    if(scrolltop >= $(document).height() - $(window).height() - 100){
		    	$("#text3").addClass("open");
			} else {
				$("#text3").removeClass("open");
			}
		});
		var msg = "<%= msg %>";
		$(function(){
			if(msg != "null"){
				alert(msg);
			}
		});
	</script>

 
</body>
  
</html>