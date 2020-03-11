<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.Message"%>
<%@ page import="b_member.model.vo.Member"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
	body {
		overflow-x: hidden;
		height: auto;
		background-color: #fff9f0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	header {
		width: 100%;
		height: auto;
		text-align: center;
	}
	
	#mainHeader {
		width: 1170px;
		height: 50px;
		display: inline-block;
	}
	
	.menuBtn {
		padding: 3px;
		display: inline-table;
		float: right;
		background-color: transparent;
		border: none;
		cursor: pointer;
	}
	
	.messageBtn {
		padding: 3px;
		display: inline-table;
		float: right;
		background-color: transparent;
		border: none;
		cursor: pointer;
	}
	
	#icon {
		height: 50px;
		width: 50px;
		float: right;
	}
	
	#main {
		width: 100%;
		text-align: center;
		overflow: hidden;
		height: auto;
	}
	
	#realMain {
		width: 900px;
		display: inline-table;
		min-height: 600px;
		overflow: hidden;
		height: auto;
	}
	
	#subHeader {
		width: 100%;
		height: 250px;
		margin-top: 150px;
	}
	
	#logo {
		height: 100%;
		width: auto;
		float: center;
	}
	
	#travel {
		position: relative;
		left: 50px;
		top: 100px;
	}
	
	#list {
		height: 100%;
		width: auto;
		float: right;
		cursor: pointer;
		margin-left: 10px;
	}
	
	#login{cursor: pointer;}
	
	.nickname {
		float: right;
		padding: 10px;
		color: rgb(241, 131, 50);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 15pt;
		font-weight: bold;
	}
	
	.messageBtn {
		padding: 3px;
		display: inline-table;
		float: right;
		margin-right: 5px;
		background-color: transparent;
		border: none;
		cursor: pointer;
	}
	
	#nickname::after {
		content: "님";
		color: black;
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
	
	nav {background-color: #fff9f0; position: fixed; 
		width: 99%; height: 100%; top: 60px; z-index: 3;}
	
	.menu {
		margin: 10px auto;
	}
	
	.menu img {
		width: 300PX;
		height: 300px;
		cursor: pointer;
	}
	
	.circle {
		width: 300px;
		height: 300px;
		border-radius: 80%;
		background-color: #C7C7BF;
		margin: 50px auto;
		margin-left: 20px;
		margin-right: 20px;
		display: inline-block;
		position: relative;
	}
	
	.hoverCircle {
		position: absolute;
		background: rgba(0, 0, 0, 0.5);
		color: #fff;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		border-radius: 5%;
		display: none;
		z-index: 1;
		text-align: center;
		border-radius: 80%;
	}
	
	.p {
		display: table-cell;
		text-align: center;
		vertical-align: middle;
		width: 300px;
		height: 300px;
		line-height: 100%;
		font-size: 30px;
		font-weight: bold;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
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
	
	p {
		font-size: 22px;
	}
	
	#text1 {
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
	
	#text2 {
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
	
	#text3 {
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
	
	#miniInfo{border:3px solid powderblue; float: right; position:absolute; background-color:white; z-index:999;}
	#miniPage{display:inline-block; font-size: 18px; cursor: pointer; 
			padding: 5px; color:#f18332; font-weight:bold;}
	#logout {padding: 5px; color: #768149; font-size: 18px;
			cursor: pointer; display:inline-block; font-weight:bold;}
	#miniPoint{font-size: 18px;}
	
</style>

</head>

<body>
	<header>
		<div id="mainHeader">
			<img alt="메뉴" src="<%= request.getContextPath() %>/images/list.png" id="list" onclick="slideMenu()">
			
			<span id="message">
				<button type="button" class="messageBtn" onclick="goMessage();">
 				<% if(view == 0) {%> 
					<img alt="메세지" src="<%= request.getContextPath() %>/images/receive_letter.png" style="width:40px; height:40px;">
				<% } else { %>
					<img alt="메세지" src="<%= request.getContextPath() %>/images/basic_letter.png" style="width:40px; height:40px;">
				<% } %>
				</button>
			</span>
			
			<% if(loginUser == null){ %>
				<form method="post" action="<%= request.getContextPath() %>/views/b_member/login.jsp" id="loginUrl">
					<input type="hidden" id="url" name="url" value="">
					<div class="nickname" id="login"><b>로그인</b></div>
				</form>
			<%}else{ %>
				<div class="nickname" id="nickname"><b><%= loginUser.getNickName() %></b></div>
				<div id="miniInfo" hidden="">
					<div id="miniPage" onclick="location.href='<%= request.getContextPath()%>/myPage.me'">마이페이지</div>
					<div id="logout">로그아웃</div>
					<div id="miniPoint">
						<b>귤포인트</b>  <%= loginUser.getPoint() %>귤
						<img src="<%= request.getContextPath()%>/images/orange.png" width=30px; height=30px; style="vertical-align:middle;">
				</div>
		</div>
			<%} %>
			<img alt="아이콘" src="<%= request.getContextPath() %>/images/blanket.png" id="icon">

      	</div>
		
		<div id="subHeader">
			<img alt="로고" src="<%= request.getContextPath() %>/images/BigLogo.png" id="logo" onclick="location.href='index.jsp'">
		</div>
		
		<!-- html 높이는 454 -->
		
		<div id="readmore">
			<img id="readmoreImg" src="<%= request.getContextPath() %>/images/more.png" >
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
					<td><div class="circle" id="circle1" onclick="goInfo();">
							<img src="<%= request.getContextPath() %>/images/menu_info.png">
							<div class="hoverCircle" id="hoverCircle1"><p class="p">욜로홀로솔로</p></div>
						</div></td>
					<td></td>
					<td><div class="circle" id="circle2" onclick="goFree();">
							<img src="<%= request.getContextPath() %>/images/menu_free.png">
							<div class="hoverCircle" id="hoverCircle2"><p class="p">자유게시판</p></div>
						</div></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="circle" id="circle3" onclick="goGy();">
							<img src="<%= request.getContextPath() %>/images/menu_barter.png">
							<div class="hoverCircle" id="hoverCircle3"><p class="p">물귤교환</p></div>
						</div></td>
					<td></td>
					<td><div class="circle" id="circle4" onclick="goMarket();">
							<img src="<%= request.getContextPath() %>/images/menu_market.png">
							<div class="hoverCircle" id="hoverCircle4"><p class="p">혼플리마켓</p></div>
						</div></td>
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
		<div class="textarea"><br><img src="<%= request.getContextPath() %>/images/menuImg1.jpg" width=auto height=450px></div>
		<div class="textarea"><br><img src="<%= request.getContextPath() %>/images/menuImg2.jpg" width=auto height=450px></div>
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
		<div class="textarea"><br><img src="<%= request.getContextPath() %>/images/menuImg3.jpg" width=auto height=450px></div>
	</div>

	<section></section>
	<footer></footer>
	
	<script>
		$('#login').click(function(){
			$('#url').val(window.location.pathname.substring(10) + window.location.search);
			$('#loginUrl').submit()
		})
		
		$('#logout').click(function(){
			$.ajax({
				url: '<%= request.getContextPath() %>/logout.me',
			});
			location.reload();
		})
		
		$(document).mousemove(function(e){
		   if($('#nickname').is(":hover")) {
		      $('#miniInfo').show();
		      $('#miniInfo').css("top", 45);
		      $('#miniPage').css("cursor", "pointer");
		      $('#miniInfo').css("left", e.pageX - $('#miniInfo').width() / 2);
		   } else if(!($('#miniInfo').is(":hover"))) {
		      $('#miniInfo').hide();
		   }
		});
	
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
			<% } else { %>
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
			
		    var scrolltop = $(window).scrollTop();
		    var winheight = $(window).height();
			
			if(scrolltop > 550 && scrolltop < 950) {
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
		
        // hover //
        $(function(){
          $("#circle1").mouseenter(function(){
            $('#hoverCircle1').css('display','block');
          }).mouseleave(function(){
            $('#hoverCircle1').css('display','none');
          });

          $("#circle2").mouseenter(function(){
            $('#hoverCircle2').css({'display':'block'});
          }).mouseleave(function(){
            $('#hoverCircle2').css('display','none');
          });

          $("#circle3").mouseenter(function(){
            $('#hoverCircle3').css({'display':'block'});
          }).mouseleave(function(){
            $('#hoverCircle3').css('display','none');
          });

          $("#circle4").mouseenter(function(){
            $('#hoverCircle4').css({'display':'block'});
          }).mouseleave(function(){
            $('#hoverCircle4').css('display','none');
          });
        });
	</script>

 
</body>
  
</html>
