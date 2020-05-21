<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="<%=cp%>/resource/css/report1.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/home.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">

<script type="text/javascript">
function deleteReport(num) {
	<c:if test="${sessionScope.member.id == 'admin' || sessionScope.member.id == dto.id}">
	    if(confirm("해당 게시물을 삭제하시겠습니까 ?"))
	    var url = "<%=cp%>/report/delete.do?num="+num+"&${query}";
	    location.href=url;
	</c:if>    
}
</script>

</head>
<body>

<div id="mainframe">
<jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>

<section class="container">
			<article>
				<div class="content">
					<h2>|&nbsp;&nbsp;신고하기</h2>
					<div class="pageline">
						<ul class = "pagetitle">
							<li class="pcategory">[신고]</li>
							<li class="pname">${dto.title}</li>
						</ul>
						<ul class = "pagerow1">
							<li class="pageinfo1">[게시번호]</li>
							<li class="pageinfo2">${dto.num}</li>
						</ul>
						<ul class = "pagerow1">
							<li class="pageinfo1">[등록인]</li>
							<li class="pageinfo2">${dto.name}</li>
						</ul>
						<ul class = "pagerow2">
							<li class="pageinfo1">[게시날짜]</li>
							<li class="pageinfo2">${dto.created}</li>
						</ul>
						<ul class = "pagerow2">
							<li class="pageinfo1">[조회수]</li>
							<li class="pageinfo2">${dto.views}</li>
						</ul>
						<div class="pagerow3">
							<div class="mainline">${dto.content}</div>
						</div>
					</div>
						<div class="btnline">
							<c:if test="${sessionScope.member.id==dto.id}">	
								<button type="button" class="bnt" onclick="javascript:location.href='<%=cp%>/report/update.do?&num=${dto.num}&${query}';">수정</button>
							</c:if>
							<c:if test="${sessionScope.member.id==dto.id || sessionScope.member.id=='admin'}">	
								<button type="button" class="bnt" onclick="deleteReport('${dto.num}');">삭제</button>
							</c:if>
								<button type="button" class="bnt" onclick="javascript:location.href='<%=cp%>/report/list.do?${query}';">목록</button>
						</div>
				</div>
			</article>
			<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"></jsp:include>
		</section>
	</div>
			
   <jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>

</body>
</html>