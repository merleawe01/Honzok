<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			width : 100px; height : 40px; background-color : rgb(241, 131, 50);
			color : white; border-radius: 5px; margin: 10px;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		#cancle{
			width : 100px; height : 40px; background-color : rgb(224, 224, 224);
			color : rgb(64, 64, 64); border-radius: 5px; margin: 10px;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		
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
				
					<div class="input">
						<div class="left"><b>판매자 정보</b></div>
					</div>
					<div class="input">
						<div class="left">거래방법 <span class="must">(필수)</span></div>안전거래
					</div>
					<div class="input">
						<div class="left">전화번호 <span class="must">(필수)</span></div>
						<select class="right" style="height: 30px;">
	  						<option value="010">010</option>
	  						<option value="011">011</option>
	  						<option value="016">016</option>
	  						<option value="017">017</option>
	  						<option value="018">018</option>
	  						<option value="019">019</option>
						</select> - 
						<input type="number" class="right" style="width: 80px;"> - 
						<input type="number" class="right" style="width: 80px;"> 
						
					</div>
					<div class="input">
						<div class="left">이메일 <span class="must">(필수)</span></div>
						<input type="text" maxlength="16" placeholder="이메일을 입력해주세요." class="right" style="width: 200px;"> @ 
						<select class="right" style="height: 30px;">
	  						<option value="직접입력">직접입력</option>
	                 		<option value="daum.net">daum.net</option>
	                 		<option value="empal.com">empal.com</option>
	                 		<option value="gmail.com">gmail.com</option>
	                 		<option value="hanmail.net">hanmail.net</option>
	                 		<option value="msn.com">msn.com</option>
	                 		<option value="naver.com">naver.com</option>
	                 		<option value="nate.com">nate.com</option>
						</select>
						<input type="text" maxlength="16" class="right" style="width: 150px;">
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
						<input type="text" name="price" placeholder="_______원" class="right" style="width: 100px;">
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
						
					<!-- 파일첨부, 사진 -->
						<input type="button" name="file" value="파일첨부"><input type="button" name="image" value="사진">
					<br>
					
					<!-- 내용입력 칸  -->
					<textarea placeholder="내용을 입력해주세요." class="right" style="width:700px; height:300px;"></textarea>
				
					<br><br>
					
					<br>
					
					<div>
						<button type="submit" id="ok">확인</button>
						<div id="cancle" style="cursor:pointer" onclick="location.href='<%= request.getContextPath()%>/list.m'">취소</div>
					</div>
					
			</div>
		</form>
	
	</div>
</body>
</html>