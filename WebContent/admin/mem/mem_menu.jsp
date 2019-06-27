<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../adminAuth.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mem_menu.jsp</title>
<base target="down">
</head>
<body>
<form name="memfrm" method="post">
<table>
<tr>
  <td><strong>회/원/관/리</strong></td>
  <td>
    <input type="button" value="회원목록(수정가능)" onclick="move('memList.jsp')">
  </td>
  <td>
    <input type="button" value="회원등급조정" onclick="move('memLevel.jsp')">
  </td>
  <td>    
     <input type="button" value="회원삭제" onclick="move('memDel.jsp')">
  </td>
</tr>
</table>
</form>

<script>
function move(file){
	document.memfrm.action=file;
	document.memfrm.submit();
}
</script>
</body>
</html>
