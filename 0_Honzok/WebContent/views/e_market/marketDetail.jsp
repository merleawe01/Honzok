 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.*, java.util.*, e_market.model.vo.*"%>
<%
	Market m = (Market)request.getAttribute("market");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
	Attachment contentImg = fileList.get(1);
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
				   width:80px; height:40px; font-size:15px; cursor:pointer; font-weight: bold; line-height: 40px;}
		#deleteBtn{background-color : rgb(224, 224, 224); color : rgb(64, 64, 64); border-radius: 5px; border:0px; 
				   width:80px; height:40px; margin-left:10px; font-size:15px; cursor:pointer; font-weight: bold; line-height: 40px;}
		#threebu{text-align : center; font-size : 17px; width : 100px; height : 40px;
			     background-color : rgb(241, 131, 50); color : white; border-radius: 5px;
			     border: 0; font-weight: bold; line-height: 40px; cursor:pointer;}
		#fourbu{text-align : center; font-size : 17px; width : 100px; height : 40px;
			    background-color : rgb(224, 224, 224); color : rgb(64, 64, 64);  border-radius: 5px;
			    border: 0; line-height: 40px; font-weight: bold; cursor:pointer;}				   
		#caution{background : lightgray; text-align:left; font-size: 18px;}	    
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('혼플리마켓');
	</script>
	
	<div id="main">
		<form action="<%= request.getContextPath() %>/views/e_market/marketUpdate.jsp" id="marketDetailForm">
				<div id="boardTitle">
						<div id="titleLeft"><%= m.getPostTitle() %></div>
						<div id="titleRight"><%= m.getWriteDate() %></div>
				</div>
					
					<div id="boardWriter"><%=m.getNickname() %> | 조회 : <%=m.getViewCount() %></div>
					
				<div class="form">
					<div class="imageArea">
						<div id="titleImgArea">
							<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
							<a href="<%= request.getContextPath()%>/thumbnail_uploadFiles/<%= titleImg.getChangeName()%>" download="<%=titleImg.getChangeName() %> ">
								<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getChangeName() %>"width="300" height="300">
								<input type="hidden" value="<%= titleImg.getChangeName() %>" name="titleImage"> 
								<input type="hidden" value="<%= titleImg.getImgId() %>" name="detailImgId0"> 
							</a>	
						</div>
					
						<div id="contentImgArea1">
							<a href="<%= request.getContextPath()%>/thumbnail_uploadFiles/<%= contentImg.getChangeName()%>" download="<%=contentImg.getOriginName() %> ">
								<img id="contentImg1"src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= contentImg.getChangeName() %>" width="300" height="300">
								<input type="hidden" value="<%= contentImg.getChangeName() %>" name="contentImage1"> 
								<input type="hidden" value="<%= contentImg.getImgId() %>" name="detailImgId1">
							</a>
						</div>
					</div>
					
					<br><br>
					<div id="updateArea">
						<% if(loginUser != null  && loginUser.getNickName().equals(m.getNickname()) ){ %>
						<input type="submit" id="updateBtn"value="수정">
						<input type="button" onclick="deleteMarket();"id="deleteBtn"value="삭제">
						
						<% } %>	
					</div>
					<br><br>
					
					
					<div class="input">
						<div class="left" style="font-size:25px;"><b>판매자 정보</b></div>
					</div>
					<div class="input">
						<div class="left"><b>거래방법</b> <span class="must">(필수)</span></div>안전거래
					</div>
					<div class="input">
						<div class="left"><b>전화번호</b> <span class="must">(필수)</span></div>
						<input type="hidden" class="right" name="phone" value="<%= m.getPhone()%>" >  <%= m.getPhone()%> 
						
					</div>
					<div class="input">
						<div class="left"><b>이메일</b> <span class="must">(필수)</span></div>
						<input type="hidden" name= "email" value='<%= m.getEmail()  %>' class="right"> <%= m.getEmail() %>
					</div>
					<br><br>
					<div class="input">
						<div class="left" style="font-size:25px;"><b>게시글 작성</b></div>
					</div>
					
					<!-- 물품명 -->
					<div class="input">
						<div class="left"><b>물품명</b> <span class="must">(필수)</span></div>
						<input type="hidden" name="postTitle" maxlength="16" value="<%= m.getPostTitle() %>" class="right" style="width: 280px;"><%= m.getPostTitle() %>
					</div>
					
					<!-- 상태 -->
					<div class="input">
						<div class="left"><b>상태</b> <span class="must">(필수)</span></div>
						<input type="hidden" name="status" value="<%= m.getItemStatus()%>"><%= m.getItemStatus()%>급
						
					</div>
					
					<!-- 가격 -->
					<div class="input">
						<div class="left"><b>가격</b><span class="must">(필수)</span></div>
						<input type="hidden" name="price" class="right" style="width: 100px;" value="<%= m.getItemPrice()%>"><%= m.getItemPrice()%>원
					</div>	
					
					<!-- 사용기한 -->
					<div class="input">
						<div class="left"><b>사용기한</b><span class="must">(필수)</span></div>
						<input type="hidden" name="useDate" class="right" style="width: 100px;" value="<%= m.getUseDate()%>"><%= m.getUseDate()%>
					</div>
					
					<!--기타    -->		
					<div class="input">
						<div class="left"><b>기타</b><span class="must">(필수)</span></div>
						<input type="hidden" name="etc" class="right" style="width: 350px;" value="<%= m.getEtc()%>"><%= m.getEtc()%>
					</div>	
				</div>
					<br>
				
				<!-- 내용입력 칸  -->
					<textarea class="right" name="incontent"style="width:900px; height:200px;" style="resize: none;" readonly><%= m.getContent() %></textarea>
				<br><br>
				<div id="caution">
					<p>
						
						* 거래전 필독! 주의하세요!
						<br>
						* 관리자 중재하에 거래되므로 배송기간가지 약 1주일 소요될 수 있습니다.
					</p>
				</div>
				<br>
				
				<div align="center">
					<% if(loginUser != null){ %>
					<button id = "threebu" type="button" onclick="buyMarket()" value="구매">구매</button>
					
					<button id = "fourbu"type="button" onclick="location.href='<%= request.getContextPath() %>/list.m'" value="목록으로">목록으로</button>
					<% } %>
				</div>
		</form>
		<script>
				function deleteMarket(){
					var bool = confirm("정말로 삭제하시겠습니까?");
					
					if(bool){
						location.href='<%= request.getContextPath()%>/delete.m?postNo=' + <%= m.getPostNo()%>;
					}
				}
				
				 function buyMarket(){
					var buy = confirm("정말로 구매하시겠습니까?");
					
					if(buy){
						/* location.href='views/e_market/marketBuy.jsp' */
						location.href='<%= request.getContextPath()%>/buy.m?postNo=' + <%= m.getPostNo()%>;
				
					}
				} 
				
				 
		          
		</script>
		
	</div>
</body>
</html> 