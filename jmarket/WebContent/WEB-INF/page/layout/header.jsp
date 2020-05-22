<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function sendlogin() {
	var f = document.loginform;
	f.action = "<%=cp%>/user/login_ok.do";
	f.submit();
}
</script>
<form name="loginform" method="post">
<header>
			<div id="menuline" class="container">
				<ul class="nav">
					<li><a href="<%=cp%>/home/home.do" class="useron">HOME</a>
					
					<li><a href="">회사소개</a>
					<li><a href="">팝니다</a>
						<ul>
							<li><a href="">판매중</a></li>
							<li><a href="">판매완료</a></li>
						</ul>

					<li><a href="">삽니다</a>
						<ul>
							<li><a href="">구매중</a></li>
							<li><a href="">구매완료</a></li>

						</ul>

					<li><a href="">고객센터</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">이벤트</a></li>
							<li><a href="">신고게시판</a>
							<li><a href="<%=cp%>/faq/faq_list.do">문의</a></li>

						</ul>
<c:if test="${empty sessionScope.member}">
					<li><a href="">로그인</a>
						<ul>
							<li><a href="<%=cp%>/user/newuser.do">회원가입</a></li>
							<li><a>ID&nbsp;<input class="login" type="text" maxlength="10" name="id">&nbsp;&nbsp;&nbsp;&nbsp;Password&nbsp;<input class="login" type="password" maxlength="10" name="pwd">&nbsp;&nbsp;<button class="loginbtn" type="button" onclick="sendlogin();">로그인</button></a></li>
						</ul>
</c:if>
<c:if test="${not empty sessionScope.member}">
					<li><a href="">회원</a>
						<ul>
							<li><a href="<%=cp%>/user/logout.do">로그아웃</a></li>
						</ul>
</c:if>
				</ul>
				
			</div>


			<div id="logo">
				<div id="logoline" class="container">
					<div id="logotxt">
						<h1>
						<img class="img box"src="<%=cp%>/resource/image/jm.jpg">
							<a 	style="font-family: 'Jua', sans-serif;"  href="<%=cp%>/home/home.do">자몽마켓</a>							
						</h1>
						<p>자몽 마켓에 오신것을 환영합니다.</p>
					</div>
				</div>
			</div>
			<!-- section 끝 -->
</header>
</form>