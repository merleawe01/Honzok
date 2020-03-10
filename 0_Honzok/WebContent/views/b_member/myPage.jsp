<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member"%>
   <%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String msg = (String)request.getAttribute("msg"); 
%>
    <%
    
    Member member = (Member)request.getAttribute("member");
	String userId = member.getUserId();
	String userPwd = member.getUserPwd();
	String userName = member.getUserName();
	String nickName = member.getNickName();
	int postalCode = member.getPostalCode();
	String bAddr =member.getbAddr() != null ? member.getbAddr() : "-";
	String lAddr = member.getlAddr() != null ? member.getlAddr() : "-";
	String phone = member.getPhone() != null ? member.getPhone() : "-";
	String email = member.getEmail() != null ? member.getEmail() : "-";
	int point = member.getPoint();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
</script>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
	body {overflow-y: scroll;}
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
			height : 100%;
			width : auto;
			float : left;
		}
		#list {
			height : 100%;
			width : auto;
			float : right;
		}
		#icon {
			height : 100%;
			width : auto;
			float : right;
		}
		#nickname {
			float : right;
			padding : 10px;
			color: rgb(241,131,50);
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 12pt;
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
		#main{
			width : 100%;
			text-align: center;
			height : 1170px;
			
		}
		
		#realMain {
			display : inline-table;
			
			width : 1170px;
			display : inline-table;
			height : 1100px;
			/* 현재 임시값 입력해놓음 */
			margin-left : 40px; 
		}
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
	#btns{margin : 20px; display : inline-table;}
	#nickname:hover{color:rgb(118,129,73); cursor:pointer;}
	#updateBtn{width: 100px; height: 40px; background-color: #f18332; color: white; font-weight: bold; cursor:pointer;
		margin: auto; font-size: 14pt; line-height: 40px; display: inline-table; text-align: center; border: 0; border-radius: 5px;}
	#cancle{width: 100px; height: 40px; background-color: #5f5f5f; color: white; font-weight: bold; cursor:pointer;
		margin: auto; line-height: 40px; display: inline-table; text-align: center; border: 0; border-radius: 5px;}
	input[name^=addr]{width:300px;}
</style>
<title>Insert title here</title>


</head>
<body>

<header>
		<div id="mainHeader"><a href="index.jsp">	
			<img alt="로고" src="images/Logo.png" id="logo"></a>
			
			<img alt="메뉴" src="images/list.png" id="list">
			
			<div id="nickname" onclick="location.href='<%= request.getContextPath()%>/myPage.me'"><%= loginUser.getUserName() %>님</div>
			
			
			</div>
	
		
		<div id="subHeader">
			<div id="boardName">
				마이페이지
			</div>
		</div>
	</header>

	<section>

		<div id="main">

			<div id="realMain">
			<form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm" >
				<div id="info">
					<div class="input" style="font-size: 25px; margin:10px;"> <b>기본 정보</b></div>
					<div class="border"></div><!-- 구분선 -->

					<!-- 이름 -->
					<div class="input">
						<div class="left">이름 <span class="must">(필수)</span></div>
						<input type="text" class="right"  id="userName" maxlength="8" name="userName" value="<%= userName %>"  required >
					</div>
					<div class="border"></div><!-- 구분선 -->

					<!-- 아이디 -->
					<div class="input">
						<div class="left">아이디</div>
						<span class="right"><input type="hidden" name="joinUserId" value="<%= userId %>"><%= userId %></span>
					</div>
					<div class="border"></div>
					
					<!-- 비밀번호 -->
					<div class="input">
						<div class="left">비밀번호 <span class="must">(필수)</span></div>
						<input type="password"  class="right" name="userPwd" id="userPwd" required>
							<a href="views/b_member/pwdUpdateForm.jsp"><span id="changePwd">비밀번호 변경하기</span></a>
					</div>
					<div class="border"></div>
					
					<!-- 비밀번호 확인 -->
					<div class="input">
						<div class="left">비밀번호 확인 <span class="must">(필수)</span></div>
						<input type="password" class="right" maxlength="16" name="confirmPwd" id="confirmPwd" required >
						<span id="pwdCheck" style="margin-left:10px;"></span>
					</div>
			
					
					<script>
					
					$('#confirmPwd').focusout(function() {
						var pwd1 = $("#userPwd").val();
						var pwd2 = $("#confirmPwd").val();
						if (pwd1 != "" || pwd2 != "") {
							if (pwd1 == pwd2) {
								$("#alert-success")
										.css('display',
												'inline-block');
								$("#alert-danger").css(
										'display',
										'none');
							} else {
								alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
								$("#alert-success")
										.css('display',
												'none');
								$("#alert-danger").css(
										'display',
										'inline-block');
							}
						}
					});
					
					</script>
					
					<div class="border"></div>
					
					<!-- 주소 -->
					<div class="input">
						<div class="left">주소 <span class="must">(필수) </span></div>
						<table class="addrTable">
							<tr>
								<td colspan="2">
								<input type="text" class="right" id="postalCode" name="postalCode" value="<%=postalCode %>"  required>
								<input type="button" onclick="goPopup()" style="margin-left:5px;" value="우편번호"/>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" class="right" id="bAddr" name="bAddr" value="<%=bAddr %>"  required/>
									<span class="addr">기본 주소</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" class="right" id="lAddr" name="lAddr"  value="<%=lAddr %>"  required/>
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
							document.getElementById("bAddr").value = roadAddrPart1;
							document.getElementById("lAddr").value = addrDetail;
							document.getElementById("postalCode").value = zipNo;
						}
					</script>
					<div class="border"></div>
					
					<!-- 핸드폰 번호 -->
					<div class="input">
						<div class="left">핸드폰 번호</div>
						
						<input type="text" class="right" style="width: 120px;" maxlength="11" name="phone" id="phone" value="<%=phone %>"> 
					
					</div>
					<script>

						$(document).ready(function(){ 
						    $("input#phone").blur(function(){
						    	var num = $("#phone").val();
						    	blur(num)
						    });
						    $("input#phone").click(function(){
						    	var num = $("#phone").val();
						    	focus(num);
						    });
						});

						function focus(num) {
							num = num.replace(/[^0-9]/g, '');
							$("#phone").val(num);
						}
						
						function blur(num) {
							num = num.replace(/[^0-9]/g, '');
							var tmp = '';
							tmp += num.substr(0, 3);
							tmp += '-';
							tmp += num.substr(3, 4);
							tmp += '-';
							tmp += num.substr(7);
							$("#phone").val(tmp);
						}
						
						var msg = "<%= msg %>";
						$(function(){
							if(msg != "null"){
								alert(msg);
							}
						});
					</script>
					<div class="border"></div>
					
					<!-- 이메일 -->
					<div class="input">
						<div class="left">이메일 <span class="must">(필수)</span></div>
						<input type="text" class="right" name="email" id="email" value="<%=email %>"  required>
					</div>
					<div class="border"></div>
					
					<!-- 닉네임 -->
					<div class="input">
						<div class="left">닉네임</div>
						<input type="text" class="right" name="nickName" value="<%=nickName %>">
					</div>
					<div class="border"></div>
					<div class="input">
						<div class="left">포인트 <img src="images/orange.png" height="25px" width="25px"></div>
						<span class="right"><input type="hidden" class="right" name="point" value="<%=point %>"><%=point %></span>
					</div>
					<div class="input">
						<div class="left"></div>
						<div class="right" onclick="deleteMember();">탈퇴하기</div>
					</div>
				</div>
				
				<input id="updateBtn" type="submit" value="적용" > 
					
				<div id="cancle" onclick="location.href='javascript:history.go(-1)'">취소하기</div>
				
				
				</form>
			</div>

		</div>

	</section>
	<script>
		function deleteMember(){
			var bool = confirm("정말로 탈퇴하시겠습니까?");
			if(bool){
				$('#updateForm').attr('action', '<%= request.getContextPath()%>/delete.me');
				$('#updateForm').submit();
			}
		}
	
	</script>

</body>
</html>