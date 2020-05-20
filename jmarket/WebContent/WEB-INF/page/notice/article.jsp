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
<link rel="stylesheet" href="<%=cp%>/resource/css/sbwrite.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
</div>


<section class="container">
			<article>
				<div class="content">
					<h2>| 게시글</h2>
					<div class="pageline">
						<ul class = "pagetitle">
							<li class="pcategory">[공지]</li>
							<li class="pname">자몽마켓 회원전용 금융 서비스 오픈!!</li>
						</ul>
						<ul class="pagerow1">
							<li class="pageinfo1">[게시번호]<li>
							<li class="pageinfo2">1<li>
							<li class="pageinfo1">[등록인]<li>
							<li class="pageinfo2">관리자<li>
						</ul>
						<ul class="pagerow2">
							<li class="pageinfo1">[게시날짜]<li>
							<li class="pageinfo2">2020-04-21<li>
							<li class="pageinfo1">[조회수]<li>
							<li class="pageinfo2">600<li>
						</ul>
						<div class="pagerow3">
							<div class="mainline">자몽마켓 회원전용 금융 서비스가 오픈했습니다. 많은 이용 부탁드립니다.</div>
						</div>
					</div>
						<div class="btnline"><button>수정</button><button>목록</button></div>
				</div>
			</article>
			
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