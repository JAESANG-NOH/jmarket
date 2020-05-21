<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=cp%>/resource/css/home.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sale-list.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">

<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	f.submit();
}

</script>
</head>

<body>
<div id="mainframe">
	<jsp:include page="/WEB-INF/page/layout/header.jsp"/>
<form name="join" method="post" action="">

<section class="container">
		<article>
				<div class="content" >
						<div class="bb">
		<div id="box" style="width:700px; ">
		<h2>| 판매중</h2><br>
<ul class="row" style="border-top: 1px solid #999; color:black;"> 
<li style="line-height: 95px;font-weight: bold;">사진</li>
<li style= "width:320px; text-align: center;line-height: 95px;font-weight: bold;">상품명</li>
<li style="width: 140px;line-height: 95px;font-weight: bold;">작성자</li>
<li style="line-height: 95px;font-weight: bold;">작성일</li>
<li style="line-height: 95px;font-weight: bold;">조회수</li>
</ul>

<c:forEach var="dto" items="${list}">
<ul class="row">
<li> <img class="photo" src="./images/wc.jpg" style="width: 70px; height: 78px;"></li>
<li style= "width:320px; text-align: left; line-height: 95px;">${dto.subject}</li>
<li style="width: 140px;line-height: 95px;">${dto.name}</li>
<li style="line-height: 95px;">${dto.created }</li>
<li style="line-height: 95px;">${dto.hitCount}</li>
<li>
	<c:if test="${not empty dto.fileName}">
	  <a href="<%=cp%>/sale/list.do?num=${dto.num}"></a>
	</c:if>
</li>
</ul>
</c:forEach> 
</div>
</div>
		</div>

			</article>
				<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"/>
		</section>
		</form>
		</div>
	<!-- 내용 끝 -->
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>

</body>
</html>