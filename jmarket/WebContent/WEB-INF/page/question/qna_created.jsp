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

</script>
</head>
<body>
<div id="mainframe">
<jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 <section class="container">
		<article>
			<div id = "content">
			<h2>|&nbsp;&nbsp;문의하기</h2>
				<div class="main" style="width: 700px; margin: 30px auto;">
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;" >카테고리</th>
					      <td colspan="3">이벤트문의</td>
					  </tr>
					  <tr align="center"  height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;" >연관 FAQ</th>
					      <td colspan="3">1 이벤트는 언제하는지 알고싶어요</td>
					  </tr>
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">문의제목</th>
					      <td>이벤트언제해용??</td>
					      <th bgcolor="#eeeeee" style="color: #787878;">상품선택</th>
					      <td>패딩조끼</td>
					  </tr>
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">문의내용</th>
					      <td colspan="3">
					      	<textarea name="content" rows="12" class="boxTA" style="width: 95%;"></textarea>
					      </td>
					  </tr>
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">첨부파일</th>
					      <td colspan="3">
					      	<input type="text" readonly="readonly">
					      	<button>업로드</button>
					      </td>
					  </tr>
					</table>
					<button>문의하기 등록</button>
					<button>입력취소</button>
				</div>
			</div>
		</article>
		<div class="sidebox">
			<div id="sidetitle">
				<h2 style="font-family: 'Do Hyeon', sans-serif;">|&nbsp;&nbsp;메뉴</h2>
			</div>
			<ul>
				<li><a href="<%=cp%>/question/faq_list.do">-FAQ</a></li>
				<li><a href="#">-문의하기</a></li>
				<li><a href="#">-문의내역</a></li>
			</ul>
		</div>
	</section>
</div>
<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>