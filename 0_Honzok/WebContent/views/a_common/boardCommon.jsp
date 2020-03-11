<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "f_message.model.vo.*, b_member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
	Message message = new Message();
	int view = message.getView();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a37066af0c038845c5bf58548af2378b&libraries=services"></script>

<style>
	body {
		background-color: #fff9f0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	header {
		width : 100%;
		height : 170px;
		text-align: center;
	}
	#mainHeader{
		width : 1170px;
		height : 50px;
		display : inline-block;
	}
	#subHeader{
		width : 1170px;
		height : 100px;
		display : inline-block;
	}
	#logo {
		height : 120%;
		width : auto;
		float : left;
		cursor: pointer;
	}
	#list {
		height: 100%;
		width: auto;
		float: right;
		cursor: pointer;
		margin-left: 10px;
	}
	#icon {
		height: 50px;
		width: 50px;
		float: right;
	}

	.messageBtn {padding:3px; display: inline-table; float: right;
          background-color: transparent; border: none; cursor: pointer;}
	 .nickname {
			float : right;
			padding : 10px;
			color: rgb(241,131,50);
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 15pt;
			cursor: pointer;
			font-weight: bold;
		}
	.messageBtn {padding:3px; display: inline-table; float: right; margin-right:5px;
          background-color: transparent; border: none; cursor: pointer;}
	#nickname::after{
		content : "님";
		color : black;
	}
	#logout {
		float : right;
		padding : 10px;
		color: rgb(118,129,73);
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 15pt;
		cursor: pointer;
	}
	#boardName{
		margin : 20px;
		width : 100%;
		height : 70px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 30pt;
		font-weight: bold;
		display : inline-table;
		border-bottom: 2pt solid gray;
	}
	
	body {
       	overflow-y:scroll;
       	text-align: center;
       	font-family: 'Nanum Gothic', sans-serif;
	}
	@media only screen and (max-width: 1200px) {
		.sidebar {
			display:none;
		}
	}
	
	nav {
      background-color:#fff4c7;
      position: fixed;
      width: 99%;
      height: 90%;
      top: 60px;
      z-index: 1;
   }
	#quicklink {
		position: fixed;
		top: 250px;
	}
	#quicklink table {
		display: inline-table;
		text-align: center;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		margin-bottom: 20px;
	}
	.boardTr{width:80px; height:85px; background-color: white;}
	#quicklink td {
		cursor: pointer;
	}
	.td {
		border-bottom: 1px solid gray;
	}
	.imgDiv{position: relative; display:block; }
	#quicklink img {width:80px; height: auto; cursor: pointer; vertical-align: middle;}

	.quickCircle {position: absolute; background: rgba(0, 0, 0, 0.5); color: #fff; width: 100%; height: 100%;
				top: 0; left: 0; border-radius:5%; display:none; z-index: 1; text-align:center;}
	#main {
		width : 900px;
		display : inline-table;
		font-family: 'Nanum Gothic', sans-serif;
		min-height : 600px;
		overflow:hidden;
		height:auto;
		margin-bottom: 20px;
		text-align: center;
	}
	
    nav {
      background-color:#fff9f0;
      position: fixed;
      width: 99%;
      height: 100%;
      top: 65px;
      z-index: 3;
   }
   .menu {margin:10px auto;}
   .menu img {width: 300PX; height: 300px; cursor: pointer;}
   .circle {width:300px; height: 300px; border-radius: 80%; background-color:#C7C7BF;
         margin:20px auto; margin-left:20px; margin-right:20px; display:inline-block; position:relative;}
   .hoverCircle {position: absolute; background: rgba(0, 0, 0, 0.5); color: #fff; width: 100%; height: 100%;
   				 top: 0; left: 0; border-radius:5%; display:none; z-index: 1; text-align:center; border-radius: 80%;}
	.p {display:table-cell; text-align:center; vertical-align:middle; width:300px; height:300px; line-height:100%;
		font-size:30px; font-weight:bold; font-family: 'Nanum Gothic', sans-serif;}
	
	#miniInfo{border:3px solid powderblue; float: right; position:absolute; background-color:white; z-index:999;}
	#miniPage{display:inline-block; font-size: 18px; cursor: pointer; 
				padding: 5px; color:#f18332; font-weight:bold;}
	#logout {padding: 5px; color: #768149; font-size: 18px;
			cursor: pointer; display:inline-block; font-weight:bold;}
	#point{font-size: 18px; padding: 5px;}
         
</style>

</head>
<body>
	<header>
		<div id="mainHeader">
			<img alt="로고" src="<%= request.getContextPath() %>/images/Logo.png" onclick="location.href='<%= request.getContextPath()%>'" id="logo">
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
				<div class="nickname" id="nickname"><b><%= loginUser.getUserName() %></b></div>
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

			<div id="quicklink">
				<table>
					<tr class="boardTr">
						<td class="td" onclick="moveLink('list.food');" id="infoTd">
							<div class="imgDiv" id="imgDiv1">
								<img alt="욜로홀로솔로" src="<%= request.getContextPath() %>/images/breakfast_icon.png" id="infoImg">
								<div class="quickCircle" id="quickCircle1"><br>욜홀솔<br>로로로</div>
							</div>
						</td>
					</tr>
					
					<tr class="boardTr">
						<td class="td" onclick="moveLink('list.bo');">
							<div class="imgDiv" id="imgDiv2">
								<img alt="자유게시판" src="<%= request.getContextPath() %>/images/talk_icon.png" id="freeImg">
								<div class="quickCircle" id="quickCircle2"><br>자유<br>게시판</div>
							</div>
						</td>
					</tr>
					<tr class="boardTr">
						<td class="td" onclick="moveLink('list.gy');">
							<div class="imgDiv" id="imgDiv3">
								<img alt="물귤교환" src="<%= request.getContextPath() %>/images/orange_icon.png" id="barterImg">
								<div class="quickCircle" id="quickCircle3"><br>물귤<br>교환</div>
							</div>
						</td>
					</tr>
					<tr class="boardTr">
						<td onclick="moveLink('list.m');">
							<div class="imgDiv" id="imgDiv4">
								<img alt="혼플리마켓" src="<%= request.getContextPath() %>/images/market_icon.png" id="marketImg">
								<div class="quickCircle" id="quickCircle4"><br>혼플리<br>마켓</div>
							</div>
						</td>
					</tr>
				</table>
				
				<br>
				<img id="goTop" src="<%= request.getContextPath() %>/images/top_button2.png" style="width:40px; heigth:30px;">
				
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
					
					function moveLink(link){
						location.href="<%= request.getContextPath() %>/" + link;
					}
				
					$("#goTop").click(function() {
			            $('html, body').animate({
			                scrollTop : 0
			            }, 300);
			            return false;
			        });
					
					function goMessage(){
						<% if(loginUser != null) {%>
							window.open("<%= request.getContextPath() %>/list.re", "messgaeHome", "width=1000", "height=1000");
						<% } else {%>
							alert("로그인 후 이용해주세요.");
						<% } %>
					}
				</script>
				
			</div>
		</div>
		
		<div id="subHeader">
			<div id="boardName">
				게시판이름
			</div>
		</div>
		
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
		
		<script>
		
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
			};
      
      $(function(){
        var obTimeOut;

        var ObjectArray = new Array();
        ObjectArray[1] = "<%= request.getContextPath() %>/images/breakfast_icon.png";
        ObjectArray[2] = "<%= request.getContextPath() %>/images/travel_icon.png";

        var nObjectCnt = 0;

        // 스스로 자신을 호출하는 재귀함수 (Recursive Function)
        function ShowDefaultRotate(){
          nObjectCnt++;

          if(nObjectCnt < ObjectArray.length) {
            $("#infoImg").src = ObjectArray[nObjectCnt];		 
            obTimeOut = setTimeout("ShowDefaultRotate()", 2000); 
          } else {
            nObjectCnt = 0;
          }

        }

        function startAnimation(){
              obTimeOut = window.setTimeout(ShowDefaultRotate,100);
        }

        window.onload = startAnimation;


        // hover //
        $(function(){
          $("#imgDiv1").mouseenter(function(){
            $('#quickCircle1').css('display','block');
          }).mouseleave(function(){
            $('#quickCircle1').css('display','none');
          });

          $("#imgDiv2").mouseenter(function(){
            $('#quickCircle2').css({'display':'block','border-radius':'5%'});
          }).mouseleave(function(){
            $('#quickCircle2').css('display','none');
          });

          $("#imgDiv3").mouseenter(function(){
            $('#quickCircle3').css({'display':'block', 'border-radius':'5%'});
          }).mouseleave(function(){
            $('#quickCircle3').css('display','none');
          });

          $("#imgDiv4").mouseenter(function(){
            $('#quickCircle4').css({'display':'block','border-radius':'5%'});
          }).mouseleave(function(){
            $('#quickCircle4').css('display','none');
          });
        })

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
	</header>

</body>
</html>
