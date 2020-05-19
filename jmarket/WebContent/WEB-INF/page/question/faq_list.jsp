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
<script type="text/javascript">
function sendlogin() {
	var f = document.loginform;
	f.action = "<%=cp%>/user/login_ok.do";
	f.submit();
}
function btn(){
	if(document.getElementById("answer").style.visibility=="collapse"){
		document.getElementById("answer").style.visibility="visible";
		document.getElementById("btn").innerHTML="▲";
	}else{
		document.getElementById("answer").style.visibility="collapse";
		
		document.getElementById("btn").innerHTML="▼";
	}
	
}

</script>
</head>
<body>	
	<div id="mainframe">
	<jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	<section class="container">
		<article>
			<div style="width: 700px; margin: 30px auto;">
				<h2 class="maintitle" style="text-align: center;">자주묻는질문</h2>
				<div class="main" style="width: 700px; margin: 30px auto;">
					<table style="width: 700px; margin: 0px auto; border-spacing: 0; border-collapse: collapse;">
						<tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
							<th width="60" style="color: #787878;">번호</th>
							<th style="color: #787878;">제목</th>
							<th width="60" style="color: #787878;"></th>
						</tr>
						<tr align="center" height="35" style="border-bottom: 1px solid #cccccc;"> 
							<td>1</td>
							<td align="left" style="padding-left: 10px;">
								질문입니당
							</td>
							<td><button id="btn" onclick="btn();">▼</button></td>
						</tr>
						<tr id="answer" align="center" height="35" style="visibility:collapse; border-bottom: 1px solid #cccccc;">
							<td colspan="3">답변입니당</td>
						</tr>
					</table>
					<button type="button" onclick="javacript:location.href='<%=cp%>/question/faq_created.do'">글올리기</button>
				</div>
			</div>
		</article>
	</section>
	</div>
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>