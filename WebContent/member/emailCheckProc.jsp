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
	<%
		String email = request.getParameter("email").trim();
	out.print(email+" 는");
	int cnt = dao.duplecatedEmail(email);
	if(cnt==0){
	out.println("<p> 중복되지 않은 아이디 입니다.</p>");	
	out.println("<a href='javascript:apply(\""+email+"\")'>[적용]</a>");
	%>
	<script>
		function apply(email) {
			opener.document.regForm.email.value = email;
			window.close();
		}
	</script>
	
	
	
	<%
	}else{
		out.println("<p style='color:red;'>해당 이메일은 사용 할 수 없습니다</p>");
	}
	%>
	
	
	<hr />
	<a href="javascript:history.back()">[다시검색]</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
	
	
	</div>
</body>
</html>

