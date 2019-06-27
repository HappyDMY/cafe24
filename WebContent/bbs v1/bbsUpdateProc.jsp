<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>

<!-- 본문 시작 bbs-->

<%

int bbsno =Integer.parseInt(request.getParameter("bbsno"));
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



// 3) tb_bbs 업데이트하기
int res=dao.update(dto);
if(res==0){
	out.print("<p>수정 실패 !!!!!!!!! 아오</p>");
	out.print("<p><a href='javascript:history.back();''></a></p>");		
}else{
	out.print("<script>");
	out.print("alert('수정되었습니다.');");
	out.print("location.href='bbsList.jsp';");
	out.print("</script>");
}
	
		
%>


<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
