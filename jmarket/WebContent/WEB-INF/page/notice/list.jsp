<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="<%=cp%>/resource/css/home.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sbwrite.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/notice1.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">

<script type="text/javascript">
function sendlogin() {
	var f = document.loginform;
	f.action = "<%=cp%>/user/login_ok.do";
	f.submit();
}
</script>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
</div>
<div class="container">
    <div class="body-container" style="width: 700px;">
        <div class="body-title">
            <h3><span style="font-family: Webdings">2</span> 공지사항 </h3>
        </div>
        
        <div>
        <form name="listForm" action="<%=cp%>/notice/list.do" method="post">
			<table style="width: 100%; margin-top: 20px; border-spacing: 0;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${dataCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
			          <select  name="rows" class="selectField" onchange="listNotice();">
			          		<option value="5" ${rows==5 ? "selected='selected' " : "" }>5개씩 출력</option>
			          		<option value="10" ${rows==10 ? "selected='selected' " : "" }>10개씩 출력</option>
			          		<option value="20" ${rows==20 ? "selected='selected' " : "" }>20개씩 출력</option>
			          		<option value="30" ${rows==30 ? "selected='selected' " : "" }>30개씩 출력</option>
			          		<option value="50" ${rows==50 ? "selected='selected' " : "" }>50개씩 출력</option>
			          </select>
					  <input type="hidden" name="page" value="${page}">
					  <input type="hidden" name="condition" value="${condition}">
					  <input type="hidden" name="keyword" value="${keyword}">
			      </td>
			   </tr>
			</table>
		</form>
			
			<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
			  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <th width="60" style="color: #787878;">번호</th>
			      <th style="color: #787878;">제목</th>
			      <th width="100" style="color: #787878;">작성자</th>
			      <th width="80" style="color: #787878;">작성일</th>
			      <th width="60" style="color: #787878;">조회수</th>
			      <th width="50" style="color: #787878;">다운</th>
			  </tr>
			 
			 <c:forEach var="dto" items="${listNotice}">
			  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
			      <td>
			           <span style="display: inline-block;padding:1px 3px; background: #ED4C00;color: #FFFFFF; ">공지</span>
			      </td>
			      <td align="left" style="padding-left: 10px;">
			           <a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
			      </td>
			      <td>${dto.name}</td>
			      <td>${dto.created}</td>
			      <td>${dto.hitcount}</td>
			      <td>
						<c:if test="${not empty dto.afilename}">
						      <a href="<%=cp%>/notice/download.do?num=${dto.num}"><img src="<%=cp%>/resource/images/disk.gif" border="0" style="margin-top: 1px;"></a>
						</c:if>
			      </td>
			  </tr>
			</c:forEach> 

			 <c:forEach var="dto" items="${list}">
			  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;">
			      <td>${dto.listnum}</td>
			      <td align="left" style="padding-left: 10px;">
			           <a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
			           <c:if test="${dto.gap<1}"><img src="<%=cp%>/resource/images/new.gif"></c:if>
			      </td>
			      <td>${dto.name}</td>
			      <td>${dto.created}</td>
			      <td>${dto.hitcount}</td>
			      <td>
						<c:if test="${not empty dto.afilename}">
						      <a href="<%=cp%>/notice/download.do?num=${dto.num}"><img src="<%=cp%>/resource/images/disk.gif" border="0" style="margin-top: 1px;"></a>
						</c:if>
			      </td>
			  </tr>
			</c:forEach> 

			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="35">
				<td align="center">
			        ${datacount!=0?paging:"등록된 게시물이 없습니다."}
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/notice/list.do';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="<%=cp%>/notice/list.do" method="post">
			              <select name="condition" class="selectField">
			                  <option value="title"     ${condition=="title"?"selected='selected'":"" }>제목</option>
			                  <option value="name" ${condition=="name"?"selected='selected'":"" }>작성자</option>
			                  <option value="content"     ${condition=="content"?"selected='selected'":"" }>내용</option>
			                  <option value="created"     ${condition=="created"?"selected='selected'":"" }>등록일</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="rows" value="${rows}">
			            <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
			      <td align="right" width="100">
					<c:if test="${sessionScope.member.id == 'admin' }">			      
			          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/notice/created.do?rows=${rows}';">글올리기</button>
			        </c:if>
			      </td>
			   </tr>
			</table>
        </div>

    </div>
</div>
<section>
			
			<aside>
				<div class="sidebox">
					<div id="sidetitle">
						
						<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"></jsp:include>
						</div>
				</div>
			</aside>
		</section>

<div class="footer">
    <jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>