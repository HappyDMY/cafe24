<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<!-- 본문 시작 -->
<%
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
%>
<h3>* 사진삭제 *</h3>
<p><a href="pdsList.jsp">[사진목록]</a></p>
<form method="post"
      action="pdsDelProc.jsp"
      onsubmit="return pwCheck(this)">
<input type="hidden" name="pdsno" value="<%=pdsno%>">
<table class="table-bordered table-condensed" style="margin: auto; font-size: medium">
<tr>
    <th>비밀번호</th>
    <td><input style="color: black;" type="password" name="passwd" size="10" maxlength="10" required></td>
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
