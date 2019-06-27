<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>

<!-- 본문시작 -->
탈퇴를 해봅시다(사실강등)
<%
	String id= s_id;
	
	int res = dao.updateLikeDel(id);
		
	out.print("res = "+ res);
%>



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>