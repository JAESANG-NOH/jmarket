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
	f.action='<%=cp%>/question/qna_created_ok.do';
	f.submit();
}

function catechange(){
	var objs=document.getElementById("tr");
	//objs.innerHTML="<th bgcolor='#eeeeee' style='color: #787878;' >연관 FAQ</th>";
	console.log(aa);
	
	for(i=1; i<document.getElementById("listsize"); i++){
		//objs.innerText=document.getElementById("cate"+i);
		console.log(i);
		//list의 카테고리와 select의 카테고리가 같을시
		
		if(document.getElementById("cate"+i)==document.getElementById("category")){
			objs.innerText="<td>"+document.getElementById("sub"+i)+"</td>";
			
		}
	}
	
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
				<form name="qnaForm" method="post">
					
					<input type="hidden" id="listsize" value="${listsize}">
					<c:forEach var="dto" items="${list}">
						<input type="hidden" id="cate${dto.num}" value="${dto.category}">
						<input type="hidden" id="sub${dto.num}" value="${dto.subject}">
					</c:forEach>
					
					<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;" >카테고리</th>
					      <td>
					      	<select id="category" name="category" onchange="catechange();">
					      		<option value="goods">상품문의</option>
					      		<option value="delivery">배송문의</option>
					      		<option value="event">이벤트문의</option>
					      	</select>
					      </td>
					  </tr>
					  	  
							  <tr id="tr" align="center"  height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
							  	

							  </tr>
						  
						
					  <tr align="center" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th bgcolor="#eeeeee" style="color: #787878;">문의제목</th>
					      <td>
					      	<input type="text">
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
					      	<input type="text" readonly="readonly">
					      	
					      	<button>업로드</button>
					      </td>
					  </tr>
					</table>
					<button type="button" onclick="sendOk();">문의하기 등록</button>
					<button type="button" onclick="javascript:location.href='<%=cp%>/question/qna_list.do';">입력취소</button>
				</form>
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