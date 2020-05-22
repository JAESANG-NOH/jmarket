<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
textarea :focus, input:focus {
	outline: none;
}

</style>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(function() {
	$("form input + span").hide();
	$("form input[type=text]").css("border","1px solid green");
	
	$("form input").not($(":button")).not($(":reset")).focus(function(){
	$(this).css("border","1px solid #f28011");
	$(this).next("span").show();
	});
	
	$("form input").not($(":button")).not($(":reset")).blur(function(){
		$(this).css("border","1px solid #aaa");
		$(this).next("span").hide();
		});
});
</script>

</head>
<body>

<h3>jQuery 셀렉터</h3>

<form>
	<p>
	<input type="text" name="id">
	<span>아이디</span>
	<span>5자이상</span>
	</p>
	<p>
	<input type="text" name="name">
	<span>이름...</span>
	</p>

	<p>
	<input type="text" name="age">
	<span>나이...</span>
	</p>
	
	<p>
	<input type="text" name="birth">
	<span>생년월일...</span>
	</p>
	
	<p>
	 <input type="button" value="등록">
	  <input type="reset" value="취소">
	</p>
</form>





</body>
</html>