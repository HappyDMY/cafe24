<%@page import="net.pds.PdsDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<!-- 본문 시작 -->
<h3>사진수정폼</h3>

<%

	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	String passwd =request.getParameter("passwd").trim();
	String saveDir = application.getRealPath("/upload");
	
	dto.setPasswd(passwd);
	dto.setPdsno(pdsno);
	
	int res=dao.pwCheck(dto, saveDir);
	if (res==0) {//0이면 비밀번호 다름
		out.println("<script>");			
		out.println("	alert('수정 실패 올바른 비밀번호를 입력해주세요');");		
		out.println("	location.href='pdsRead.jsp?pdsno="+pdsno+"';");		
		out.println("</script>");			
	} else {	
		
		PdsDTO dtor = dao.read(pdsno);
%>		
	<form name="frmData" 
      method="post"
      enctype="multipart/form-data" 
      action="pdsUpdateProc.jsp" 
      onsubmit="return pdsCheck(this)" 
	  >
	  <input type="hidden" name="pdsno" value="<%=dtor.getPdsno()%>"/>

  <table border="1" style="margin: auto;">
  <tr> 
    <th colspan="2">파일 등록 (* 필수 입력사항)</th>
  </tr>
  <tr> 
    <td colspan="2" height="30"> </td>
  </tr>
  <tr> 
    <th width="97">성명*</th>
    <td width="5" ><input  style="color: black;" type="text" name="wname" value="<%=dtor.getWname()%>"> </td>
  </tr>
  <tr> 
    <th>제목*</th>
    <td><textarea style="color: black;" name="subject" rows='5' cols='30' ><%=dtor.getSubject()%></textarea></td>
  </tr>
  <tr> 
    <th>비밀번호*</th>
    <td><input  style="color: black;" type="password" name="passwd"  required="required"></td>
  </tr>
  <tr> 
    <th>파일명*</th>
    <td><input  style="color: black;" type="file" name="filename" ></td>
  </tr>
  <tr> 
     <td colspan="2" align="center">
        <input type="submit" value="전송">               
        <input type="reset"  value="취소">               
        <input type="button" value="목록"
               onclick="javascript:location.href='./pdsList.jsp'">
     </td>
  </tr>
  </table>
</form>
<%			
	}	
%>



<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
