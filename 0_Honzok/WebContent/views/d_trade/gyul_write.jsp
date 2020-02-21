<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
		
		#input_contents{ width : 1020px;}
		
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
		#input_content{ width:1020px; height:350px; border-radius : 5px; border : 1px gray solid; }
		
		#file{ 
			text-align : left;
			margin-top : 20px;
			margin-left : 10px;
		}
		
		#input_file{
			width : 1170px;
			height : 200px;
			border-radius : 5px;
			border : 1px solid gray;
		}
		
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
			<form action="<%= request.getContextPath() %>/insert.gy" method="post" encType="multipart/form-data">
				<div id = "insert">
					<table id = "content_table" >
						<tr>
							<td class = "content_title" id = "title">제목<label class = "must">(필수)</label></td>
							<td id = "input_contents"><input type = "text" id = "input_title" placeholder = "상품명을 입력해주세요." name = "gtitle"></td>
						</tr>
						<tr>
							<td class = "content_title" id = "start">시작귤<label class = "must">(필수)</label></td>
							<td><input type = "number" id = "input_start" name = "gstart"><label><b> 귤</b></label></td>
						</tr>
						<tr>
							<td class = "content_title" id = "buy">즉시구매귤<label class = "must">(필수)</label></td>
							<td><input type = "number" id = "input_buy" name = "gbuy"><label><b> 귤</b></label></td>
						</tr>
						<tr>
							<td class = "content_title" id = "time">남은시간</td>
							<td><label id = "input_time">24 : 00</label></td>
						</tr>
						<tr>
							<td class = "content_title" id = "content">내용<label class = "must">(필수)</label></td>
							<td><textarea  id = "input_content" placeholder = "내용을 입력해주세요." name = "gcontent"></textarea></td>
						</tr>
					</table>
				</div>
				
				<div id = "file"><input type = "button" value = "파일첨부" background = "gray"></div>
				
				<div><input type = "text" id = "input_file"></div>
				
				<div id = "btn">
					<input id = "onebu" type="submit" value="작성하기"> 
					<input id = "twobu"type="button" value="돌아가기">
				</div>
			</form>
		</div>
	
	</div>
</body>
</html>