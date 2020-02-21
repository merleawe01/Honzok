<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body onload="nickValue();">
	<b>닉네임 중복 체크</b>
	<br>
	<form action="<%= request.getContextPath() %>/nickCheck.me" id="nickCheckForm" method="post">
		<input type="text" id="inputNick" name="inputNick">
		<input type="submit" value="중복확인">
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
	
	<input type="button" id="cancel" value="취소" onclick="window.close();">
	<input type="button" id="usedId" value="확인" onclick="usedNick();">

</body>
</html>