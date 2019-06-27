<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<!-- 본문 시작 -->

<h3>* 글삭제 *</h3>
<p><a href="bbsList.jsp">[글목록]</a></p>
<form method="post"
      action="bbsDelProc.jsp"
      onsubmit="return pwCheck(this)">
<input type="hidden" name="bbsno"
       value="3">
<table>
<tr>
    <th>비밀번호</th>
    <td><input type="password" name="passwd" size="10" maxlength="10" required></td>
</tr> 
<tr>
    <td colspan="2" align="center">
      <input type="submit" value="확인">
    </td>
</tr> 
</table>
</form>




<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
