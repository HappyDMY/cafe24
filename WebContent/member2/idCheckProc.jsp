<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc</title>
</head>
<body>
	<div style="text-align: center;">
	<h3>중복확인 결과</h3>
	${msg }
	
	<script>
		function apply(id) {
			opener.document.regForm.id.value = id;
			window.close();
		}
	</script>
	<hr />
	<a href="javascript:history.back()">[다시검색]</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
	
	
	</div>
</body>
</html>

