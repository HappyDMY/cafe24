<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<!-- 비밀번호 찾기 폼 -->
<div id="right-box">
<h3>비번 찾기</h3>
<form style="text-align: center; margin: auto; color: black" name="findpwForm" method="post" action="forgotProc.jsp" onsubmit="return memberCheck(this)">
	<table border="1" class="table-hover list table-bordered table-condensed" style="margin: auto;">
		<tr>
			<td colspan="3">이메일로 임시 비밀번호가 전송됩니다.</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td colspan="2"><input type="text" name="id" id="id" size="10" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="2"><input type="text" name="mname" id="mname" size="10" required></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="2"><input type="text" name="email" id="email" size="30" required>
			</td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="비밀번호 찾기"></td>
		</tr>
	</table>
	<br />
</form>
<input type="button" value="취소" onclick="history.back()">
</div>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>