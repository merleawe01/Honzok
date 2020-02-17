<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8") ; %>
    <%

	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String nickName = request.getParameter("nickName");
	String posttalCode = request.getParameter("posttalCode").equals("-") ? "" : request.getParameter("posttalCode");
	String bAddr = request.getParameter("bAddr").equals("-") ? "" : request.getParameter("bAddr");
	String lAddr = request.getParameter("lAddr").equals("-") ? "" : request.getParameter("lAddr");
	String phone = request.getParameter("phone").equals("-") ? "" : request.getParameter("phone");
	String email = request.getParameter("email").equals("-") ? "" : request.getParameter("email");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="static/includeHTML.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="static/boardHeaderCSS.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
	body {overflow-y: scroll;}
	#main {width: 100%; text-align: center; overflow: hidden; height: auto;}
	#realMain {width: 900px; display: inline; min-height: 600px; overflow: hidden; height: auto;
				margin-left:40px;}
	#info{margin: 50px auto; width:950px; background-color: #f0f0f0; border: 2px solid #b0b0b0;}
	.input{ /* height: 30px;  */ text-align: left; padding:10px auto; margin:10px auto;}
	.border{display: block; width: 940px; border-bottom: 2px solid #d3d3d3; margin:5px auto;}
	.left{margin-left: 20px; width : 180px; display: inline-table; font-size: 13pt;}
	.must{font-size: 11pt; color: gray;}
	.right{height: 25px; font-size: 12pt; border:0px; border-radius:3px;}
	#changePwd{font-weight: 550; color:rgb(118,129,73); margin-left:10px}
	#changePwd:hover{color:#f18332; cursor:pointer;}
	a{text-decoration: none; cursor:pointer;}
	table{display: inline; vertical-align:top;}
	.addr{font-size:13px; margin-left:5px;}
	#ok{width: 100px; height: 40px; background-color: #f18332; color: white; font-weight: bold; cursor:pointer;
		margin: 10px; line-height: 40px; display: inline-table; text-align: center; border: 0; border-radius: 5px;}
	#cancle{width: 100px; height: 40px; background-color: #5f5f5f; color: white; font-weight: bold; cursor:pointer;
		margin: 10px; line-height: 40px; display: inline-table; text-align: center; border: 0; border-radius: 5px;}
	input[name^=addr]{width:300px;}
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../a_common/Main.jsp" %>
<header>
		<div id="mainHeader">
			<a href="Main.html"><img alt="로고" src="image/Logo.png" id="logo"></a>
			<img alt="메뉴"src="image/list.png" id="list">

			<div id="nickname">닉네임가져올부분</div>

			<img alt="아이콘" src="image/blanket.png" id="icon">
		</div>

		<div id="subHeader">
			<div id="boardName">마이페이지</div>
		</div>
	</header>

	<section>

		<div id="main">

			<div id="realMain">
				<div id="info">
					<div class="input" style="font-size: 25px; margin:10px;"> <b>기본 정보</b></div>
					<div class="border"></div><!-- 구분선 -->

					<!-- 이름 -->
					<div class="input">
						<div class="left">이름 <span class="must">(필수)</span></div>
						<input type="text" class="right" maxlength="8" placeholder="이름" value="김혼족" name="userName" id="userName">
					</div>
					<div class="border"></div><!-- 구분선 -->

					<!-- 아이디 -->
					<div class="input">
						<div class="left">아이디</div>
						<span class="right">honzok</span>
					</div>
					<div class="border"></div>
					
					<!-- 비밀번호 -->
					<div class="input">
						<div class="left">비밀번호 <span class="must">(필수)</span></div>
						<input type="password" class="right" maxlength="16" name="userPwd" id="userPwd">
							<a href=""><span id="changePwd">비밀번호 변경하기</span></a>
					</div>
					<div class="border"></div>
					
					<!-- 비밀번호 확인 -->
					<div class="input">
						<div class="left">비밀번호 확인 <span class="must">(필수)</span></div>
						<input type="password" class="right" maxlength="16" name="confirmPwd" id="confirmPwd" onkeyup="confirmPwd();">
						<span id="pwdCheck" style="margin-left:10px;"></span>
					</div>
					<script>
					var pwd = document.getElementById("userPwd");
					var cPwd = document.getElementById("confirmPwd");
					
						function confirmPwd() {
							var check = document.getElementById("pwdCheck");
	
							if (cPwd.value != pwd.value) {
								pwdCheck.innerHTML = "비밀번호가 일치하지 않습니다.";
								pwdCheck.style.color = "red";
							} else if (cPwd.value == ""){
								pwdCheck.innerHTML = "";
							} else{
								pwdCheck.innerHTML = "비밀번호가 일치합니다.";
								pwdCheck.style.color = "#768149";
							}
						}
					</script>
					<div class="border"></div>
					
					<!-- 주소 -->
					<div class="input">
						<div class="left">주소 <span class="must">(필수)</span></div>
						<table class="addrTable">
							<tr>
								<td colspan="2">
								<input type="text" class="right" id="zipNo" name="zipNo" placeholder="우편번호" readonly>
								<button onclick="goPopup()" style="margin-left:5px;">우편번호</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" class="right" id="addrBasic" name="addrBasic" readonly/>
									<span class="addr">기본 주소</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" class="right" id="addrDetail" name="addrDetail" readonly>
									<span class="addr">나머지 주소</span>
								</td>
							</tr>
							
						</table>
						
					</div>
					<!-- 우편번호 찾기 script -->
					<script>
						function goPopup(){
							// 주소검색을 수행할 팝업 페이지를 호출합니다.
							// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
							var pop = window.open("popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
						}
						function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
							// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
							document.getElementById("addrBasic").value = roadAddrPart1;
							document.getElementById("addrDetail").value = addrDetail;
							document.getElementById("zipNo").value = zipNo;
						}
					</script>
					<div class="border"></div>
					
					<!-- 핸드폰 번호 -->
					<div class="input">
						<div class="left">핸드폰 번호</div>
						<select class="right" style="height: 30px;" name="phone1" id="phone1">
	  						<option value="010">010</option>
	  						<option value="011">011</option>
	  						<option value="016">016</option>
	  						<option value="017">017</option>
	  						<option value="018">018</option>
	  						<option value="019">019</option>
						</select> - 
						<input type="text" class="right" style="width: 80px;" maxlength="4" name="phone2" id="phone2"> - 
						<input type="text" class="right" style="width: 80px;" maxlength="4" name="phone3" id="phone3"> 
					</div>
					<div class="border"></div>
					
					<!-- 이메일 -->
					<div class="input">
						<div class="left">이메일 <span class="must">(필수)</span></div>
						<input type="text" class="right" name="email" id="email">
					</div>
					<div class="border"></div>
					
					<!-- 닉네임 -->
					<div class="input">
						<div class="left">닉네임</div>
						<input type="text" class="right" value="빛이나는솔로">
					</div>
				</div>
				
				<button onclick="saveInfo();" id="ok">적용</button>
				<button onclick="cancleInfo();" id="cancle">취소</button>
				
				<script>
					function saveInfo(){
						
					}
				</script>
			</div>

		</div>

	</section>

	<footer> </footer>

</body>
</html>