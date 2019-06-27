<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="/view/color.jspf" %>

${msg }
<!-- 본문 시작 bbsForm.jsp-->
<strong>수정</strong>

<br><br>
<form method="post" name="writeform" action="./bbsupdateproc.do">
<input type="hidden" name="num"      value="${dto.num }">

<table width="450" border="1" style="margin: auto; color: black;">
<tr>
  <td align="right" colspan=2 bgcolor="${value_c }">
      <a href="/myweb/bbs2/bbslist.do">글목록</a></td>
</tr>
<tr>
  <td bgcolor="${value_c }">이름</td>
  <td><input type="text" name="writer" value="${dto.writer }" ></td>
</tr>
<tr>
  <td bgcolor="${value_c }">제목</td>
  <td><input type="text" name="subject" value="${dto.subject }" ></td>
</tr>
<tr>
  <td bgcolor="${value_c }">이메일</td>
  <td><input type="text" name="email" value="${dto.email }" ></td>
</tr>
<tr>
  <td bgcolor="${value_c }">내용</td>
  <td><textarea name="content" rows="5" cols="40">${dto.content }</textarea></td>
</tr>
<tr>
  <td bgcolor="${value_c }" value="${dto.passwd }" >비밀번호</td>
  <td><input type="password" name="passwd" value="${dto.passwd }" ></td>
</tr>
<tr>
  <td colspan=2 bgcolor="{$value_c }" align="center">
  <input type="submit" value="수정하기">
  <input type="reset"  value="취소">
  <input type="button" value="목록보기" onClick="location.href='./bbslist.do'">
  </td>
</tr>
</table>
</form>

<!-- 본문 끝 -->			
<%@ include file="../footer.jsp" %>