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
<link rel="stylesheet" href="home.css" type="text/css">
<link rel="stylesheet" href="menu.css" type="text/css">
<link rel="stylesheet" href="sale-list.css" type="text/css">
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
<div id="mainframe">
	<jsp:include page="/WEB-INF/page/layout/header.jsp"/>
</div>
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

<ul class="row">
<li> <img class="photo" src="./images/wc.jpg" style="width: 70px; height: 78px;"></li>
<li style= "width:320px; text-align: left; line-height: 95px;"><a href="2watch.html" >&nbsp;&nbsp;갤럭시워치 42mm 골드 LTE+블루투스 판매합니다</a></li>
<li style="width: 140px;line-height: 95px;">신두철</li>
<li style="line-height: 95px;">2020-10-10</li>
<li style="line-height: 95px;">10</li>
</ul>
</div>


</div>
		</div>

			</article>
				<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"/>
		</section>
		</form>
	<!-- 내용 끝 -->
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
	
</body>
</html>