<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#boardTitle {
			width : 100%;
			height : 25px;
			display : inline-block;
			font-family: 'Nanum Gothic', sans-serif;
			padding-bottom: 5px;
			border-bottom : 1pt solid gray;
		}
		#titleLeft {
			display : inline-block;
			font-size: 13pt;
			float: left;
			font-weight: bold;
		}
		#titleRight {
			display : inline-block;
			font-size: 10pt;
			color: rgb(94, 94, 94);
			float: right;
		}
		#boardWriter {
			width : 100%;
			height : 40px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 10pt;
			text-align: right;
			margin-top: 10px;
		}
		
		#boardPhoto {
			width : 100%;
			min-height : 300px;
			border : 2px solid gray;
			height:auto;
		}

		#detail_content{ border-bottom : 1px solid gray; margin-bottom : 20px;}

		.td1{
			width : 200px;
			height : 60px;
		}
		
		#td2{
			width : 970px;
		}
		
		#content_td{ height : 360px;}
		
		.title1{
			margin-left : 30px;
			width : 100px;
			height : 30px;
 			display : inline-table;
			border-radius: 5px;
			float: left;
			background-color: rgb(224, 224, 224);
			line-height: 30px;
			font-weight: bold;
		}
		
		.price{
			float: left;
			font-size: 14pt;
			font-weight: bold;
		}
		
		#time{
			float: left;
			font-size: 14pt;
			font-weight: bold;
			color : yellowgreen;
		}
		
		#content{
			padding : 10px;
			float: left;
			width : 900px;
			height : 260px;
			background-color: rgba(52, 152, 219, 0.2);
			text-align: left;
		}
		
		#revise{
				  font-size : 10pt;
				  width : 80px;
				  height : 30px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      cursor:pointer;
			      margin-left : 82%
		}
		#delete{
				  font-size : 10pt;
				  width : 80px;
				  height : 30px;
			      background-color : lightgray;
			      color : black;
			      border-radius: 5px;
			      border:0;
			      font-weight: bold;
			      margin-left:10px;
			      cursor:pointer;
		}
		
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
	
		<div id="boardTitle">
					<div id="titleLeft">
						<label>여기는 제목이 나오는 칸</label>
					</div>
					
					<div id="titleRight">
						2020.01.16. 23:00
					</div>
				</div>
				
				<div id="boardWriter">
					작성자 | 조회 : 350
				</div>
				
				<div id="boardPhoto">
					<br>사진
				</div>
				
				<div>
					<table id = "detail_content">
						<tr>
							<td class = "td1"><label id = "bid_title" class = "title1">현재 입찰귤</label></td>
							<td id = "td2"><label class = "price">2500 귤</label></td>
						</tr>
						<tr>
							<td class = "td1"><label id = "buy_title" class = "title1">즉시 구입귤</label></td>
							<td><label class = "price">5000 귤</label></td>
						</tr>
						<tr>
							<td class = "td1"><label id = "time_title" class = "title1">남은시간</label></td>
							<td><label id = "time">07:53:19</label></td>
						</tr>
						<tr>
							<td id = "content_td"><label id = "content_title" class = "title1">내용</label></td>
							<td><label id = "content">많이 참여해주세요~</label></td>
						</tr>
					</table>
				</div>
				
				<div id = "btn1">
					<input id = "revise" type="button" value="수정"> 
					<input id = "delete"type="button" value="삭제">
				</div>
				
				<div id = "btn2">
					<input id = "onebu" type="button" value="입찰하기"> 
					<input id = "twobu"type="button" value="목록으로">
				</div>
	
	</div>
</body>
</html>