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
					<form name="boardForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
			      <td style="padding-left:10px;"> 
			      	<select name="category">
			      		<option value="event">이벤트문의</option>
			      		<option value="goods">상품문의</option>
			      		<option value="delivery">배송문의</option>
			      	</select>
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">질&nbsp;&nbsp;&nbsp;&nbsp;문</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="">
			      </td>
			  </tr>
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">답&nbsp;&nbsp;&nbsp;&nbsp;변</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" class="boxTA" style="width: 95%;"></textarea>
			      </td>
			  </tr>
			  </table>
			
			  <table style="width: 100%; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/question/faq_created_ok.do';">등록하기</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/question/faq_list.do';">등록취소</button>
			      </td>
			    </tr>
			  </table>
			</form>
				</div>
			</div>
		</article>
	</section>
	</div>
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>