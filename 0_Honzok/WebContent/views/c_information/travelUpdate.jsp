<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	int star = Integer.parseInt(request.getParameter("star"));
	String category = request.getParameter("category");
	String content = request.getParameter("content");
	String caution = request.getParameter("caution");
	String best_time = request.getParameter("best_time");
	Double area_x = Double.parseDouble(request.getParameter("area_x"));
	Double area_y = Double.parseDouble(request.getParameter("area_y"));
	String address = request.getParameter("address");
	String local_name = request.getParameter("local_name");
	
	int imgSize = Integer.parseInt(request.getParameter("imgSize"));
	ArrayList<String> imgId = new ArrayList<String>();
	ArrayList<String> imgOrigin = new ArrayList<String>();
	ArrayList<String> imgChange = new ArrayList<String>();
	ArrayList<String> imgLevel = new ArrayList<String>();
	
	for(int i = 0; i < imgSize; i++) {
		imgId.add(request.getParameter("imgId"+i));
		imgOrigin.add(request.getParameter("imgOrigin"+i));
		imgChange.add(request.getParameter("imgChange"+i));
		imgLevel.add(request.getParameter("imgLevel"+i));
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#basic{
		width: 100%;
		height: 250px;
		text-align: left;
		padding-bottom: 20px;
		border-bottom: 1px solid gray;
	}
	#mainImg{
		display: inline-table;
		height: 100%;
		width: 250px;
		float: left;
		border: 1px solid black;
		cursor: pointer;
	}
	#nameMain{
		display: inline-table;
		height: 100%;
		width: 500px;
		padding: 30px;
		margin-left: 5px;
	}
	.bigText{
		font-size: 15pt;
	}
	.smallText{
		font-size: 10pt;
		color: gray;
	}
	.middleText{
		font-size: 13pt;
	}
	.star{
		width: 70px;
		height: 70px;
	}
	.left{
		display: inline-table;
		width: 200px;
		height: 100%;
		text-align: left;
		float: left;
		padding-left: 5px;
		line-height:150%;
	}
	.right{
		display: inline-table;
		width: 650px;
		height: 100%;
		text-align: left;
	}
	.nameCate{
		display: inline-table;
		width: 90px;
		height: 20px;
		border-radius: 5px;
		background-color: white;
		vertical-align: middle;
		text-align: center;
	}
	#review{
		width: 100%;
		height: 90px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#reviewContent{
		font-size: 13pt;
		width: 650px;
		resize: none;
		border-radius: 5px;
	}
	#time{
		width: 100%;
		height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	input[type=radio] 
	{
		width: 20px;
		height: 20px;
		vertical-align: middle;
		margin: 0;
	} 
	#notice{
		width: 100%;
		height: 70px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#noticeContent{
		font-size: 13pt;
		width: 650px;
		resize: none;
		border-radius: 5px;
	}
	#plusImg{
		width: 100%;
		height: 30px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#addImg{
		display : inline-block;
		width : 100px;
		height : 40px;
		background-color : rgb(224, 224, 224);
		color : rgb(64, 64, 64);
		border-radius: 5px;
		line-height: 40px;
		font-weight: bold;
		display: inline-table;
		cursor: pointer;
		text-align: center;
	}
	#imgList{
		display : inline-block;
		width : 100%;
		padding: 10px;
	}
	.deleteImg{
		color: red;
		font-weight: bold;
		cursor: pointer;
	}
	#address{
		width: 100%;
		height: 300px;
		margin-top: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid gray;
	}
	#tips{
		text-align: left;
		line-height:150%;
		background-color: rgba(224, 224, 224, 0.45);
		padding: 10px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#ok{
		width : 100px;
		height : 40px;
		background-color : rgb(241, 131, 50);
		color : white;
		border-radius: 5px;
		margin: 10px;
		line-height: 40px;
		font-weight: bold;
		display: inline-table;
		cursor: pointer;
	}
	#cancle{
		width : 100px;
		height : 40px;
		background-color : rgb(224, 224, 224);
		color : rgb(64, 64, 64);
		border-radius: 5px;
		margin: 10px;
		line-height: 40px;
		font-weight: bold;
		display: inline-table;
		cursor: pointer;
	}
	
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:100%;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;height:22px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
</style>


</head>
<body>
	<%@ include file="../a_common/boardCommon.jsp" %>
	<script>
		$('#boardName').text('욜로홀로솔로');
	</script>
	
	<div id="main">
		<form action="<%= request.getContextPath() %>/update.travel" method="post" id="updateForm" encType="multipart/form-data">
			<input type="hidden" id="no" name="no" value="<%= no %>">
			<div id="basic">
				<div id="mainImg">
					<img src="<%= request.getContextPath() %>/images/travel_board/<%= imgChange.get(0) %>" width=100% height=100%>
				</div>
				<input type="file" id="addMainImg" name="foodImg" accept=".bmp, .jpeg, .jpg, .gif, .png, .tiff, .jfif" onchange="LoadImg(this)" hidden="">
				
				<script>
					$('#mainImg').click(function(){
						$('#addMainImg').click();
					});
					
					function LoadImg(value){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){
								$("#mainImg > img").attr("src", e.target.result);
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				
				<div id="nameMain">
					<span class="bigText">여행지 </span> <span class="smallText">(필수)</span><br><br>
					<input class="middleText" type="text" placeholder=" 방문한 여행지를 입력해주세요." size="40" id="title" name="title" value="<%= title %>"><br><br>
					<span class="bigText">여행지에 대한 평가 </span><br><br>
					
					<input type="hidden" id="star" name="star" value=<%= star %>>
					<img src="../../images/empty_star_new.png" class="star" id="star1">
					<img src="../../images/empty_star_new.png" class="star" id="star2">
					<img src="../../images/empty_star_new.png" class="star" id="star3">
					<img src="../../images/empty_star_new.png" class="star" id="star4">
					<img src="../../images/empty_star_new.png" class="star" id="star5">
					<script>
						$(function(){
							var findStar = [$('#star1'), $('#star2'), $('#star3'), $('#star4'), $('#star5')];
							for(var i = 0; i < 5; i++){
								if(i <= <%= star %>){
									findStar[i].attr('src','../../images/star_new.PNG');
								} else{
									findStar[i].attr('src','../../images/empty_star_new.png');
								}
							}
						})	
					
						$('.star').mouseenter(function(){
							var findStar = [$('#star1'), $('#star2'), $('#star3'), $('#star4'), $('#star5')];
							for(var i = 0; i < 5; i++){
								findStar[i].attr('src','../../images/empty_star_new.png');
							}
							for(var i = 0; i < 5; i++){
								findStar[i].attr('src','../../images/star_new.PNG');
								if(findStar[i][0].id == this.id){
									$('#star').val(i);
									break;
								}
							}
						});
						/* $('.star').click(function(){
							$('.star').off();
						}); */
					</script>
				</div>
			</div>
							
			<div id="review">
				<div class="left">
					<span class="middleText">리뷰내용 </span>
					<span class="smallText">(필수)</span><br>
				</div>
				<div class="right">
					<textarea rows="4" id="reviewContent" name="content" placeholder=" 여행지에 대한 경험을 공유하세요."><%= content %></textarea>
				</div>
			</div>
			
			<div id="time">
				<div class="left">
					<span class="middleText">권장 방문시간</span>
				</div>
				<div class="right">
					<input class="best_time" type="radio" name="best_time" value="1~2시간">&nbsp;&nbsp;<span class="middleText"> 1~2시간</span>&nbsp;&nbsp;
					<input class="best_time" type="radio" name="best_time" value="2~3시간">&nbsp;&nbsp;<span class="middleText"> 2~3시간</span>&nbsp;&nbsp;
					<input class="best_time" type="radio" name="best_time" value="3시간 이상">&nbsp;&nbsp;<span class="middleText"> 3시간 이상</span>
				</div>
			</div>
			
			<script>
				$(function(){
					switch('<%= best_time %>'){
					case '1~2시간' : $('.best_time')[0].checked = true; break;
					case '2~3시간' : $('.best_time')[1].checked = true; break;
					case '3시간 이상' : $('.best_time')[2].checked = true; break;
					}
				})
			</script>
			
			<div id="notice">
				<div class="left">
					<span class="middleText">주의사항 </span>
				</div>
				<div class="right">
					<textarea rows="3" id="noticeContent" placeholder=" 여행지에 대한 주의사항을 입력해주세요." name="caution"><%= caution %></textarea>
				</div>
			</div>
			
			<div id="plusImg" style="height:auto">
				<div class="left">
					<span class="middleText">추가 첨부사진</span>
				</div>
				<div class="right" style="height:auto">
					<div id="addImg">이미지 추가</div> &nbsp;&nbsp;* 이미지 추가는 최대 5개 까지만 가능합니다. <br>

					<div id="imgList">
						<% if(imgSize != 1) { %>
							<% for(int i = 1; i < imgSize; i++) { %>
								<span id="bonusImg<%= imgLevel.get(i) %>"><%= imgOrigin.get(i) %> <span class='deleteImg'>X</span><br></span>
							<% } %>
						<% } %>
					</div>

					<input type="file" id="imgFile1" name="bonusImg1" accept=".bmp, .jpeg, .jpg, .gif, .png, .tiff, .jfif" onchange="secondImg($('#imgFile1'))" hidden="">
					<input type="file" id="imgFile2" name="bonusImg2" accept=".bmp, .jpeg, .jpg, .gif, .png, .tiff, .jfif" onchange="secondImg($('#imgFile2'))" hidden="">
					<input type="file" id="imgFile3" name="bonusImg3" accept=".bmp, .jpeg, .jpg, .gif, .png, .tiff, .jfif" onchange="secondImg($('#imgFile3'))" hidden="">
					<input type="file" id="imgFile4" name="bonusImg4" accept=".bmp, .jpeg, .jpg, .gif, .png, .tiff, .jfif" onchange="secondImg($('#imgFile4'))" hidden="">
					<input type="file" id="imgFile5" name="bonusImg5" accept=".bmp, .jpeg, .jpg, .gif, .png, .tiff, .jfif" onchange="secondImg($('#imgFile5'))" hidden="">
					
					<input type="hidden" id="imgInfo" name="imgInfo" value="">
				</div>
			</div>
			
			<script>
				function fullImg(){
					if($("#bonusImg1")[0] != undefined && $("#bonusImg2")[0] != undefined && $("#bonusImg3")[0] != undefined && $("#bonusImg4")[0] != undefined && $("#bonusImg5")[0] != undefined){
						$('#addImg').hide();
					} else{
						$('#addImg').show();
					}
				}
				
				$('#addImg').click(function(){
					if($("#bonusImg1")[0] == undefined){
						$('#imgFile1').click();
					} else if($("#bonusImg2")[0] == undefined){
						$('#imgFile2').click();
					} else if($("#bonusImg3")[0] == undefined){
						$('#imgFile3').click();
					} else if($("#bonusImg4")[0] == undefined){
						$('#imgFile4').click();
					} else if($("#bonusImg5")[0] == undefined){
						$('#imgFile5').click();
					}
				});
				
				function secondImg(img){
					var fileValue = img.val().split("\\");
					var fileName = fileValue[fileValue.length-1]; // 파일명
					
					if(fileName == "") {
						console.log("파일이 없습니다.");
					} else{
						$('#imgList').append("<span id=" + img[0].name + ">" + fileName + " <span class='deleteImg'>X</span><br></span>");
					}
					fullImg();
				}
				
				$(document).on("click",".deleteImg",function(){
					var id = this.parentNode.id;
					this.parentNode.remove();
					
					switch(id){
					case 'bonusImg1' : $("#imgFile1").val(""); break;
					case 'bonusImg2' : $("#imgFile2").val(""); break;
					case 'bonusImg3' : $("#imgFile3").val(""); break;
					case 'bonusImg4' : $("#imgFile4").val(""); break;
					case 'bonusImg5' : $("#imgFile5").val(""); break;
					}
					fullImg();
				});
			</script>
			
			<input type="hidden" id="area_x" name="area_x" value="<%= area_x %>">
			<input type="hidden" id="area_y" name="area_y" value="<%= area_y %>">
			<input type="hidden" id="adr" name="address" value="<%= address %>">
			<input type="hidden" id="local_name" name="local_name" value="<%= local_name %>">
		</form>
			
		<div id="address">
			<div class="left">
				<span class="middleText">주소</span>
			</div>
			<div class="right">
				<div class="map_wrap">
					<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

					<div id="menu_wrap" class="bg_white">
   						<div class="option">
       						<div>
           						<form onsubmit="searchPlaces(); return false;">
               						지역 : <input type="text" value="" id="keyword" size="15"> 
               						<button type="submit">검색하기</button> 
           						</form>
       						</div>
   						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(<%= area_x %>, <%= area_y %>), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			var geocoder = new kakao.maps.services.Geocoder();
			
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			
			marker.setMap(map);
			
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    $('#area_x').val(latlng.getLat());
			    $('#area_y').val(latlng.getLng());
			    
			    /* console.log("위도 : " + latlng.getLat());
			    console.log("경도 : " + latlng.getLng()); */
			    
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			        	$('#adr').val(result[0].address.address_name);
			        	var local_name = result[0].address.address_name.substring(0, 2);
			        	if(local_name == '세종'){
			        		local_name = '충남';
			        	}
			        	$('#local_name').val(local_name);
			        }   
			    });
			});
			
			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 법정동 상세 주소 정보를 요청합니다
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {
				var keyword = document.getElementById('keyword').value;

			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    }

			    var places = new kakao.maps.services.Places();
			    
			    places.keywordSearch(keyword, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            console.log(result);
			            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			         	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			            map.setCenter(coords);
			        }
			    });
			};
		</script>
		
		<div id="tips">
			* 이 리뷰는 개인적인 경험을 바탕으로 작성한 이 여행지에 대한 진실된 의견입니다.<br>
			* 이 여행지 및 시설은 개인적 혹은 업무적으로 관련이 없습니다.<br>
			* 해당 여행지 및 시설을 사실과 무관하게 비하하거나 이미지를 실추하는 발언은 삼가해주시기 바랍니다.
		</div>
		
		<div id="ok" onclick="insertBoard();">확인</div>
		<div id="cancle">취소</div>
		
		<script>
			function insertBoard(){
				// same, change, insert, delete 
				var imgInfo = "";
				if($("#addMainImg").val() == "") {
					imgInfo = "same"
				} else{
					imgInfo = "change"
				}
				
				// numInfo 는 가지고있는 이미지 1~5중에
				var numInfo = new Array;
				
				<% if(imgSize != 1) {
					for(int i = 1; i < imgSize; i++){%>
						numInfo.push(<%= imgLevel.get(i) %>);
					<%}
				}%>
				
				for(var i = 1; i <= 5; i++) {
					var check = false;
					
					if(<%= imgSize %> == 1) {
						// size가 1일 경우 same이랑 insert
						if($("#imgFile"+i).val() == "") {
							imgInfo += ", same";
						} else {
							imgInfo += ", insert";
						}
						
					} else {
						// 이건 size가 1이 아닌 경우
						if($("#imgFile"+i).val() == "") {
							// same, delete
							for(var j = 0; j < numInfo.length; j++) {
								if(numInfo[j] == i && $("#bonusImg"+i)[0] == undefined) {
									check = true;
									imgInfo += ", delete";
									break;
								}
							}
							if(!check){
								imgInfo += ", same";
							}
						} else {
							// change, insert
							
							for(var j = 0; j < numInfo.length; j++) {
								if(numInfo[j] == i) {
									check = true;
									imgInfo += ", change";
									break;
								}
							}
							if(!check){
								imgInfo += ", insert";
							}
						}
					}
				}
				
				$('#imgInfo').val(imgInfo);
				
				if($('#title').val() == ""){
					alert("여행지 이름을 입력해주세요.");
				} else if($("#addMainImg").val() == "") {
					alert("여행지의 대표이미지를 선택해주세요.");
				} else if($('#star').val() == "") {
					alert("여행지에 대한 평가를 해주세요.");
				} else if($('#reviewContent').val() == "") {
					alert("가게에 대한 리뷰내용을 작성해주세요.");
				} else if(confirm("글을 수정하시겠습니까?")) {
					$('#updateForm').submit();
				}
			};
		</script>
	</div>
</body>
</html>