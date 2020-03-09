<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, e_market.model.vo.*, a_common.*, java.text.DecimalFormat"  %> 
<%
   ArrayList<Market> mList = (ArrayList<Market>)request.getAttribute("mList");
   ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   
   DecimalFormat formatter = new DecimalFormat("###,###,###");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
   body{background:#fffcf7}
   .tableArea{width:900px; height:auto;}
   .listArea{ width:900px; text-align:left; height:250px; cursor:pointer;}
   #nolist{width:900px; text-align:center; border-top:1px solid gray; border-bottom:1px solid gray;}
   td{padding-left:5px;}
   #title{font-size:1.5em; font-weight:bolder; height:20px; padding:7px; 
          color:#768149}
   #writer{font-size:14px; color:#606060; font-weight:bold;}
   #status{font-weight:bold; font-size:18px;}
   #price{font-size:25px; font-weight:bold;}
   #etc{font-size:13px; color:#808080;}
   
   
   .buttonArea {width:100px; margin-left:auto; margin-right:auto; float:right;}
   #insertBtn{background-color : rgb(241, 131, 50); border-radius: 5px; border:0px; font-size:17px;
            color: white; width: 100px; height: 40px; cursor: pointer; font-weight: bold;}
  
      
   button{border: 0px; border-radius: 5px; background:gray; padding:5px auto;}
   button:hover{cursor: pointer;}
   .pagingArea{display:block;}
   .pagingArea > button{border-radius: 50px; background:none; color:#805959; margin:3px; padding:10px auto;}
   #numBtn{background:none; margin:3px; padding:10px auto;}
     #choosen{background:#f18332; border-radius:50px; color:white;}
     
    #sold{left:0px; width:300px; height:50px; font-size:2.5em; font-weight:bolder; bottom:78px; text-align:center;
             position:absolute; color:white; background: #A80013; transform: rotate(-15deg );}
   }
       
</style>

</head>
<body>
   <%@ include file="../a_common/boardCommon.jsp" %>
   <script>
      $('#boardName').text('혼플리마켓');
   </script>
   
   <div id="main">
      <div class="tableArea">
         <form>
            <table class="listArea" >
            <% if(mList.isEmpty()){ %>
            
               <tr>
                  <td rowspan="5" id="nolist">존재하는 게시글이 없습니다.</td>
               </tr>
            
            <% } else{ 
                  for(int i = 0; i < mList.size(); i++){
                     Market m = mList.get(i);
            %>   
               <tr id="borderTr"> 
               
                  <td rowspan="5" width="300px">
                  <input type="hidden" value ="<%= m.getPostNo() %>">
                     <% for(int j = 0; j < fList.size(); j++) {
                        Attachment a = fList.get(j);
                     %>
                     
                        <% if(m.getPostNo() == a.getPostNo()){%>
                           <% if(m.getSellYn().equals("Y")) {%>
                              <div style="position: relative;">
                                 <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName()%>"
                                    width="300px" height="246px" style="opacity:0.3;">
                                 <div id="sold">
                                    SOLD &nbsp;&nbsp; OUT   
                                 </div>
                              </div>
                           <% }  else {%>   
                              <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName()%>"
                                 width="300px" height="246px" class="detail">
                           <% } %>
                        <% } %>            
                     <% } %>
                     
                  </td>
                     <td width="600px" id="title" class="detail"><%= m.getPostTitle() %></td>
               </tr>
               <tr>
                  <td class="detail" id="writer" style="text-align:right" height=10px;><%= m.getWriter() %></td>
               </tr>
                  
               <tr>
                  <% if(m.getItemStatus().equals("A")){ %>
                     <td class="detail" id="status" style="color:orangered"><%= m.getItemStatus() %>급</td>
                    <% } else if(m.getItemStatus() == "B" ){  %>
                     <td class="detail" id="status" style="color:#FF7F00"><%= m.getItemStatus() %>급</td>
                   <% } else { %>
                     <td class="detail" id="status" style="color:#F6BB43"><%= m.getItemStatus() %>급</td>
                   <% } %>
               </tr>
                  
               <tr>
                  <td class="detail" id="price"> <%= formatter.format(m.getItemPrice()) %>원</td>
               </tr>
                  
               <tr>
                  <% if(m.getEtc().length() > 43) { 
                     String etc = m.getEtc().substring(0,43);
                  %>
                     <td class="detail" id="etc"><%= etc + "..." %></td>
                  <% } else { %>
                     <td class="detail" id="etc"><%= m.getEtc() %></td>
                  <% } %>
               </tr>
               
               <%       }
               }
            %>
            
            </table>
               
            <br><br>
               </form>
            
            <div class="buttonArea">
                <% if(loginUser != null) { %> 
                  <button type="button" onclick="location.href='views/e_market/marketInsertForm.jsp'" id="insertBtn">글쓰기</button>
                <% } %> 
            </div>
            
            <br><br><br>
				
	
			
		<div class="pagingArea" align="center">	
			<% if(!mList.isEmpty()){ %>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=1'">&lt;&lt;</button>
			
			
			<button  onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= currentPage-1%>'" id="beforeBtn" class="pagingBtn">pre</button>
			
			<script>
				if(<%= currentPage%> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', 'true');
				}
			</script>
			
			
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button  id="choosen" disabled><%= p %></button>
				<% } else {%>
					<button  id="numBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			
			<button  class="pagingBtn" onclick="location.href='<%= request.getContextPath()%>/list.m?currentPage=<%= currentPage + 1%>'" id="afterBtn">next</button>
			<script>
				if(<%= currentPage%> >= <%= maxPage%>){
					var after = $("#afterBtn");
					after.attr('disabled', 'true');
				}
			</script>
			
			
			<button  class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/list.m?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
			<% } %>
		</div>	
		
			
		</div>
	</div>
	
	<script>
    $('.pagingBtn').mouseenter(function(){
        $(this).css('background','#FFD393');
     }).mouseout(function(){
        $(this).css('background','none');
     });
	
		$(function(){
			$('.listArea img').click(function(){
				var postno = $(this).prev().val();
				location.href="<%= request.getContextPath() %>/detail.m?postNo=" + postno;
			})
		});
		
	</script>
	
</body>
</html>