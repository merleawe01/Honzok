<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.*, java.util.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Market m = (Market)request.getAttribute("Market");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#boardTitle {
			width : 100%; height : 25px; display : inline-block;
			font-family: 'Nanum Gothic', sans-serif; padding-bottom: 5px;
			border-bottom : 1pt solid gray;}
		#titleLeft { display : inline-block; font-size: 13pt; float: left; font-weight: bold;}
		#titleRight {display : inline-block; font-size: 10pt; color: rgb(94, 94, 94); float: right;}
		#boardWriter {width : 100%; height : 40px; font-family: 'Nanum Gothic', sans-serif;
			font-size: 10pt; text-align: right; margin-top: 10px; }
		
		.input{
			width : 100%; height : 30px; border-bottom: 2px solid gray; text-align: left;
			padding-bottom: 10px; padding-top: 10px;
		}
		.left{width : 180px; display: inline-table; font-size: 13pt;}
		.must{font-size: 11pt;color: gray;}
		.right{height: 20px; font-size: 12pt;border-radius: 5px;}
		input[type=number]::-webkit-inner-spin-button,
    	input[type=number]::-webkit-outer-spin-button {-webkit-appearance: none; margin: 0;} 
    	#notice{
    		width : 100%; text-align: left; height: 150px; 
    		background-color: rgba(224, 224, 224, 0.45);font-size: 11pt;}
    	#ok{
			width : 100px; height : 40px; background-color : rgb(241, 131, 50);
			color : white; border-radius: 5px; margin: 10px; border:0px; cursor:pointer;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		#cancle{
			width : 100px; height : 40px; background-color : rgb(224, 224, 224);
			color : rgb(64, 64, 64); border-radius: 5px; margin: 10px; cursor:pointer;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		.imageArea div{display:inline-block; vertical:middle; 
					   margin-left:40px; margin-right:40px; margin-bottom:20px; 
		}
		#updateArea{float : right; }
		#updateBtn{background-color : rgb(241, 131, 50); color:white; border-radius: 5px; border:0px;
				   width:80px; height:40px; font-size:20px;}
		#deleteBtn{background-color : rgb(224, 224, 224);  color:white; border-radius: 5px; border:0px; 
				   width:80px; height:40px; margin-left:10px; font-size:20px;}
			    
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('혼플리마켓');
	</script>
	
	<div id="main">
		<form action="<%= request.getContextPath() %>/views/e_market/marketUpdateForm.jsp">
				<div id="boardTitle">
						<div id="titleLeft">여기는 제목이 나오는 칸</div>
						<div id="titleRight">2020.01.25. 23:00</div>
				</div>
					
					<div id="boardWriter">작성자 | 조회 : 10</div>
					
				<div class="form">
					<div class="imageArea">
						<div id="titleImgArea">
							<a href="<%= request.getContextPath()%>/thumbnail_uploadFiles/ <%= titleImg.getChangeName()%>" download="<%=titleImg.getOriginName() %> ">
								<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/ <%= titleImg.getChangeName() %>"width="300" height="300">
							</a>	
						</div>
					
						<div id="contentImgArea1">
								<img id="contentImg1" width="300" height="300"> 
						</div>
					</div>
					
					<!-- 내용입력 칸  -->
					<textarea class="right" name="incontent"style="width:680px; height:100px;">내용을 입력해주세요.</textarea>
					<br><br>
					<div id="updateArea">
						<input type="button" id="updateBtn"value="수정">
						<input type="button" id="deleteBtn"value="삭제">
					</div>
					<br><br>
					
					
					<div class="input">
						<div class="left"><b>판매자 정보</b></div>
					</div>
					<div class="input">
						<div class="left">거래방법 <span class="must">(필수)</span></div>안전거래
					</div>
					<div class="input">
						<div class="left">전화번호 <span class="must">(필수)</span></div>
						<input type="hidden" class="right">  <%= loginUser.getPhone()  %> 
						
					</div>
					<div class="input">
						<div class="left">이메일 <span class="must">(필수)</span></div>
						<input type="hidden" value='<%= loginUser.getEmail()  %>' class="right"> <%= loginUser.getEmail()  %>
					</div>
					
					<div class="input">
						<div class="left"><b>게시글 작성</b></div>
					</div>
					
					<!-- 물품명 -->
					<div class="input">
						<div class="left">물품명 <span class="must">(필수)</span></div>
						<input type="text" name="postTitle" maxlength="16" placeholder="제목이 되는 부분입니다." class="right" style="width: 280px;">
					</div>
					
					<!-- 상태 -->
					<div class="input">
						<div class="left">상태 <span class="must">(필수)</span></div>
						<input type="radio" name="status" value="A급">A급 <input type="radio" name="status" value="B급">B급<input type="radio" name="status" value="C급">C급
						<span class="must">ex) A급 : 5% B급 : 10% C급 : 15%의 손상정도</span>
					</div>
					
					<!-- 가격 -->
					<div class="input">
						<div class="left">가격<span class="must">(필수)</span></div>
						<input type="text" name="price" class="right" style="width: 100px;">원
					</div>	
					
					<!-- 사용기한 -->
					<div class="input">
						<div class="left">사용기한<span class="must">(필수)</span></div>
						<input type="text" name="useDate" class="right" style="width: 100px;"><span class="must">예) 약 6개월, 약 1년 etc</span>
					</div>
					
					<!--기타    -->		
					<div class="input">
						<div class="left">기타<span class="must">(필수)</span></div>
						<input type="text" name="etc" placeholder="내용을 입력해주세요."  class="right" style="width: 350px;">
					</div>	
				</div>
					<br>
		
				<div id="caution">
					* 거래전 필독! 주의하세요!<br>
					* 관리자 중재하에 거래되므로 배송기간가지 약 1주일 소요될 수 있습니다.
				</div>
				<br>
				
				<div align="center">
					<% if(loginUser != null && loginUser.getNickName().equals(b.getbWriter())){ %>
					<input id = "threebu" type="button" value="구매"> 
					<input id = "fourbu"type="button" onclick="location.href='<%= request.getContextPath() %>/list.m'"value="목록으로">
					<% } %>
				</div>
		</form>
	</div>
</body>
</html> --%>