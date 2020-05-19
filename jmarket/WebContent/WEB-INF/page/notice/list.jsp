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
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
</div>

<section class="container">
			<article>
				<div class="content">
					<h2>|&nbsp;&nbsp;공지사항 </h2>
						<table class="table">
							<tr style="border-bottom: 1px solid silver;">
								<td class="num">번호</td>
								<td class="tilte" style="text-align: left;">제목</td>
								<td class="writer">작성자</td>
								<td class="date">&nbsp;&nbsp;작성일자</td>
								<td class="count">조회수</td>
							</tr>
							
							
						</table>
						
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