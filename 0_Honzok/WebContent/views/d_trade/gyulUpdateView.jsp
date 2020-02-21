<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	int max = Integer.parseInt(request.getParameter("max"));
	int min = Integer.parseInt(request.getParameter("min"));
	String titleImg = request.getParameter("titleImage");
	String contentImg = request.getParameter("detailImg1");
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
<style>
		#insert { 
			width : 1170px;
		}

		#contentImgArea2{
			margin-left : 100px;
		}
		
		
		#contentImgArea1:hover, #contentImgArea2:hover{cursor:pointer;}
		
		#content_table{
			border-collapse: collapse;
			border-spacing: 0;
			text-align : left;
		}

		#content_table td{
			border-bottom : 3px solid gray;
		}

		#title{
			width : 150px;
			height : 60px;
		}		
		#start{ height : 60px; }
		#buy{ height : 60px; }
		#time{ height : 60px; }
		#content{ height : 400px; }
		
		#input_contents{ width : 750px;}
		
		.content_title{
			font-weight : bold;
		}
		
		.must{
			color : gray;
			font-size : 12px;
		}
		
		
		#input_title{ width:400px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_start{ width:200px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_buy{ width:200px; height:30px; border-radius : 5px; border : 1px gray solid; }
		#input_time{ font-weight : bold; font-size : 25px; }
		#input_content{ width:750px; height:350px; border-radius : 5px; border : 1px gray solid; }

				
		#btn{ margin-top : 50px;}
		
		#onebu{text-align : center;
				  font-size : 15pt;
				  width : 100px;
				  height : 40px;
			      background-color : rgb(241, 131, 50);
			      color : white;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      line-height: 40px;
			      cursor:pointer;
		}
		#twobu{text-align : center;
				  font-size : 15pt;
				  width : 100px;
				  height : 40px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      line-height: 40px;
			      font-weight: bold;
			      margin-left:50px;
			      cursor:pointer;
		}
</style>
</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('물귤교환');
	</script>
	
	<div id = "main">
		
		<div>
			<form action="<%= request.getContextPath() %>/update.gy" method="post" encType="multipart/form-data">
			
				<div id = "insert">
				
					<table style="margin-left: auto; margin-right: auto;">
						<tr>
							<td>
							<div id="contentImgArea1">
								<img id="titleImg" width="300" height="300" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg %>">
								<input type="hidden" id="detailImgId0" name="detailImgId0" value="<%= imgIds.get(0) %>"> 
								<input type="hidden" id="cTitle" name="cTitle">
							</div>
						</td>
						<td>
							<div id="contentImgArea2">
								<img id="contentImg1" width="300" height="300" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= contentImg %>">
								<input type="hidden" id="detailImgId1" name="detailImgId1" value="<%= imgIds.get(1) %>"> 
								<input type="hidden" id="cContent1" name="cContent1">
							</div>
						</td>
						</tr>
					</table>
	
					<table id = "content_table" style="margin-left: auto; margin-right: auto;">
						<tr>
							<td class = "content_title" id = "title">제목<label class = "must">(필수)</label></td>
							<td id = "input_contents">
							<input type = "text"  id="input_title" name="title" value="<%= title %>">
							<input type="hidden" name="post_no" value="<%= request.getParameter("pno") %>">
							</td>
						</tr>
						<tr>
							<td class = "content_title" id = "start">시작귤<label class = "must">(필수)</label></td>
							<td><input type = "number" id = "input_start" name = "gstart" value="<%= min %>"><label><b> 귤</b></label></td>
						</tr>
						<tr>
							<td class = "content_title" id = "buy">즉시구매귤<label class = "must">(필수)</label></td>
							<td><input type = "number" id = "input_buy" name = "gbuy" value="<%= max %>"><label><b> 귤</b></label></td>
						</tr>
						<tr>
							<td class = "content_title" id = "time">남은시간</td>
							<td><label id = "input_time">24 : 00</label></td>
						</tr>
						<tr>
							<td class = "content_title" id = "content">내용<label class = "must">(필수)</label></td>
							<td><textarea  id = "input_content"  name = "gcontent" ><%= request.getParameter("content") %></textarea></td>
						</tr>
					</table>
				</div>
				
				<div id = "btn">
					<button type="button" id="onebu">수정완료</button>
					<input type="button" id="twobu" value="돌아가기" onclick="location.href='<%= request.getContextPath() %>/detail.gy?postNo=<%= request.getParameter("pno") %>'">
				</div>
				
				
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				</div>
				<script>
					$(function(){
						$("#fileArea").hide();
						
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea2").click(function(){
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
			</form>
		</div>
	</div>
	<script>
		$('#onebu').click(function(){
			var t = $("#titleImg").attr('src');
			var c1 = $("#contentImg1").attr('src');
		
			if(typeof(t) != 'undefined'){
				$("#cTitle").val($("#titleImg").attr('src').substring(0, 4));
			}
			if(typeof(c1) != 'undefined'){
				$("#cContent1").val($("#contentImg1").attr('src').substring(0, 4));
			}
			
			$('#insert').parent().submit();
		});
	</script>
</body>
</html>