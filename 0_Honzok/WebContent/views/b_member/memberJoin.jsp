<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
   <style>
      header {
         width : 100%;
         height : 170px;
         text-align: center;
      }
      #mainHeader{
         width : 1170px;
         height : 50px;
         display : inline-block;
      }
      #subHeader{
         width : 1170px;
         height : 100px;
         display : inline-block;
      }
      #logo {
         height : 100%;
         width : auto;
         float : left;
      }
      #list {
         height : 100%;
         width : auto;
         float : right;
      }
      #icon {
         height : 100%;
         width : auto;
         float : right;
      }
      #nickname {
         float : right;
         padding : 10px;
         color: rgb(241,131,50);
         font-family: 'Nanum Gothic', sans-serif;
         font-size: 12pt;
      }
      #nickname::after{
         
         color : black;
      }
      #boardName{
         margin : 20px;
         width : 100%;
         height : 70px;
         font-family: 'Nanum Gothic', sans-serif;
         font-size: 30pt;
         font-weight: bold;
         display : inline-table;
         border-bottom: 2pt solid gray;
      }
      
      #information{
         text-align:left;
         font-size : 22pt;
         border-bottom: 2pt solid lightgray; 
         padding-bottom : 4px; 
      }
      
      .input{
         width : 100%;
         height: 30px;
         text-align : left;
         
         
         border-bottom: 1px solid lightgray;
         display : inline-table;
         
      }
      
      .left{
         width : 20%;
         font-size : 17px;
         padding-bottom: 15px;
         padding-top: 15px; 
         padding-left: 10px; 
         display : table-cell;
         
         
      }
      
      .must{
         font-size : 13px;
         color : gray;
         display : inline-block;
      }
      
      .right{
         font-size : 13px;
         text-align : left;
         border-radius : 5px;
         height : 22px;
         margin-bottom : 10px;
      }
      .phone{
         font-size : 13px;
         text-align : left;
         border-radius : 5px;
         height : 22px;
         margin-bottom : 10px;
      }
      
      .address1{
         margin-bottom : 5px;
      }
      
      .email{
         margin-bottom : 0px;
      }
      
      .mini_bt{
         background-color : lightgray;
         height : 25px;
         width : 64px;
         font-size : 10px;
         border-radius : 5px;
         margin-left : 10px;
         font-size : 13px;
      }
      
      .address2{
         font-size: 9pt;
         color : gray; 
         margin-left : 8px;
      }
      
      #main{
         width : 100%;
         text-align: center;
         height : 1170px;
         
      }
      
      #realMain {
         display : inline-table;
         
         width : 1170px;
         display : inline-table;
         height : 1100px;
         /* 현재 임시값 입력해놓음 */
         margin-left : 40px; 
      }
      
      #access_terms1{
         text-align:left;
         font-size : 22pt;
         margin-top: 5%; 
         padding-bottom : 4px; 
      }
      
      #access_terms2{
         margin-top : 2%;
         border : solid 2px gray;
         width : 100%;
         text-align : left;
         padding : 20px 0px 20px 0px; 
         background : rgb(242, 242, 242);
      }
      
      #access_all{
         padding-left :30px; 
         font-weight : bold;
         font-size : 15px; 
         margin-bottom : 2%;
      }
      
      .access_terms3{
         padding-left :30px;
         
      }
      
      #check_content{
         font-weight : bold;
      }
      
      #terms_content{
         width: 100%; 
         height : 100px; 
         resize : none; 
         border-radius : 5px;
         
      }
      
      #finish_bt{
         width : 100px;
         height : 40px;
         background-color : rgb(241, 131, 50); 
         color : white;
          border: 0;
         border-radius: 5px;
         margin: 20px;
         line-height: 40px;
         font-weight: bold;
         text-align: center;
         font-size: 14pt;
      }
      
      #end_line{
         border-bottom : solid 2px lightgray;
      }
      
      @media only screen and (max-width: 1200px) {
         .sidebar {
            display:none;
         }
      }
      
   </style>
</head>
<body>
<body>
   
   <header>
   
      <div id="mainHeader"><a href="../../index.jsp">   
         <img alt="로고" src="../../images/Logo.png" id="logo"></a>
         <img alt="메뉴" src="../../images/list.png" id="list">
         
         <!-- 추후에 로그인 이전과 이후로 구분할 예정 -->
         <div id="nickname">
            <a href="login.jsp">로그인</a> 
         </div>
         
         
      </div>
      
      <div id="subHeader">
         <div id="boardName">
            회원가입
         </div>
      </div>
   
   </header>
   
   <section>
      
      <div id = "main">
         
         
         <div id="realMain">
            <form action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm" name="joinForm">
            <div id = "information"><b>기본 정보</b></div>
            
            <div class =  "input" >
               <div class = "left">이름<span class = "must">(필수)</span></div> 
               
            <input type = "text" class = "right" name="userName" id="userName"  required>
                  <label id="nameResult"></label>
                  <span id="spanteg">이름은 한글로 된 2글자 이상으로 입력하셔야합니다.</span>
            </div>
            
            
            <div class = "input">
               <div class = "left">아이디<span class = "must">(필수)</span></div>
               <input type = "text" class = "right" name="joinUserId" id="joinUserId"  required> 
                  <label id="idResult"></label>
                  <span id="spanteg1" >영어로 시작하며 영어와 숫자가 섞인 4자 이상 </span>
            </div>
                     
            <div class = "input">
               <div class = "left">비밀번호<span class = "must">(필수)</span></div>
                <input type = "password" class = "right" name="joinUserPwd" id="joinUserPwd"  required>
                  <label id="pwd1Result"></label>
                  <span id="spanteg2" >영어로 시작하며 영어와 숫자,  8~16자</span>
            </div>
            
            <div class = "input">
               <div class = "left">비밀번호 확인<span class = "must">(필수)</span></div>
               <input type = "password" class = "right" name="joinUserPwd" id="joinUserPwd2"  required>
                  <label id="pwd2Result"></label>
                  <span id="spanteg3">비밀번호와 일치하게 써주세요.</span>
            </div>
            
            
            
            <div class = "input">
               <div class = "left">닉네임<span class = "must">(필수)</span></div>
                <input type = "text" class = "right" name="nickName"> <input type="button" id="nickCheck" class="mini_bt" onclick="checkNickName();" value="중복확인"  required/>
            </div>
            
            <div class ="input">
               <div class = "left">주소</div>
                  
                  <input type = "text" class = "right address1" id="postalCode" name="postalCode" style = "width : 120px;"/>
                  <input type="button" onclick="goPopup()" class="mini_bt" style="margin-left:5px;" value="우편번호"/><br>
                     
                  <input type = "text" class = "right address1" id="bAddr" name="bAddr" style = "width : 400px;"><label class = address2>기본 주소</label> <br>
                  <input type = "text" class = "right" id="lAddr" name="lAddr" style = "width : 400px;" placeholder = "상세 주소를 입력해주세요."><label class = address2>나머지 주소</label>
                  
               
            </div>
            <script>
                  function goPopup(){
                     // 주소검색을 수행할 팝업 페이지를 호출합니다.
                     // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
                     var pop = window.open("../../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
                  }
                  function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
                     // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
                     document.getElementById("bAddr").value = roadAddrPart1;
                     document.getElementById("lAddr").value = addrDetail;
                     document.getElementById("postalCode").value = zipNo;
                  }
               </script>
            <div class = "input">
               
               <div class = "left">핸드폰 번호 </div>
                     <input type="text" class="right" name="phone" id="phone" placeholder="phone number" maxlength="11"  />
               </div>
            <script>

                  $(document).ready(function(){ 
                      $("input#phone").blur(function(){
                         var num = $("#phone").val();
                         blur(num)
                      });
                      $("input#phone").click(function(){
                         var num = $("#phone").val();
                         focus(num);
                      });
                  });

                  function focus(num) {
                     num = num.replace(/[^0-9]/g, '');
                     $("#phone").val(num);
                  }
                  
                  function blur(num) {
                     num = num.replace(/[^0-9]/g, '');
                     var tmp = '';
                     tmp += num.substr(0, 3);
                     tmp += '-';
                     tmp += num.substr(3, 4);
                     tmp += '-';
                     tmp += num.substr(7);
                     $("#phone").val(tmp);
                  }
            </script>
            
            
            <div class = "input"  id = "end_line">
            	<input id="emailfix" type="hidden" name="email">
               <div class = "left">이메일<span class = "must">(필수)</span></div>
               <div> 
              		<input type = "text" class = "right email" id="email01" maxlength="16" placeholder="이메일을 입력해주세요." name="email01"  required> 
             	 	 @ <input type = "text" class = "right email" id="email02"  name="email02" required> 
               <select name="selectEmail" id="selectEmail">
                  <option value="1">직접입력</option>
                  <option value="daum.net">daum.net</option>
                  <option value="empal.com" >empal.com</option>
                  <option value="gmail.com" >gmail.com</option>
                  <option value="hanmail.com">hanmail.net</option>
                  <option value="msn.com">msn.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="nate.com">nate.com</option>
               </select> <br>
            </div>
               <label class = "must" style = "margin-bottom : 10px;">메일주소는 메일인증 후 비밀번호 변경이나 찾기 등에 사용됩니다.</label>
           </div>
           <script>
           var selectEmail = $("#selectEmail");
           $('#selectEmail').change(function(){
        	   $("#selectEmail option:selected").each(function () {
        		   if($('#selectEmail').val()== '1'){ //직접입력일 경우
        			   $("#email02").val(''); //값 초기화 
        			   $("#email02").attr("disabled",false); //활성화
        			}else{ //직접입력이 아닐경우 
        				$("#email02").val(selectEmail.val()); //선택값 입력
        				$("#email02").attr("disabled",true); //비활성화 
                    }
        		   });
        	   $('#emailfix').val($("#email01").val() + "@" + $('#email02').val());
        	   });

           </script>
     
            
            <div id = "access_terms1" ><b>약관 동의</b></div>
            
            <div id = "access_terms2">
               <div id = "access_all">
                  <input type = "checkbox" id="checkall" class="access_terms3">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다. 
               </div>
               
               <span class = "access_terms3" id = "check_content">[필수] 이용약관 동의</span>
               
               <div class = "access_terms3" style = "margin : 10px 30px 10px 0px;">
                  <textarea  id = "terms_content" >정보통신망법 규정에 따라 혼족에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 혼족 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 혼족는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 혼족가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
혼족에서 제공하는 위치기반 서비스에 대해서는 '혼족 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

2. 수집한 개인정보의 이용
혼족 및 혼족 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 혼족 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 파기
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다. QR코드 서비스에서 연락처를 등록한 이후 QR코드 삭제 시, 복구 요청 대응을 위해 삭제 시점으로 부터 6개월 보관합니다. 스마트 플레이스 서비스에서 휴대전화번호를 등록한 경우 분쟁 조정 및 고객문의 등을 목적으로 업체 등록/수정 요청시, 또는 등록 이후 업체 삭제 요청 시로부터 최대 1년간 보관 할 수 있습니다.

전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 혼족는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률       
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자금융거래법
전자금융에 관한 기록: 5년 보관
- 통신비밀보호법
로그인 기록: 3개월
회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.

전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.

참고로 혼족는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.</textarea>
                </div>    
         <div class = "access_terms3" id = "check_content" style = "font-size : 15px;">
            	   개인정보 수집 및 이용에 대한 안내(필수) <input type="checkbox"  class="access_terms3" >동의함
               </div>
               
                   <div class = "access_terms3" style = "margin : 10px 30px 10px 0px;">
                    <textarea  id = "terms_content" >아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.

-위탁받는 자(혼족업체) : (주)혼족
-위탁업무의 내용 : 모바일관련 고객정보 DB운영 지원업무
　　　　　　　　　회원정보 DB 시스템 운영 및 관리
　　　　　　　　　디지털 마케팅 업무</textarea>
               </div>
               <div class = "access_terms3" id = "check_content" style = "font-size : 15px;">
               이용약관에 동의하시겠습니까?(필수) <input type="checkbox"  class="access_terms3" >동의함
               </div>
            </div>
            <input type = "submit" id = "finish_bt" value = "회원가입">
            <!-- <button type="button" onclick="console.log($('#email02').val())">확인</button> -->
            </form>
         </div>
         
         <script>
         
         
 
                  $(document).ready(function(){
                      var flag = true;
                     var access_terms3= $('.access_terms3');
                      
                      $('#checkall').click(function(){
                          if(flag){
                             access_terms3.prop({
                                  'checked': true
                              });
                              flag = false;
                          }else{
                             access_terms3.prop({
                                  'checked': false
                              });
                              flag = true;
                          }
                      });
                  });
                  $(".access_terms3").click(function(){
                      if($("input[name='access_terms3']:checked").length == 3){
                          $("#checkall").prop("checked",true);
                      }else{
                          $("#checkall").prop("checked",false);
                      }

                  });
         
                 
                  </script>
            
         <script>
      $('#userName').blur(function(){
         var str = $(this).val();
         var regExp = /[^가-힣]/g;
         
         if(!regExp.test(str) && str.length >= 2){
            $('#nameResult').text("정상입력");
            $('#nameResult').css({'color':'#768149', 'diplay':'inline-block'});
            $("#spanteg").attr("hidden", true);
         } else {
            $('#nameResult').text("알맞은 이름을 입력하세요");
            $('#nameResult').css({'color':'#f18332', 'diplay':'inline-block'});
           
            $(this).focus();
         }
      });
      var isUsable = false;
		var isIdChecked = false;
		
		
		$('#joinUserId').on('change paste keyup', function(){
			isIdChecked = false;
		});
		
		$('#joinUserId').change(function(){
			var userId = $('#joinUserId');
			
			var str = $(this).val();
            var regExp1 = /^[a-z]/gi; 
            var regExp2 = /[^a-z][^0-9]/gi; 
            var regExp3 = /[0-9]/gi; 
			if(userId.val().trim().length < 4 ){
				alert('아이디는 최소 4자리 이상이어야 합니다.');
				userId.focus();
			} else if (!regExp1.test(str) || regExp2.test(str) || !regExp3.test(str)){
				alert('알맞은 아이디를 입력하세요');
				userId.focus();
			} else{
				$.ajax({
					url: "<%= request.getContextPath()%>/idCheck.me",
					data: {userId: userId.val()},
					success: function(data){
						if(data == 'success'){
							$('#idResult').text("이미 사용 중인 아이디입니다.");
							$('#idResult').css({'color':'#f18332', 'diplay':'inline-block'});
							userId.focus();
							isUsable = true;
							isIdChecked = true;
							
						} else {
							$('#idResult').text('사용 가능한 아이디입니다.');
							
							$('#idResult').css({'color':'#768149', 'diplay':'inline-block'});
							$("#spanteg1").attr("hidden", true);
					            isUsable = false;
							isIdChecked = false;
							
						}
					}
				});
			}
		});
	      
		
		function validate(){
			if(isUsable && isIdChecked){
				return true;
			} else{
				alert('아이디 중복확인을 해주세요');
				return false;
			}
		}
      
      $('#joinUserPwd').blur(function(){
         var str = $(this).val();
         var regExp1 = /^[a-z]/gi; 
         var regExp2 = /[^a-z][^0-9][^!*&]/gi; 
         var regExp3 = /[0-9]/gi;
         
         if(regExp1.test(str) && !regExp2.test(str) && regExp3.test(str) && str.length >= 8 && str.length <= 16){
            $('#pwd1Result').text("정상입력");
            $('#pwd1Result').css({'color':'#768149', 'diplay':'inline-block'});
            $("#spanteg2").attr("hidden", true);
         } else {
            $('#pwd1Result').text("알맞은 비밀번호를 입력하세요");
            $('#pwd1Result').css({'color':'#f18332', 'diplay':'inline-block'});
         
            $(this).focus();
         }
      });
      
      $('#joinUserPwd2').focus(function(){
         $(this).parent().css('background', 'beige');
      });
      var checkPwd = function(){
         if($('#joinUserPwd2').val() == "") {
            $('#pwd2Result').text("");
         } else if($('#joinUserPwd').val() == $('#joinUserPwd2').val()){
            $('#pwd2Result').text("비밀번호 일치");
            $('#pwd2Result').css({'color':'#768149', 'diplay':'inline-block'});
            $("#spanteg3").attr("hidden", true);
         } else{
            $('#pwd2Result').text("비밀번호 불일치");
            $('#pwd2Result').css({'color':'#f18332', 'diplay':'inline-block'});
         }
      }
      $('#joinUserPwd2').keyup(function(){
         checkPwd();
      });
      $('#joinUserPwd').change(function(){
         checkPwd();
      });
      $('#joinUserPwd2').blur(function(){
         $(this).parent().css('background', '');
      });
     
    
     
     
   </script>
         
      </div>
   
   </section>
   <script>
    
      function checkNickName(){
         window.open("nickNameCheckForm.jsp", "checkNickForm", "width=500, height=300");
      }
   
   </script>
   <footer>
   
   </footer>

</body>
</html>