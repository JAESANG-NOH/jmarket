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
function sendOk(){
	var f=document.qnaForm;
	f.action='<%=cp%>/qna/qna_created_ok.do';
	f.submit();
}

function catechange(){
	var objs=document.getElementById("tbody");

	var s="";
	var n=0;
	<c:forEach var="dto" items="${list}">
		if("${dto.category}"==document.getElementById("category").value&&n<5){  //연관faq문의사항은 5개까지만 표시
			if(n!=0){
				s+="<tr align='center'  height='35' style='border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;'>"
			}
			s+="<td><a href='<%=cp%>/faq/faq_list.do?category="+document.getElementById("category").value+"'>${dto.subject}</a></td>";
			s+="</tr>";
			n++;
		}
	</c:forEach>
	
	s="<tr align='center'  height='35' style='border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;'>"+
	"<th rowspan='"+n+"' bgcolor='#eeeeee' style='color: #787878;' >연관 FAQ</th>"+s
	
	//선택한카테고리에 맞는 질문이 없을시
	if(n==0){
		s="";
	}
	
	objs.innerHTML=s;
	
}

</script>
</head>
<body>
<div id="mainframe">
<jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
	 <section class="container">
		<article>
			<div id = "content" >
			<h2>|&nbsp;&nbsp;문의하기</h2>
				<div class="main" style="width: 700px; margin: 30px auto;">
				<form name="qnaForm" method="post" enctype="multipart/form-data">
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;" >카테고리</th>
					      <td >
					      	<select id="category" name="category" onchange="catechange();">
					      		<option>선택</option>
					      		<option value="goods">상품문의</option>
					      		<option value="delivery">배송문의</option>
					      		<option value="event">이벤트문의</option>
					      	</select>
					      </td>
					  </tr>
					  <tbody id="tbody">
					  </tbody>
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">문의제목</th>
					      <td >
					      	<input type="text" name="subject">
						  </td>
					  </tr>
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">문의내용</th>
					      <td>
					      	<textarea name="content" rows="12" class="boxTA" style="width: 95%;"></textarea>
					      </td>
					  </tr>
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">첨부파일</th>
					      <td>
					      	<input type="file" name="upload">
					      </td>
					  </tr>
					</table>
					<button type="button" onclick="sendOk();">문의하기 등록</button>
					<button type="button" onclick="javascript:location.href='<%=cp%>/qna/qna_list.do';">입력취소</button>
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
				<li><a href="<%=cp%>/qna/qna_created.do">-문의하기</a></li>
				<li><a href="<%=cp%>/qna/qna_list.do">-문의내역</a></li>
			</ul>
		</div>
	</section>
</div>
<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>