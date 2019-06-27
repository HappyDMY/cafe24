<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 -->
* 회/원/가/입 *
<%
	// 1) 입력한 정보를 변수에 담기
	String passwd =request.getParameter("passwd");
	String mname =request.getParameter("mname");
	String tel =request.getParameter("tel");
	String email =request.getParameter("email");
	String zipcode =request.getParameter("zipcode");
	String address1 =request.getParameter("address1");
	String address2 =request.getParameter("address2");
	String job =request.getParameter("job");
	// 2) dto객체에 1)에서 입력한 값 담기
	dto.setId(s_id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	
	
	// 3) BDd의 member 테이블에 에 저장하기
	int res=dao.update(dto);

	// 4) 글쓰기 성고후 목록페이지로 이동하기
	if(res==0){
		out.print("<p>수정 실패</p>");
		out.print("<p><a href='javascript:history.back();''>[다시시도]</a></p>");		
	}else{
		out.print("<script>");
		out.print("alert('수정 되셨습니다..');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");
	}
%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>