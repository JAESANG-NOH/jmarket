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
<link rel="stylesheet" href="<%=cp%>/resource/css/join.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript">
function sendlogin() {
	var f = document.loginform;
	f.action = "<%=cp%>/user/login_ok.do";
	f.submit();
}
function sendjoin() {
	var f = document.loginform;
	f.action = "<%=cp%>/user/newuser.do";
	f.submit();
}
</script>
</head>
<body>
	<div id="mainframe">
	 <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 
	 <form name="join" method="post">
	 		<section class="container">
			<article>
				<div id = "content">
					<h2>|&nbsp;&nbsp;회원가입</h2>
					<div id = "newaccount">
						<ul>
							<li class="infotxt">아이디</li>
							<li class="inputtxt"><input></li>
						</ul>
						<ul>
							<li class="infotxt">패스워드</li>
							<li class="inputtxt"><input></li>
						</ul>
						<ul>
							<li class="infotxt">패스워드 확인</li>
							<li class="inputtxt"><input></li>
						</ul>
						<ul>
							<li class="infotxt">이름</li>
							<li class="inputtxt"><input></li>
						</ul>
						<ul>
							<li class="infotxt">생년월일</li>
							<li class="inputtxt"><input></li>
						</ul>
						<ul>
							<li class="infotxt">전화번호</li>
							<li class="inputtxt">
							<select>
							<option selected="selected"> 010 </option>
							<option > 011 </option>
							<option > 012 </option>
							<option > 019 </option>
							</select>
							- <input class="tel"> - <input class="tel"></li>
						</ul>
						<ul>
							<li class="infotxt cityinfotxt">주소</li>
							<li class="inputtxt"><input class="cityline"></li>
						</ul>
						<ul>
							<li class="infotxt cityinfotxt">&nbsp;</li>
							<li class="inputtxt"><input class="cityline"></li>
						</ul>
						<ul>
							<li class="infotxt">이메일</li>
							<li class="inputtxt">
								<input> @ 
								<select id="email-selected">
									<option selected="selected"> NAVER </option>
									<option > DAUM </option>
									<option > GMAIL </option>
									<option > 직접입력 </option>
								</select>
							</li>
						</ul>
					</div>
						<div class="btnbox"><button class="btn1" type="button" onclick="sendjoin();">제 출</button>&nbsp;&nbsp;<button class="btn1">취 소</button></div>
				</div>
			</article>
			<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"></jsp:include>
		</section>
	 </form>
	</div>
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>