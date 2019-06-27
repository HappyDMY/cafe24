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
		String id = request.getParameter("id").trim();
	out.print(id+" 는");
	int cnt = dao.duplecatedID(id);
	if(cnt==0){
	out.println("<p> 중복되지 않은 아이디 입니다.</p>");	
	out.println("<a href='javascript:apply(\""+id+"\")'>[적용]</a>");
	%>
	<script>
		function apply(id) {
			opener.document.regForm.id.value = id;
			window.close();
		}
	</script>
	
	
	
	<%
	}else{
		out.println("<p style='color:red;'>해당아이디는 사용 할 수 없습니다</p>");
	}
	%>
	
	
	<hr />
	<a href="javascript:history.back()">[다시검색]</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
	
	
	</div>
</body>
</html>

