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
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	 <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 
	 <section class="container">
			<article>
				<div style="width: 1200px; height: 2000px;">
						<h2 class="maintitle" style="font-size:30px; text-align: center;">자몽마켓 인기 매물</h2>
						<div class="main">
							<table class=main-list style="border: 1px dotted silver; margin: 20px 0px 0px 80px;">
								<tr >
									<td style="font-size:20px; padding: 30px 30px 0px 30px;" colspan="3"><b>팝니다&nbsp;</b>|&nbsp;<span style="color: gray;" >전체보기</span></td>
								</tr>
								<tr>
									<td ><a href="2mac.html"><img class="main-img" src="<%=cp%>/resource/image/main1.jpg" width="300" height="300" style="margin:10px 30px 10px 30px;"></a></td>
									<td><a href="3air.html"><img class="main-img"  src="<%=cp%>/resource/image/main1.jpg" width="300" height="300" style="margin:10px 30px 10px 30px;"></a></td>
									<td><a href="1jjope.html"><img class="main-img"  src="<%=cp%>/resource/image/main1.jpg" width="300" height="300" style="margin:10px 30px 10px 30px;"></a></td>
								</tr>
								<tr style="text-align: center; font-size: 15px;">
									<td > macbook 팝니다.  </td>
									<td> airpods 팝니다. </td>
									<td> 조끼패딩 팝니다. </td>
								</tr>
								<tr style="text-align: center; font-size: 15px; color: #ee6d62;">
									<td >100,000원</td>
									<td> 2,000원</td>
									<td> 1,000원</td>
								</tr>
							
							</table>
							
							<table class=main-list style="border: 1px dotted silver; margin: 20px 0px 0px 80px;">
								<tr >
									<td style="font-size:20px; padding: 30px 30px 0px 30px;" colspan="3"><b>삽니다&nbsp;</b>|&nbsp;<span style="color: gray;" >전체보기</span></td>
								</tr>
								
								<tr>
									<td ><a href="2mac.html"><img class="main-img" src="<%=cp%>/resource/image/main1.jpg" width="300" height="300" style="margin:10px 30px 10px 30px;"></a></td>
									<td><a href="3air.html"><img class="main-img"  src="<%=cp%>/resource/image/main1.jpg" width="300" height="300" style="margin:10px 30px 10px 30px;"></a></td>
									<td><a href="1jjope.html"><img class="main-img"  src="<%=cp%>/resource/image/main1.jpg" width="300" height="300" style="margin:10px 30px 10px 30px;"></a></td>
								</tr>
								<tr style=" text-align: center; font-size: 15px;">
									<td > macbook 팝니다.  </td>
									<td> airpods 팝니다. </td>
									<td> 조끼패딩 팝니다. </td>
								</tr>
								<tr style="text-align: center; font-size: 15px; color: #ee6d62;">
									<td >100,000원</td>
									<td> 2,000원</td>
									<td> 1,000원</td>
								</tr>
							
							</table>
						</div>
				</div>
			</article>
		</section>
	</div>
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>