<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<!-- 본문 시작 bbs-->
<h3>답변</h3>
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
%>

<form class="form-group" name="bbsfrm" method="post" action="bbsReplyProc.jsp"
	onsubmit="return bbsCheck(this)">
	<input type="hidden" name="bbsno" value="<%=bbsno%>"> 
	<table class="table table-bordered table-condensed"
		style="margin: 0 auto;">
		<tr>
			<th>작성자</th>
			<td><input type="text" class="form-control" name="wname"
				size="10" maxlength="20" required></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" class="form-control" name="subject"
				size="20" maxlength="100" required></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" rows="5" cols="30"
					name="content" required></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" class="form-control" name="passwd"
				size="10" maxlength="15" required></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="답변쓰기">
				<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>





<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>