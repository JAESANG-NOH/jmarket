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
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet"><title>Sist</title>
<link rel="stylesheet" href="<%=cp%>/resource/css/home.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sale.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/sidemenu.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript">
<c:if test="${sessionScope.member.id=='admin'}">
function deleteNotice(num) {
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/notice/delete.do?num="+num+"&${query}";
		location.href=url;
	}
}
</c:if>
</script>
</head>
<body>
	<div id="mainframe">
	 <jsp:include page="/WEB-INF/page/layout/header.jsp"></jsp:include>
		<form name="readForm" method="post">	
		<section class="container">
			<article>
				
				<div class="content">
					<div class="all">
						<br><br>
						<div class="name">${dto.subject}</div>
						<div class="nikname">작성자 : ${dto.id} 
							<div>작성일 : ${dto.created}</div>
						</div>
						<div><img class="pimg imgbox1" src="<%=cp%>/photo/buy/${dto.imageName}"></div>
						
					
						<ul class="view">
							<li class="product">[판매완료] ${dto.productName}<li>
							<li class="price">${dto.price} 원<br></li>
							<li class="list"><br>거래방법 : 직접거래 &nbsp;&nbsp; <span class="safe">안전거래 신청</span> </li>
							<li class="list">배송방법 : 판매자와 직접 연락하세요</li>
							<li>&nbsp;</li>
							<li class="send"><span class="jmpay"> &nbsp; &nbsp;Pay</span> 수수료 없이 송금하기</li>
							<li>&nbsp;</li>
							<li class="ju">자몽페이 송금은 에스크로 기능이 제공되지 않으며 판매자에게 결제금액이 바로 전달되는 '직접거래'입니다.</li>
							<li class="warning">자몽마켓에 등록된 판매 물품과 내용을 개별 판매자가 등록한 것으로서, 
								자몽마켓은 등록을 위한 시스템만 제공하며 내용에 대하여 일체의 책임을 지지 않습니다.</li>
						</ul>
						
						<ul class="before">
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;거래전 필독! 주의하세요!</li>
							<li>&nbsp;&nbsp;* 연락처가 없이 외부링크, 카카오톡, 댓글로만 거래할 때</li>
							<li>&nbsp;&nbsp;* 연락처 및 계좌번호를 사이버캅과 더치트로 꼭 조회해보기</li>
							<li>&nbsp;&nbsp;* 업체인 척 위장하여 신분증과 사업자 등록증을 보내는 경우</li>
							<li>&nbsp;&nbsp;* 해외직구로 면세받은 물품을 판매하는 행위는 불법입니다.</li>
						</ul>
						
						<br>
						<br>
					
						<span class="bigimg-box"><img class="big-img imgbox2" src="./images/nb2.jpg"> </span>
						<span class="bigimg-box"><img class="big-img imgbox2" src="./images/nb3.jpg"> </span>
			
						<div class="write">
							<textarea name="content" rows="12"  style="width: 95%; resize: none; border-radius: 4px;" readonly="readonly">${dto.content}</textarea>
						</div>
						
					</div>
				</div>	
				
				<table>
					<tr height="35" style="border-bottom: 1px solid #cccccc;">
					    <td colspan="2" align="left" style="padding-left: 5px;">
					       이전글 :
					         <c:if test="${not empty preReadDto}">
					              <a href="<%=cp%>/sale/read.do?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
					        </c:if>
					    </td>
					</tr>
					
					<tr height="35" style="border-bottom: 1px solid #cccccc;">
					    <td colspan="2" align="left" style="padding-left: 5px;">
					    다음글 :
					         <c:if test="${not empty nextReadDto}">
					              <a href="<%=cp%>/sale/read.do?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
					        </c:if>
					    </td>
					</tr>
					
					<tr height="45">
			 	   <td width="300" align="left">
			       <c:if test="${sessionScope.member.id==dto.id}">				    
			          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/sale/update.do?num=${dto.num}&page=${page}&rows=${rows}';">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.id==dto.id || sessionScope.member.id=='admin'}">				    
			          <button type="button" class="btn" onclick="deleteNotice('${dto.num}');">삭제</button>
			       </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/sale/list.do?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
			</article>
			<jsp:include page="/WEB-INF/page/layout/sidemenu.jsp"></jsp:include>
		</section>
		</form>
	</div>
	<jsp:include page="/WEB-INF/page/layout/footer.jsp"></jsp:include>
</body>
</html>