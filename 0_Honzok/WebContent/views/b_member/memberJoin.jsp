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
         width : 60px;
         font-size : 10px;
         border-radius : 5px;
         margin-left : 10px;
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
               <input type = "text" class = "right" name="joinUserId" id="joinUserId"  required> <input type="button" id="idCheck" class="mini_bt" onclick="checkId();" value="중복확인"/>
                  <label id="idResult"></label>
                  <span id="spanteg1" >영어로 시작하며 영어와 숫자가 섞인 8~12자</span>
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
               <div class = "left">이메일<span class = "must">(필수)</span></div>
               <div> 
              		 <input type = "text" class = "right email" id="email01" maxlength="16" placeholder="이메일을 입력해주세요." name="email"  required> 
             	 	 @ <input type = "text" class = "right email" id="email02"> 
               <select name="selectEmail" id="selectEmail">
                  <option value="1">직접입력</option>
                  <option value="daum.net">daum.net</option>
                  <option value="empal.com" >empal.com</option>
                  <option  value="gmail.com" >gmail.com</option>
                  <option  value="hanmail.com">hanmail.net</option>
                  <option  value="msn.com">msn.com</option>
                  <option  value="naver.com">naver.com</option>
                  <option  value="nate.com">nate.com</option>
               </select> <br>
            </div>
               <label class = "must" style = "margin-bottom : 10px;">메일주소는 메일인증 후 비밀번호 변경이나 찾기 등에 사용됩니다.</label>
           </div>
           <script>
           $('#selectEmail').change(function(){
        	   $("#selectEmail option:selected").each(function () {
        		   if($(this).val()== '1'){ //직접입력일 경우
        			   $("#email02").val(''); //값 초기화 
        			   $("#email02").attr("disabled",false); //활성화
        			   }else{ //직접입력이 아닐경우 
        				   $("#email02").val($(this).text()); //선택값 입력
        				   $("#email02").attr("disabled",true); //비활성화 
        				   } 
        		   }); 
        	   });

           </script>
            
            
            <div id = "access_terms1" ><b>약관 동의</b></div>
            
            <div id = "access_terms2">
               <div id = "access_all">
                  <input type = "checkbox" id="checkall" class="access_terms3">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다. 
               </div>
               
               <span class = "access_terms3" id = "check_content">[필수] 이용약관 동의</span>
               
               <div class = "access_terms3" style = "margin : 10px 30px 10px 0px;">
                  <textarea  id = "terms_content" >이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
                  로 그들은 길지 아니한 목숨을 사는가 싶이 살았으 그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
                   평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의
                   대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는
                    천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
                  로 그들은 길지 아니한 목숨을 사는가 싶이 살았으 그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
                   평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의
                   대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는
                    천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길</textarea>
                </div>    
         <div class = "access_terms3" id = "check_content" style = "font-size : 15px;">
            	   이용약관에 동의하시겠습니까? <input type="checkbox"  class="access_terms3" >동의함
               </div>
               
                   <div class = "access_terms3" style = "margin : 10px 30px 10px 0px;">
                    <textarea  id = "terms_content" >이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
                  로 그들은 길지 아니한 목숨을 사는가 싶이 살았으 그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
                   평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의
                   대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는
                    천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
                  로 그들은 길지 아니한 목숨을 사는가 싶이 살았으 그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고
                   평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는 천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길이상 곧 만천하의
                   대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으  그들의 그림자는
                    천고에 사라지지 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길</textarea>
               </div>
               <div class = "access_terms3" id = "check_content" style = "font-size : 15px;">
               이용약관에 동의하시겠습니까? <input type="checkbox"  class="access_terms3" >동의함
               </div>
               
            </div>
            
            <input type = "submit" id = "finish_bt" value = "회원가입">
               
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
         function checkId(){
             window.open("idCheckForm.jsp", "checkForm", "width=500, height=300");
             
             
          }
         $('#joinUserId').focus(function(){
             $(this).parent().css('background', 'beige');
          });
          $('#joinUserId').blur(function(){
             var str = $(this).val();
             var regExp1 = /^[a-z]/gi; 
             var regExp2 = /[^a-z][^0-9]/gi; 
             var regExp3 = /[0-9]/gi; 
             
             if(regExp1.test(str) && !regExp2.test(str) && regExp3.test(str) && str.length >= 8 && str.length <= 12){
                $('#idResult').text("정상입력");
                $('#idResult').css('color', 'green');
                $(this).parent().css('background', '');
                $(this).css('background', '');
                $("#spanteg1").attr("hidden", true);
             } else {
                $('#idResult').text("알맞은 아이디를 입력하세요");
                $('#idResult').css('color', 'red');
              
                $(this).focus();
             }
          });
        
    		
         
         
      $('#userName').focus(function(){
         $(this).parent().css('background', 'beige');
      });
      $('#userName').blur(function(){
         var str = $(this).val();
         var regExp = /[^가-힣]/g;
         
         if(!regExp.test(str) && str.length >= 2){
            $('#nameResult').text("정상입력");
            $('#nameResult').css('color', 'green');
            $(this).parent().css('background', '');
            $(this).css('background', '');
            $("#spanteg").attr("hidden", true);
         } else {
            $('#nameResult').text("알맞은 이름을 입력하세요");
            $('#nameResult').css('color', 'red');
           
            $(this).focus();
         }
      });
     
      
      $('#joinUserPwd').focus(function(){
         $(this).parent().css('background', 'beige');
      });
      $('#joinUserPwd').blur(function(){
         var str = $(this).val();
         var regExp1 = /^[a-z]/gi; 
         var regExp2 = /[^a-z][^0-9][^!*&]/gi; 
         var regExp3 = /[0-9]/gi;
         
         if(regExp1.test(str) && !regExp2.test(str) && regExp3.test(str) && str.length >= 8 && str.length <= 16){
            $('#pwd1Result').text("정상입력");
            $('#pwd1Result').css('color', 'green');
            $(this).parent().css('background', '');
            $(this).css('background', '');
            $("#spanteg2").attr("hidden", true);
         } else {
            $('#pwd1Result').text("알맞은 비밀번호를 입력하세요");
            $('#pwd1Result').css('color', 'red');
         
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
            $('#pwd2Result').css('color', 'green');
            $("#spanteg3").attr("hidden", true);
         } else{
            $('#pwd2Result').text("비밀번호 불일치");
            $('#pwd2Result').css('color', 'red');
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