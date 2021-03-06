<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="b_member.model.vo.Member, java.util.ArrayList, e_market.model.vo.*"%>
<%
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	String titleImg = request.getParameter("titleImage");
	String contentImg1 = request.getParameter("contentImage1"); 
	
	int postNo = Integer.parseInt(request.getParameter("postNo"));
	String title = request.getParameter("postTitle");
	String content = request.getParameter("incontent");
	String status = request.getParameter("status");
	int price = Integer.parseInt(request.getParameter("price"));
	String useDate = request.getParameter("useDate");
	String etc = request.getParameter("etc");
	
	String check1 ="";
	String check2 ="";
	String check3 ="";

	if(status.equals("A")){
		check1 = "checked";
	} else if(status.equals("B")){
		check2 = "checked";
	} else if(status.equals("C")){
		check3 = "checked";
	}
	
	ArrayList<String> images = new ArrayList<String>();
	 for(int i = 1; i < 2; i++){
			images.add(request.getParameter("detailImg" + i) == null ? "" : "src=" + request.getContextPath() + "/thumbnail_uploadFiles/" + request.getParameter("detailImg" + i));
		}
	
	ArrayList<String> imgIds = new ArrayList<String>();
	for(int i = 0; i < 2; i++){
		imgIds.add(request.getParameter("detailImgId" + i) == null ? "" : request.getParameter("detailImgId" + i));
	}
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
    	#upBtn{
			width : 100px; height : 40px; background-color : rgb(241, 131, 50); font-size : 18px;
			color : white; border-radius: 5px; margin: 10px; border:0px; cursor:pointer;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		#cancle{
			width : 100px; height : 40px; background-color : rgb(224, 224, 224); font-size : 18px;
			color : rgb(64, 64, 64); border-radius: 5px; margin: 10px; cursor:pointer;
			line-height: 40px; font-weight: bold; display: inline-table; text-align:center;
		}
		.imageArea div{display:inline-block; vertical:middle; 
					   margin-left:40px; margin-right:40px; margin-bottom:20px; 
		}
		#titleImgArea{cursor : pointer;}
		#contentImgArea1{cursor : pointer;}			   
		#size{font-size:15px; color : gray;}
		
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('혼플리마켓');
	</script>
	
	
	<div id="main">
	<form action="<%= request.getContextPath() %>/update.m" method="post" encType="multipart/form-data">
			<div class="form">
					<div class="imageArea">
						<div id="titleImgArea">
								<img id="titleImg" width="300" height="300" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg %>">
								<input type="hidden" id="detailImgId0" name="detailImgId0" value="<%= imgIds.get(0)  %>"> 
								<input type="hidden" id="cTitle" name="cTitle">
						</div>
			
						<div id="contentImgArea1">
								<img id="contentImg1" width="300" height="300" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= contentImg1 %>"> 
								<input type="hidden" id="detailImgId1" name="detailImgId1" value="<%= imgIds.get(1) %>"> 
								<input type="hidden" id="cContent1" name="cContent1">
						</div>
					</div>
					<div id="size">※사진은 꼭 등록해주세요.※</div>
					<br><br>
					
					<div class="input">
						<div class="left" style="font-size:25px;"><b>판매자 정보</b></div>
					</div>
					<div class="input">
						<div class="left"><b>거래방법</b><span class="must">(필수)</span></div>안전거래
					</div>
					<div class="input">
						<div class="left"><b>전화번호</b> <span class="must">(필수)</span></div>
						<input type="hidden" value='<%= phone%>' class="right"> <%= phone  %>
						
					</div>
					<div class="input">
						<div class="left"><b>이메일</b> <span class="must">(필수)</span></div>
						<input type="hidden" value='<%= email %>' class="right"> <%= email %>
					</div>
					<br><br>
					
					<div class="input">
						<div class="left" style="font-size:25px;"><b>게시글 수정</b></div>
					</div>
					
					<!-- 물품명 -->
					<div class="input">
						<div class="left"><b>물품명</b> <span class="must">(필수)</span></div>
						<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
						<input type="text" name="postTitle" maxlength="16" class="right" style="width: 280px;" value="<%= title %>">
					</div>
					
					<!-- 상태 -->
					<div class="input">
						<div class="left"><b>상태</b> <span class="must">(필수)</span></div>
						<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
						<input type="checkbox"  id="status" name="status" class="sta" value="A" <%= check1 %>>A급 &nbsp;
						<input type="checkbox"  id="status" name="status" class="sta" value="B" <%= check2 %>>B급 &nbsp;
						<input type="checkbox"  id="status" name="status" class="sta" value="C" <%= check3 %>>C급 &nbsp;
						<span class="must">ex) A급 : 5% B급 : 10% C급 : 15%의 손상정도</span>
					</div>
					<script>
					$(function(){
			               var sta = "<%= status %>";
			               for(var i in sta) {
			                  switch(sta[i]){
			                  case "A" : $('.sta')[0].checked = true; break;
			                  case "B" : $('.sta')[1].checked = true; break;
			                  case "C" : $('.sta')[2].checked = true; break;
			                  }
			               }
			            })
					</script>
					
					
					<!-- 가격 -->
					<div class="input">
						<div class="left"><b>가격</b><span class="must">(필수)</span></div>
						<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
						<input type="text" name="price" class="right" style="width: 100px;" value="<%= price %>">원
					</div>	
					
					<!-- 사용기한 -->
					<div class="input">
						<div class="left"><b>사용기한</b><span class="must">(필수)</span></div>
						<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
						<input type="text" name="useDate" class="right" style="width: 100px;" value="<%= useDate %>"><span class="must">예) 약 6개월, 약 1년 etc</span>
					</div>
					
					<!--기타    -->		
					<div class="input">
						<div class="left"><b>기타</b><span class="must">(필수)</span></div>
						<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
						<input type="text" name="etc" class="right" style="width: 350px;" value="<%= etc %>">
					</div>	
					<br>
					<!-- 내용입력 칸  -->
					<textarea class="right" name="incontent"style="width:900px; height:200px; font-size:20px; resize: none;"><%= content %></textarea>
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
						<button type="submit" id="upBtn">수정완료</button>
						<div id="cancle" onclick="location.href='<%= request.getContextPath()%>/list.m'">취소</div>
					</div>
			</div>
		</form>	
	</div>
	
	<script>
		$('#upBtn').click(function(){
			var t = $("#titleImg").attr('src');
			var c1 = $("#contentImg1").attr('src');
			
			
			if(typeof(t) != 'undefined'){
				$("#cTitle").val($("#titleImg").attr('src').substring(0, 4));
			}
			if(typeof(c1) != 'undefined'){
				$("#cContent1").val($("#contentImg1").attr('src').substring(0, 4));
			}
			
			$('.form').parent().submit();
		});
		
		
	</script>
</body>
</html>