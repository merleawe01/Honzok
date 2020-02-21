<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.searchArea{text-align:center;}
	.wordArea{height:25px; width:250px; margin-top:10px; border:1px solid #f18332; background:#fff; 
				display:inline-block; vertical-align:bottom;}
	.selectArea{height:27px; margin-top:0px; display:inline-block;}
	select{height:27px; border:1px solid #f18332;}
	option{border:1px solid #f18332;}
	#word{font-size:12px; width:195px; padding:5px; margin-left:5px; border: 0px; outline:none; float:left;}
	#searchBtn{width:40px; height:100%; border: 0px; border-radius:0px; background: #f18332; outline: none; float:right; color: #fff;}

</style>
</head>
<body>
	<form action="/search.word" method="post" id="searchForm">
      <div class="searchArea">
         <div class="selectArea">
            <select name="search" id="search">
               <option value="from" selected>보낸 사람</option>
               <option value="title">제목</option>
               <option value="content">내용</option>
            </select> 
            <input type="hidden" name="searchSelect" id="searchSelect">
         </div>
         <div class="wordArea">
            <input type="text" placeholder="검색어 입력" name="word" id="word">
            <button id="searchBtn" onclick="searchMessage();">검색</button>
         </div>
      </div>
	</form>
	<script>
			function searchMessage(){
			var isSearchChecked = false;
			var search = $("#search");
			var searchWord = $('#word');
			

			$('#word').change(function(){
				if(searchWord.val().trim().length< 1){
					alert('검색어를 입력해주세요.');
					searchWord.focus();
					isSearchChecked = false;
				} else{
					isSearchChecked = true;
				}
				
			});
			
			$('#searchForm').attr('action', '<%= request.getContextPath()%>/search.word');
			$('#searchForm').submit();

		}
	</script>
</body>
</html>