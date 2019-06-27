<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="/view/color.jspf" %>
<!-- 본문 시작 bbsForm.jsp-->
<c:if test="${update==true}">
	<script>
	alert('수정 폼 진행하면 된다.');
	location.href='bbslist.do';
	</script>		
</c:if>
<c:if test="${update==false }">
	<p>비밀번호가 일치하지 않습니다.</p><br />
	<script>
	alert('수정 실패 (비밀번호가 일치하지 않습니다.)');
	location.href='javascript:history.back()';
	</script>		
</c:if>
<!-- 본문 끝 -->			
<%@ include file="../footer.jsp" %>