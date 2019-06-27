<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>
</head>
<body>
<div style="text-align: center;">
<h3>* 이메일 중복확인 *</h3>
	<form method="post" action="emailCheckProc.jsp">
      이메일 : 	<!-- <input type="text" name="email" maxlength="50" autofocus> -->
      				<input type="email"  name="email" maxlength="50" autofocus/> 
               		<input type="submit" value="중복확인">
    </form>

</div>


</body>
</html>

