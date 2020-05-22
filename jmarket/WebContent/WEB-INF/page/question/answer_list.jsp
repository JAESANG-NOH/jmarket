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
function subclick(num){
	var answer=document.getElementById("answer"+num);
	if(answer.style.visibility=="collapse"){
		answer.style.visibility="visible";
	}else{
		answer.style.visibility="collapse";
	}
}

function sendOk(){
	var f=document.answerForm;
	f.action="<%=cp%>/qna/answer_created.do"; 
	f.submit();
}

</script>
<style type="text/css">
.subject:hover{
	text-decoration: underline;
}
</style>
</head>
<body>
<div id="mainframe">
<jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 <section class="container">
		<article>
			<div id = "content">
			<h2>|&nbsp;&nbsp;나의 문의내역</h2>
				<div class="main" style="width: 700px; margin: 30px auto;">
					<p align="right">총 문의건:1건&nbsp;|&nbsp;답변완료:0건&nbsp;|&nbsp;접수완료:1건</p>
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" bgcolor="#ffffff"  height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="100" bgcolor="#eeeeee" style="color: #787878;">문의 접수일</th>
					      <td>
					      	<select>
					      		<option>2015</option>
					      		<option>2016</option>
					      		<option>2017</option>
					      		<option>2018</option>
					      		<option>2020</option>
					      	</select>
					      	년
					      	<select>
					      		<option>1</option>
					      		<option>2</option>
					      		<option>3</option>
					      		<option>4</option>
					      		<option>5</option>
					      	</select>
					      	월~
					      	<select>
					      		<option>2015</option>
					      		<option>2016</option>
					      		<option>2017</option>
					      		<option>2018</option>
					      		<option>2020</option>
					      	</select>
					      	년
					      	<select>
					      		<option>1</option>
					      		<option>2</option>
					      		<option>3</option>
					      		<option>4</option>
					      		<option>5</option>
					      	</select>
					      	월
					      </td>
					      <td width="150">
					      	<button>1개월</button>
					      	<button>전체</button>
					      </td>
					  </tr>
					  
					</table>
					<br>
					<form name="answerForm" method="post">
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="40" style="color: #787878;">번호</th>
					      <th width="80" style="color: #787878;">카테고리</th>
					      <th style="color: #787878;">문의제목</th>
					      <th width="60" style="color: #787878;">이름</th>
					      <th width="80" style="color: #787878;">문의일</th>
					      <th width="80" style="color: #787878;">답변일</th>
					      <th width="80" style="color: #787878;">처리상태</th>
					  </tr>
					  <c:forEach var="dto" items="${list}">
						  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
						      <td>${dto.num}</td>
						      <td>${dto.category}</td>
						      <td align="left" style="padding-left: 10px;" class="subject" onclick="subclick(${dto.num});">${dto.subject}</td>
						      <td>${dto.id}</td>
						      <td>${dto.created}</td>
						      <td>${dto.an_created}</td>
						      <td>${dto.status==0?"접수완료":"답변완료"}</td>
						  </tr>
						  
						  <tr id="answer${dto.num}" height="35" style="visibility:collapse; border-bottom: 1px solid #cccccc;" >
							  <td colspan="7" style="background: #EAEAEA;">
								<p ><b style="color: gray;">Q.</b><b>${dto.subject}</b>&nbsp;${dto.created}	</p>
								<p>${dto.content}</p>	
								<button type="button" onclick="sendOk();">답변작성</button>
								<button type="reset">취소</button>
							  </td>
						  </tr>
					  </c:forEach>
					</table>
					</form>
				</div>
			</div>
		</article>
		<div class="sidebox">
			<div id="sidetitle">
				<h2 style="font-family: 'Do Hyeon', sans-serif;">|&nbsp;&nbsp;메뉴</h2>
			</div>
			<ul>
				<li><a href="<%=cp%>/faq/faq_list.do">-FAQ</a></li>
				<c:if test="${sessionScope.member.id!='admin'}">
					<li><a href="<%=cp%>/qna/qna_created.do">-문의하기</a></li>
					<li><a href="<%=cp%>/qna/qna_list.do">-문의내역</a></li>
				</c:if>
				<c:if test="${sessionScope.member.id=='admin'}">
					<li><a href="<%=cp%>/qna/answer_list.do">-고객문의내역</a></li>
				</c:if>
			</ul>
		</div>
	</section>
</div>
<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>