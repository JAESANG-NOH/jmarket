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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resource/css/home.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sblist.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">

</head>
<body>
	<div id="mainframe">
	 <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 
	 <form name="join" method="post">
		<section class="container">
			<article>
				<div class="content" >
						<div class="bb">
							<div id="box" style="width:700px; ">
							<h2>| 판매중</h2><br>
							<ul class="row" style="border-top: 1px solid #999; color:black;"> 
							<li style="line-height: 95px;font-weight: bold;">사진</li>
							<li style= "width:320px; text-align: center; line-height: 95px; font-weight: bold;">상품명</li>
							<li style="width: 140px; line-height: 95px;font-weight: bold;">작성자</li>
							<li style="line-height: 95px;font-weight: bold;">작성일</li>
							<li style="line-height: 95px;font-weight: bold;">조회수</li>
							</ul>
					
							<ul class="row">
							<li> <img class="photo" src="./images/air.jpg" style="width: 70px; height: 78px;"></li>
							<li style= "width:320px; text-align: left;line-height: 95px;"><a href="3air.html">&nbsp;&nbsp;에어팟 삽니다</a></li>
							<li style="width: 140px;line-height: 95px;">cute은ㅈ1ㄴ1</li>
							<li style="line-height: 95px;">2020-10-10</li>
							<li style="line-height: 95px;">110</li>
							</ul>

							<div>
								<h4 style="text-align: right; width: 340px; margin: 0 50px; 0 50px;">1 2 3 4</h4>
								<span style="float:right"><input type="button" value="글쓰기 "></span>
							</div>
						</div>
					</div>
				</div>
			</article>
			<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"></jsp:include>
		</section>
	 </form>
	</div>
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>