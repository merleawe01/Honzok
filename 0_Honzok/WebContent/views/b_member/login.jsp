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

   header {width: 100%; height: 170px; text-align: center;}
   #mainHeader {width: 1170px; height: 50px; display: inline-block;}
   .menuBtn {padding:3px; display: inline-table; float: right;
          background-color: transparent; border: none; cursor: pointer;}
   #login {float: right; padding: 10px; color: rgb(241, 131, 50);
         font-family: 'Nanum Gothic', sans-serif; font-size: 12pt;}
   
   #icon {height: 90%; width: auto; float: right;}
   #subHeader {width : 1170px; height : 100px;display : inline-block;}
   #logo {height: auto; width: auto; float: center;}
   
   #main {width: 100%; text-align: center; height: 1170px;}
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
    p {display: block; margin: 0 0 20px; font-size: 14px; text-align: center;
       background: url("image/line.png") repeat-x center;}
    #N_loginBtn {width:300px; hegith:150px; margin-top:10px;
             cursor:pointer; background-color:white; border:2px solid #d3d3d3; border-radius: 5px;}
    #N_loginBtn img {vertical-align: middle; border-right:2px solid #d3d3d3;}
    #N_loginBtn b {font-size:14px;}
</style>
</head>
<body>
<body>

	<header>
		<div id="mainHeader">
			<button type="button" class="menuBtn" onclick="">
				<img src="../../images/list.png" style="width: 30px; heigth: 30px;">
			</button>
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
            </script>
            

			<div id="linkArea">
				<!-- ID/PWD 찾기 + 회원 가입 -->
				<ul id="link_list" class="center">
					<li><a href="../b_member/find_Id.jsp">아이디 찾기</a></li>
					<li><a href="../b_member/find_Pwd1.jsp">비밀번호 찾기</a></li>
					<li><a href="../b_member/memberJoin.jsp">회원 가입</a></li>
				</ul>
			
			</div>
			
			<p class="center">
				<span id="text">또는</span>
			</p>
			
		
	</div>	
				
				
				<!-- <button onclick="naver_login();" id="N_loginBtn" class="center">
					<img src="images/naver_icon.png" width="50px" height="50px">
					<b>네이버 아이디로 로그인/회원가입</b>
					<div id="naver_id_login"></div>
					
				</button> -->
			
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<button id="N_loginBtn" class="center">
		 		  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>
			  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
<!-- 			<script type="text/javascript">
			  	var naver_id_login = new naver_id_login("PUOQo9pPnn5wJXhNF0v6", "http://localhost:9580/0_Honzok/views.jsp");
			  	var state = naver_id_login.getUniqState();
			  	naver_id_login.setButton("white", 2,40);
			  	naver_id_login.setDomain("http://localhost:9580/0_Honzok/index.jsp");
			  	naver_id_login.setState(state);
			  	naver_id_login.setPopup();
			  	naver_id_login.init_naver_id_login();
			</script>
			
			<script type="text/javascript">
					var clientId = "PUOQo9pPnn5wJXhNF0v6";
					var callbackUrl = "http://localhost:9580/0_Honzok/views.jsp";
					var naver_id_login = new naver_id_login(clientId, callbackUrl);
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("white", 3, 40);
					naver_id_login.setDomain("http://localhost:9580/0_Honzok/index.jsp");
					naver_id_login.setState(state);
					naver_id_login.setPopup();
					naver_id_login.init_naver_id_login();
			</script> -->
			
			</button>
			

		
	</section>

	<footer> 
	
	</footer>
	
</body>
</html>