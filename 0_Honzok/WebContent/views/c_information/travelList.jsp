<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, c_information.model.vo.*" %>
<% 
	ArrayList<TravelBoard> list = (ArrayList<TravelBoard>)request.getAttribute("list");
	String area = (String)request.getAttribute("area");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#selectField{
		font-size: 15pt;
		padding-bottom: 10px;
	}
	#selectField > span:last-child{color: rgb(230, 126, 34); cursor: pointer;}
	#selectField > span:first-child{color: rgb(118, 129, 73); cursor: pointer;}
	#selectArea{
		width: 100%;
		height: 50px;
		margin-top: 10px;
		padding-bottom: 10px;
		text-align: center;
	}
	#area{
		border: 3px solid rgb(241, 131, 50);
		padding: 10px;
		margin: 5px;
		border-radius: 10px;
		font-weight: bold;
		font-size: 15pt;
		display: inline-block;
		cursor: pointer;
	}
	.modal {
           display: none; /* Hidden by default */
           position: fixed; /* Stay in place */
           z-index: 2; /* Sit on top */
           left: 0;
           top: 0;
           width: 100%; /* Full width */
           height: 100%; /* Full height */
           overflow: auto; /* Enable scroll if needed */
           background-color: rgb(0,0,0); /* Fallback color */
           background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
       }
       /* Modal Content/Box */
       .modal-content {
           background-color: #fefefe;
           margin: 5% auto; /* 15% from the top and centered */
           padding: 20px;
           border: 1px solid #888;
           width: 50%; /* Could be more or less, depending on screen size */                          
       }
       /* The Close Button */
       .close {
           color: #aaa;
           float: right;
           font-size: 28px;
           font-weight: bold;
       }
       .close:hover,
       .close:focus {
           color: black;
           text-decoration: none;
           cursor: pointer;
       }
	#map{
		width: 100%;
		height: 50px;
		margin-top: 10px;
		padding-bottom: 10px;
	}
	#mapchange{
		position: relative; 
		top: -30px;
		z-index: 1;
		margin: auto;
		width: 30px;
		height: 30px;
		background-color: white;
		color: rgb(241, 131, 50);
		border-radius: 10px;
		font-size: 20pt;
		cursor: pointer;
	}
	
	.travelList{
		width: 100%;
		height: 250px;
		padding: 10px;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		cursor: pointer;
	}
	#travelImg{
		width: 250px;
		height: 250px;
		display: inline-table;
		float: left;
	}
	#travelImg img{
		width: 100%;
		height: 100%;
	}
	#travelMain{
		width: 550px;
		height: 250px;
		display: inline-table;
		text-align: left;
	}
	#top{
		width: 100%;
		height: 50px;
		margin-top: 10px;
		margin-bottom: 40px;
		font-size: 30pt;
		font-weight: bold;
	}
	#middle{
		width: 100%;
		height: 50px;
		font-size: 20pt;
	}
	.star{
		width: 50px;
		height: 100%;
		vertical-align: middle;
	}
	#thumbsImg{
		width: 30px;
		height: 30px;
		vertical-align: middle;
		margin-bottom: 10px;
	}
	#bottom{
		width: 100%;
		height: 30px;
		margin-top: 60px;
		font-size: 15pt;
	}
	#bottom > span{
		float:right;
		margin-right: 50px;
	}
	#write{
		width : 100px;
		height : 40px;
		background-color : rgb(224, 224, 224);
		color : rgb(64, 64, 64);
		border-radius: 5px;
		margin: 20px;
		line-height: 40px;
		font-weight: bold;
		float: right;
		margin-left: 100%;
		cursor: pointer;
	}
	.pageMove{
		width : 40px;
		height : 40px;
		background-color : rgb(224, 224, 224);
		border-radius: 5px;
		margin: 10px;
		line-height: 40px;
		font-weight: bold;
		display: inline-table;
		cursor: pointer;
	}
	#search > select, #search > input{
		margin-top: 20px;
		margin-right: 20px;
		height : 40px;
		font-size: 15pt;
		font-family: 'Nanum Gothic', sans-serif;
	}
	#searchSubmit{
		width : 100px;
		height : 40px;
		background-color : rgb(224, 224, 224);
		color : rgb(64, 64, 64);
		border-radius: 5px;
		line-height: 40px;
		font-weight: bold;
		display: inline-table;
		cursor: pointer;
	}
</style>

</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('욜로홀로솔로');
	</script>
	
	<div id="main">
		<div id="selectField"><span onClick="location.href='<%= request.getContextPath() %>/list.food'">혼밥 + 혼술</span> | <span onclick="location.href='<%= request.getContextPath() %>/list.travel'">혼행</span></div>
		<div id="selectArea">
			현재 선택된 지역은
			<span id="area"><%= area %></span>
			입니다.
			
			<script>
			$(function(){
				var x;
				var y;
				var area = '<%= area %>';
				switch(area){
				case '서울' : x = 37.50047769725547; y = 127.03598534615489; break;
				case '경기' : x = 37.25579766003999; y = 127.03606026298748; break;
				case '인천' : x = 37.45611340275262; y = 126.70558540958115; break;
				case '강원' : x = 37.82393642568912; y = 127.88392126971233; break;
				case '충북' : x = 36.64783500715062; y = 127.48667645982512; break;
				case '충남' : x = 36.55810827422746; y = 126.79624496295881; break;
				case '대전' : x = 36.352333770845135; y = 127.38714979112902; break;
				case '경북' : x = 36.56880482548783; y = 128.72947218060423; break;
				case '대구' : x = 35.8713444333616; y = 128.60151912205697; break;
				case '울산' : x = 35.54197685566645; y = 129.34431551138644; break;
				case '부산' : x = 35.18356965752139; y = 129.07546164068677; break;
				case '경남' : x = 35.32889249220643; y = 127.63772228473658; break;
				case '전북' : x = 35.825115600611944; y = 127.14766102306662; break;
				case '광주' : x = 35.1601650683984; y = 126.85164082015838; break;
				case '전남' : x = 35.0167006580383; y = 126.71038597710438; break;
				case '제주' : x = 33.50020862687879; y = 126.53116960395576; break;
				case '서울' : x = 37.50047769725547; y = 127.03598534615489; break;
				}
				var moveLatLon = new kakao.maps.LatLng(x, y);
				map.panTo(moveLatLon);
				map.setLevel(7);
			})
			</script>
			
			<!-- The Modal -->
		    <div id="myModal" class="modal">
		    	<!-- Modal content -->
		    	<div class="modal-content">
		    		<span class="close">&times;</span>
		    		<img src="<%= request.getContextPath() %>/images/map.png" usemap="#usemap">
		    		<map name="usemap">
		    			<area shape="poly" coords="182,149,204,132,233,151,234,161,202,168,186,161,184,154" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=서울'">
		    			<area shape="poly" coords="179,140,182,148,204,133,233,149,234,160,203,170,185,163,169,174,158,202,157,217,185,241,248,240,301,204,306,150,278,141,277,104,237,69,228,47,190,65,190,76,169,89,177,106,155,116,148,128,155,148" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=경기'">
		    			<area shape="poly" coords="179,141,184,164,168,174,160,190,138,186,112,141,111,126,131,104,153,113,146,127,154,148" onClick="changeArea('인천', 37.45611340275262, 126.70558540958115)">
		    			<area shape="poly" coords="230,48,285,53,335,44,344,29,369,27,375,13,386,20,494,190,478,215,407,220,355,195,313,207,301,201,309,151,280,138,277,103,237,66" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=강원'">
		    			<area shape="poly" coords="249,241,305,207,313,210,355,198,393,216,383,256,356,250,317,284,311,327,327,343,314,375,284,378,285,365,274,317,255,301,246,273,260,261" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=충북'">
		    			<area shape="poly" coords="247,241,258,262,244,272,253,303,236,328,259,347,277,343,283,378,263,378,250,358,235,357,218,371,195,367,173,377,144,365,145,344,121,333,116,301,105,299,98,255,140,218,166,227,184,243" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=충남'">
		    			<area shape="poly" coords="255,304,239,328,258,347,275,342,272,319" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=대전'">
		    			<area shape="poly" coords="376,429,381,409,375,394,407,373,425,395,397,432,432,436,476,416,516,424,527,390,523,359,507,366,515,258,502,239,494,194,480,217,407,223,397,217,385,257,355,252,317,284,320,291,312,327,329,342,315,375,319,393,339,398,361,427" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=경북'">
		    			<area shape="poly" coords="376,395,383,411,375,430,395,432,423,396,406,375" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=대구'">
		    			<area shape="poly" coords="459,425,457,436,480,454,483,464,493,482,506,465,516,425,476,416" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=울산'">
		    			<area shape="poly" coords="481,466,438,487,435,501,393,512,407,523,428,515,432,525,487,494,493,483,492,481" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=부산'">
		    			<area shape="poly" coords="317,394,337,401,361,429,433,437,458,425,456,437,479,455,479,464,438,486,434,499,392,512,407,525,428,518,430,526,410,565,386,560,373,545,346,548,340,568,317,561,311,530,290,499,280,472,296,456,284,434,312,395" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=경남'">
		    			<area shape="poly" coords="145,369,174,381,197,370,219,373,237,361,249,361,262,381,313,376,317,391,310,394,281,432,291,456,277,470,233,474,186,451,156,468,137,444,141,421,161,394" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=전북'">
		    			<area shape="poly" coords="162,484,158,496,179,515,208,498,196,484" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=광주'">
		    			<area shape="poly" coords="72,644,103,630,103,618,130,609,227,626,231,611,255,600,266,606,276,600,275,577,314,561,307,531,287,501,277,473,232,477,187,455,157,473,162,481,196,481,213,497,182,518,153,499,161,481,137,450,119,480,121,493,92,498,92,519,80,530,70,579,90,583,60,625" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=전남'">
		    			<area shape="poly" coords="160,655,92,692,118,724,198,703,210,671" onClick="location.href='<%= request.getContextPath() %>/list.travel?area=제주'">
		    		</map>
		    	</div>
		    </div>
		</div>
		<script>
		// Get the modal
		var modal = document.getElementById('myModal');
		// Get the button that opens the modal
		var btn = document.getElementById("area");
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];                                          
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
	    }
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		</script>
		
		<div id="map"></div>
		<div id="mapchange">▼</div>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 2 // 지도의 확대 레벨
			    };
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			var positions = [
				<% if(!(list.isEmpty())) {%>
					<% for(TravelBoard t : list) { %>
					{
				        content: '<div style="width:150px; text-align: center; padding:5px;"><%= t.getTitle() %></div>', 
				        latlng: new kakao.maps.LatLng(<%= t.getArea_x() %>, <%= t.getArea_y() %>),
				        id: <%= t.getNo() %>,
				    },
					<% 	} %>
				<% } %>
			];

			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content, // 인포윈도우에 표시할 내용
			    });
			    
			    var str = positions[i];

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    kakao.maps.event.addListener(marker, 'click', makeClick(positions[i]));
			    
			}
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			function makeClick(m) {
				return function() {
					location.href='<%= request.getContextPath() %>/detail.travel?no=' + m.id;
				};
			}

			var isSmall = true;
			$('#mapchange').click(function(){
				if(isSmall){
					var mapContainer = document.getElementById('map');
				    mapContainer.style.height = '400px'; 
				    map.relayout();
				    $('#mapchange').text('▲');
				    isSmall = false;
				} else{
					var mapContainer = document.getElementById('map');
				    mapContainer.style.height = '50px';
				    map.relayout();
				    $('#mapchange').text('▼');
				    isSmall = true;
				}
			});
		</script>
		
		
		<% if(list.isEmpty()) {%>
			해당하는 데이터가 존재하지 않습니다.
		
		<% } else { %>
		<% for(TravelBoard b : list) { %>
		
		<div class="travelList">
			<input type="hidden" value='<%= b.getNo() %>'>
			<div id="travelImg"><img src="<%= request.getContextPath() %>/images/travel_board/<%= b.getImg_src() %>"></div>
			<div id="travelMain">
				<div id="top"><%= b.getTitle() %></div>
				<div id="middle">
					<% for(int i = 0; i < 5; i++) {
						if(i > b.getStar()) {%>
						<img src="<%= request.getContextPath() %>/images/empty_star.png" class="star">
						<% } else { %>
						<img src="<%= request.getContextPath() %>/images/star.PNG" class="star">
						<% } %>
					<% } %>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<img id= "thumbsImg" src= "<%= request.getContextPath() %>/images/thumbsup.png"> 
					<%= b.getReco_count() %>
				</div>
				<div id="bottom">
					<b><%= b.getAddress() %></b>
					<!-- <span>조회 103 | 20.01.16</span> -->
				</div>
			</div>
		</div>
		
		<% 	} %>
		<% } %>
		
		<div id="write" onclick='location.href="views/c_information/travelWrite.jsp"'>글쓰기</div>
		
		<script>
			$(function(){
				$('.travelList').click(function(){
					var no = $(this).children('input').val();
					location.href='<%= request.getContextPath() %>/detail.travel?no=' + no;
				});
			});
		</script>
		
		
		
		
		
		
		
		<!-- <div id="pageleft" class="pageMove">&lt;</div>
		<div id="page1" class="pageMove">1</div>
		<div id="page1" class="pageMove">2</div>
		<div id="page1" class="pageMove">3</div>
		<div id="page1" class="pageMove">4</div>
		<div id="page1" class="pageMove">5</div>
		<div id="pageright" class="pageMove">&gt;</div>
		
		<script>
			$(function(){
				$('#page1').css({'background':'rgb(241, 131, 50)', 'color':'white'});
			}); // 해당페이지에 위css삽입으로 색 입혀주기
		</script>
		
		<form id="search">
			<select>
				<option>제목</option>
				<option>제목 + 내용</option>
				<option>닉네임</option>
			</select>
			<input type="text" placeholder="검색어를 입력하세요">
			<div id="searchSubmit">검색</div>
		</form> -->
		
	</div>
	
</body>
</html>