<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@include file="../header.jsp"%>
<!-- 본문 시작 bbs-->

<%
	// 1) 입력한 정보를 변수에 담기
	String wname =request.getParameter("wname");
	String subject =request.getParameter("subject");
	String content =request.getParameter("content");
	String passwd =request.getParameter("passwd");
	String ip =request.getRemoteAddr();
	// 2) dto객체에 1)에서 입력한 값 담기
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setPasswd(passwd);
	dto.setContent(content);
	dto.setIp(ip);
	
	
	
	// 3) tb_bbs에 저장하기
	int res=dao.insert(dto);
	if(res==0){
		out.print("<p>글추가 실패</p>");
		out.print("<p><a href='javascript:history.back();''></a></p>");		
	}else{
		out.print("<script>");
		out.print("alert('게시글이 추가되었습니다.');");
		out.print("location.href='bbsList.jsp';");
		out.print("</script>");
	}
	

	// 4) 글쓰기 성고후 목록페이지로 이동하기



%>


<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
