<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member"%>
<%
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
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
			width : 100px; height : 40px; background-color : rgb(241, 131, 50); font-size : 17px;
			color : white; border-radius: 5px; margin: 10px; border:0px; cursor:pointer;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		#cancle{
			width : 100px; height : 40px; background-color : rgb(224, 224, 224); font-zise : 17px;
			color : rgb(64, 64, 64); border-radius: 5px; margin: 10px; cursor:pointer;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		.imageArea div{display:inline-block; vertical:middle; 
					   margin-left:40px; margin-right:40px; margin-bottom:20px; 
		}
		#titleImgArea{cursor : pointer;}
		#contentImgArea1{cursor : pointer;			   
		
		
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('혼플리마켓');
	</script>
	
	<div id="main">
		<form action="<%= request.getContextPath() %>/insert.m" method="post" encType="multipart/form-data">
			<div class="form">
					<div class="imageArea">
						<div id="titleImgArea">
								<img id="titleImg" width="300" height="300">
						</div>
					
						<div id="contentImgArea1">
								<img id="contentImg1" width="300" height="300"> 
						</div>
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
						<input type="hidden" value='<%= loginUser.getPhone()  %>' class="right"> <%= loginUser.getPhone()  %>
						
					</div>
					<div class="input">
						<div class="left"><b>이메일</b> <span class="must">(필수)</span></div>
						<input type="hidden" value='<%= loginUser.getEmail()  %>' class="right"> <%= loginUser.getEmail()  %>
					</div>
					<br><br>
					
					<div class="input">
						<div class="left" style="font-size:25px;"><b>게시글 작성</b></div>
					</div>
					
					<!-- 물품명 -->
					<div class="input">
						<div class="left"><b>물품명</b> <span class="must">(필수)</span></div>
						<input type="text" name="postTitle" maxlength="16" placeholder="제목이 되는 부분입니다." class="right" style="width: 280px;">
					</div>
					
					<!-- 상태 -->
					<div class="input">
						<div class="left"><b>상태</b> <span class="must">(필수)</span></div>
						<input type="checkbox" name="status" value="A">A급 &nbsp;
						<input type="checkbox" name="status" value="B">B급&nbsp;
						<input type="checkbox" name="status" value="C">C급&nbsp;
						<span class="must">ex) A급 : 5% B급 : 10% C급 : 15%의 손상정도</span>
					</div>
					
					<!-- 가격 -->
					<div class="input">
						<div class="left"><b>가격</b><span class="must">(필수)</span></div>
						<input type="text" name="price" class="right" style="width: 100px;">원
					</div>	
					
					<!-- 사용기한 -->
					<div class="input">
						<div class="left"><b>사용기한</b><span class="must">(필수)</span></div>
						<input type="text" name="useDate" class="right" style="width: 100px;"><span class="must">예) 약 6개월, 약 1년 etc</span>
					</div>
					
					<!--기타    -->		
					<div class="input">
						<div class="left"><b>기타</b><span class="must">(필수)</span></div>
						<input type="text" name="etc" placeholder="내용을 입력해주세요."  class="right" style="width: 350px;">
					</div>
					<br><br>
					<!-- 내용입력 칸  -->
					<textarea class="right" name="incontent"style="width:900px; height:200px;">내용을 입력해주세요.</textarea>	
					<br>
				<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
			</div>
			<script>
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						
					});		
						
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
								
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								
								}
							}
								
							reader.readAsDataURL(value.files[0]);
						}
					}
				
			</script>
				<div>
					<button type="submit" id="ok">확인</button>
						<div id="cancle" onclick="location.href='<%= request.getContextPath()%>/list.m'">취소</div>
				</div>
			</div>
		</form>	
	</div>
		
			
	
</body>
</html>