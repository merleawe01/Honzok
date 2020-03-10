<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{padding:15px;
		background-color: #fff9f0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	#inputNick{height:25px;}
	#checkBtn, #usedId, #cancle{border-radius:5px; border:0px; background-color:lightgray; height:30px; font-weight:bold;}
	#checkBtn:hover, #usedId:hover{background-color:#f18332; color:white;}
	#cancle:hover{background-color:#768149; color:white;}
	#usedId, #cancle{width:50px;}
	#btnDiv{text-align:center;}
</style>
<script>
	function nickValue(){
		if(typeof(opener.document.joinForm) != 'undefined'){
			if('<%= request.getAttribute("checkedNick") %>' == "null"){
				document.getElementById('inputNick').value = opener.document.joinForm.nickName.value;
			} else{
				document.getElementById('inputNick').value = '<%= (String)request.getAttribute("checkedNick") %>';
			}
		}
		
		if(typeof(opener.document.updateForm) != 'undefined'){
			if('<%= request.getAttribute("checkedNick") %>' == "null"){
				document.getElementById('inputNick').value = opener.document.updateForm.nickName.value;
			} else{
				document.getElementById('inputNick').value = '<%= (String)request.getAttribute("checkedNick") %>';
			}
		}
		
	}
	
	function usedNick(){
		if(typeof(opener.document.joinForm) != 'undefined'){
			opener.document.joinForm.nickName.value = document.getElementById('inputNick').value;
		}
		
		if(typeof(opener.document.updateForm) != 'undefined'){
	 		opener.document.updateForm.nickName.value = document.getElementById('inputNick').value;
		}
		self.close();
	}
</script>
</head>
<body onload="nickValue();parent.resizeTo(430,300);" onresize="parent.resizeTo(430,300)" >
	<div style="font-size:20px; "><b>닉네임 중복 체크</b></div>
	<br>
	<form action="<%= request.getContextPath() %>/nickCheck.me" id="nickCheckForm" method="post">
		<input type="text" id="inputNick" name="inputNick">
		<input type="submit" id="checkBtn" value="중복확인">
	</form>
	
	<br>
	
	<%
		if(request.getAttribute("result") != null){
			int result = (Integer)request.getAttribute("result");
			if(result > 0){
		
	%>
				이미 사용 중인 닉네임입니다.
	<%
			} else{
	%>
				사용 가능한 닉네임입니다.
	<%
			}
		}
	%>
	
	<br>
	<br>
	<div id="btnDiv">
		<input type="button" id="usedId" value="확인" onclick="usedNick();">
		<input type="button" id="cancle" value="취소" onclick="window.close();">
	</div>

</body>
</html>