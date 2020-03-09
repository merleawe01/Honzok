<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="static/includeHTML.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	body{background-color: #fff9f0;
		font-family: 'Nanum Gothic', sans-serif;}
   header {width: 100%; height: 170px; text-align: center;}
   #mainHeader {width: 1170px; height: 50px; display: inline-block;}
   #list {
		height : 85%;
		width : auto;
		float : right;
		cursor: pointer;
		margin-left: 10px;
	}
   #login {float: right; padding: 10px; color: rgb(241, 131, 50);
         font-family: 'Nanum Gothic', sans-serif; font-size: 12pt;}
   
   #icon {height: 90%; width: auto; float: right;}
   #subHeader {width : 1170px; height : 100px;display : inline-block;}
   #logo {height: auto; width: auto; float: center;}
   
   #main {width: 100%; text-align: center; height:100%}
   #realMain {width : 900px; display : inline-table; height: auto;}

   .center {width:400px; margin: 0 auto; position: relative; top:80px; left:25px;}
   #login_box {display: block; height:200px; background-color: #d3d3d3;} 
   #login_box input{display: block; width: 300px; height: 45px; line-height: 49px; margin: 0 0 3px;
                   padding: 0 20px; border: 1px solid #d8d8d8; border-radius: 5px; box-sizing: border-box;}
    #userId {position:absolute; left:50px; top:50px}
    #userPwd {position:absolute; left:50px; top:105px;}
    #loginBtnArea{width:400px; height:80px;}
    #loginBtn {text-align:center; font-weight:bold; font-size:14px; width:100%; height:45px;
             padding: 0 20px; border: none; border-radius: 5px; box-sizing: border-box; margin:20px auto;
             background-color: powderblue; cursor:pointer;}

  #link_list {left:0px; margin-bottom:20px;}
    #link_list li {display:inline-block; list-style: none;}
    #link_list li a {display: block; padding: 0 10px; font-size: 14px; font-weight: 600; color:rgb(118,129,73);}
    #link_list li a:hover {color:rgb(241,131,50);}
    a {text-decoration: none; cursor:pointer;}
    #N_loginBtn {width:300px; hegith:150px; margin-top:10px;
             cursor:pointer; background-color:white; border:2px solid #d3d3d3; border-radius: 5px;}
    #N_loginBtn img {vertical-align: middle; border-right:2px solid #d3d3d3;}
    #N_loginBtn b {font-size:14px;}
    
    nav {
      background-color:#fff9f0;
      position: fixed;
      width: 99%;
      height: 100%;
      top: 45px;
      z-index: 3;
   }
   .menu {margin:10px auto;}
   .menu img {width: 100%; height: 100%; cursor: pointer;}
   .circle {width:300px; height: 300px; border-radius: 80%; background-color:gray;
         margin:30px auto; margin-left:20px; margin-right:20px; display:inline-block; position:relative;}
   .hoverCircle {position: absolute; background: rgba(0, 0, 0, 0.5); color: #fff; width: 100%; height: 100%;
   				 top: 0; left: 0; border-radius:5%; display:none; z-index: 1; text-align:center; border-radius: 80%;}
	.p {display:table-cell; text-align:center; vertical-align:middle; width:300px; height:300px; line-height:100%;
		font-size:30px; font-weight:bold; font-family: 'Nanum Gothic', sans-serif;}
</style>
</head>
<body>
<body>

	<header>
		<div id="mainHeader">
			<img alt="메뉴" src="<%= request.getContextPath() %>/images/list.png" id="list" onclick="slideMenu()">
		<script>
				$(function() {
					$(".menuBtn").click(function() {
						$("#accordian ul ul").slideUp();
						if (!$(this).next().is(":visible")) {
							$(this).next().slideDown();
						}
					})
				})
				
			</script>

		</div>
		<div id="subHeader">
			<a href="../../index.jsp"><img alt="로고" src="../../images/Logo.png" id="logo"></a>
		</div>
		
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
		</script>
		
	</header>

	<section>
		<div id="main">
			<div id="realMain">
				
				<!-- 로그인 박스 -->
	            <div class="center">
	            <form action="<%= request.getContextPath() %>/login.me" method="post">
	            	<input type="hidden" name="page" value=<%= (String)request.getParameter("page") %>>
	            	<div id="login_box">
		            	<input type="text" name="userId" id="userId" placeholder="아이디"><br>
		            	<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호">
	            	</div>
	            	<div id="loginBtnArea">
	            		<!-- <input type="submit" onclick="login();" name="loginBtn" id="loginBtn"class="center" value="로그인"> -->
	            		<button type="submit"  name="loginBtn" id="loginBtn">로그인</button>
	            	</div>
	            </form>
	            </div>

            </div>
            

			<div id="linkArea">
				<!-- ID/PWD 찾기 + 회원 가입 -->
				<ul id="link_list" class="center">
					<li><a href="<%= request.getContextPath() %>/views/b_member/find_Id.jsp">아이디 찾기</a></li>
					<li><a href="<%= request.getContextPath() %>/views/b_member/find_Pwd1.jsp">비밀번호 찾기</a></li>
					<li><a href="<%= request.getContextPath() %>/views/b_member/memberJoin.jsp">회원 가입</a></li>
				</ul>
			
			</div>
		
	</div>	

	</section>
	<script>
		function login(){
			if($('#userId').val() == ""){
				alert("아이디를 입력해주세요.");
			} else if($("#userPwd").val() == "") {
				alert("비밀번호를 입력해주세요.");
			} else {
				$('form').submit();
			}
		};
	               
		function goInfo(){
			location.href="<%=request.getContextPath()%>/list.food";
		}
		function goFree(){
			location.href="<%=request.getContextPath()%>/list.bo";
		}
		function goMarket(){
			location.href="<%=request.getContextPath()%>/list.m";
		}
		function goGy(){
			location.href="<%=request.getContextPath()%>/list.gy";
		};
		
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