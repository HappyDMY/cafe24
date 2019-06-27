<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<h3> 회원정보를 수정하려면 비밀번호를 입력 해 주세요 </h3>
<form action="memberUpdatePwCheck.jsp" class="btn" method="post">
<input type="password" name="passwd"  id="passwd"/>
<input type="submit" value="수정" />
</form>



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>