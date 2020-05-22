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
function sendOk(num){
	var answer=document.getElementById("answer"+num);
	if(answer.style.visibility=="collapse"){
		answer.style.visibility="visible";
	}else{
		answer.style.visibility="collapse";
	}
}

function monthch(){
	var y=document.getElementById("year").value;
	var m=document.getElementById("month").value;
	var minmonth=${minmonth}<10?"0"+${minmonth}:${minmonth};
	var maxmonth=${maxmonth}<10?"0"+${maxmonth}:${maxmonth};
	if(m<10){ m="0"+m;}
	var selectday=""+y+m;
	var minday=""+${minyear}+${minmonth};
	var maxday=""+${maxyear}+maxmonth;
	
	if(selectday<minday){
		alert("문의내역조회는 6개월전까지만 가능합니다.");
	}else if(selectday>maxday){
		alert("시작날짜를 다시 설정해 주세요");
	}
}

function daych(){
	//선택한달이 현재달과 같을시->현재날짜 이후 불가능
	//선택한달이 최소달과 같을시->최소날짜이전 불가능
	var y=document.getElementById("year").value;
	var m=document.getElementById("month").value;
	var d=document.getElementById("day").value;
	if(m==${maxmonth}){
		if(d>${calday}){
			alert("시작날짜를 다시 설정해주세요");
		}
	}else if(m==${minmonth}){
		if(d<${minday}){
			alert("문의내역조회는 6개월전까지만 가능합니다.");
		}
	}
	document.getElementById("year2").value=y;
	document.getElementById("month2").value=m;
	document.getElementById("day2").value=d;
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
					      	<select id="year" >
					      		<c:forEach var="n" begin="${minyear}" end="${maxyear}">
					      			<option value="${n}">${n}</option>
					      		</c:forEach>
					      	</select>
					      	년
					      	<select id="month" onchange="monthch();" >
					      		<c:forEach var="n" begin="1" end="12">
					      			<option value="${n}">${n}</option>
					      		</c:forEach>
					      	</select>
					      	월
					      	<select id="day" onchange="daych();">
					      		<c:forEach var="n" begin="1" end="31">
					      			<option value="${n}">${n}</option>
					      		</c:forEach>
					      	</select>
					      	일~
					      	<select id="year2" onchange="yearch2();">
					      		<c:forEach var="n" begin="${minyear}" end="${maxyear}">
					      			<option value="${n}">${n}</option>
					      		</c:forEach>
					      	</select>
					      	년
					      	<select id="month2" onchange="monthch2();">
					      		<c:forEach var="n" begin="1" end="12">
					      			<option value="${n}">${n}</option>
					      		</c:forEach>
					      	</select>
					      	월
					      	<select id="day2" onchange="daych2();">
					      		<c:forEach var="n" begin="1" end="31">
					      			<option value="${n}">${n}</option>
					      		</c:forEach>
					      	</select>
					      	일
					      </td>
					      <td width="150">
					      	<button>1개월</button>
					      	<button>전체</button>
					      	<button style="background: silver;">조회</button>
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
					  <c:forEach var="dto" items="${list}">
						  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
						      <td>${dto.num}</td>
						      <td>이벤트문의</td>
						      <td align="left" style="padding-left: 10px;" class="subject" onclick="sendOk(${dto.num});">${dto.subject}</td>
						      <td>${dto.created}</td>
						      <td>${dto.an_created}</td>
						      <td>${dto.status==0?"접수완료":"답변완료"}</td>
						  </tr>
						  <tr id="answer${dto.num}" height="35" style="visibility:collapse; border-bottom: 1px solid #cccccc;" >
							  <td colspan="6" style="background: #EAEAEA;">
								<p ><b style="color: gray;">Q.</b><b>${dto.subject}</b>&nbsp;${dto.created}	</p>
								<p>${dto.content}</p>	
								<hr style="border: 1px dashed gray;" >
								<p ><b style="color: blue;">A.</b><b>[자몽마켓]고객님 문의에 답변드립니다.</b>&nbsp;2020-05-21	</p>
								<p>답변내용입니다.</p>
							  </td>
						  </tr>
					  </c:forEach>
					</table>
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