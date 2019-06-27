<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<!-- 본문 시작 -->
<h3>사진삭제결과</h3>

<%

	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	String passwd =request.getParameter("passwd").trim();
	String saveDir = application.getRealPath("/upload");
	
	dto.setPasswd(passwd);
	dto.setPdsno(pdsno);
	
	int res=dao.delete(dto, saveDir);
	if (res==0) {//0이면 제거실패
		
		out.println("<p>삭제 실패</p>");
		out.println("<p>올바른 비밀번호를 입력해주세요</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
	
		out.println("<script>");			
		out.println("	alert('삭제 완료');");		
		out.println("	location.href='pdsList.jsp';");		
		out.println("</script>");			
	}

	
%>



<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
