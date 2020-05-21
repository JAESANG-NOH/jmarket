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


</script>
</head>
<body>
<div id="mainframe">
<jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 <section class="container">
		<article>
			<div id = "content">
			<h2>|&nbsp;&nbsp;나의 문의내역</h2>
				<div class="main" style="width: 700px; margin: 30px auto;">
					<p align="right">총 문의건:1건&nbsp;|&nbsp;답변완료:0건&nbsp;|&nbsp;처리중0건&nbsp;|&nbsp;접수완료:1건</p>
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" bgcolor="#ffffff"  height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="100" bgcolor="#eeeeee" style="color: #787878;">문의 접수일</th>
					      <td >년월일~년월일</td>
					      <td width="150">
					      	<button>1개월</button>
					      	<button>전체</button>
					      </td>
					  </tr>
					  
					</table>
					<br>
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="60" style="color: #787878;">번호</th>
					      <th width="80" style="color: #787878;">카테고리</th>
					      <th style="color: #787878;">문의제목</th>
					      <th width="80" style="color: #787878;">문의일</th>
					      <th width="80" style="color: #787878;">답변일</th>
					      <th width="80" style="color: #787878;">처리상태</th>
					  </tr>
					  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					      <td>1</td>
					      <td>이벤트문의</td>
					      <td align="left" style="padding-left: 10px;">문의제목이용</td>
					      <td>2020-05-20</td>
					      <td>2020-05-20</td>
					      <td>접수완료</td>
					  </tr>
					  <tr id="answer" align="center" height="35" style="visibility:visible; border-bottom: 1px solid #cccccc;">
							<td colspan="6" style="background: #EAEAEA;">내용</td>
					  </tr>
					</table>
				</div>
			</div>
		</article>
		<div class="sidebox">
			<div id="sidetitle">
				<h2 style="font-family: 'Do Hyeon', sans-serif;">|&nbsp;&nbsp;메뉴</h2>
			</div>
			<ul>
				<li><a href="<%=cp%>/question/faq_list.do">-FAQ</a></li>
				<li><a href="<%=cp%>/question/qna_created.do">-문의하기</a></li>
				<li><a href="<%=cp%>/question/qna_list.do">-문의내역</a></li>
			</ul>
		</div>
	</section>
</div>
<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>