<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCHeckForm.jsp</title>
</head>
<body>
<div style="text-align: center;">
<h3>* 아이디 중복확인 *</h3>
	<form method="post" action="idCheckProc.jsp"onsubmit="return blankCheck(this)">
      아이디 : 	<input type="text" name="id" maxlength="10" autofocus>
               		<input type="submit" value="중복확인">
    </form>

</div>
<script>
function blankCheck(f) {
	var id =f.value;
	id= id.trim();
	if (id.length<5) {
		alert("아이디는 5글자 이상이어야 합니다.");
		f.id.focus();
		return false;
	}
	return true;
}//blankCheck end

</script>


</body>
</html>

