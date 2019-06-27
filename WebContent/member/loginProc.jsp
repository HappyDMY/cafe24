<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>

<%@ include file="../header.jsp"%>
<!-- 본문시작 loginProc.jsp -->
	<h3>로그인 결과</h3>
<%
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	
	String mlevel=dao.login(id, passwd);
	if(mlevel==null){
		out.print("<p>아이디와 비밀번호를 확인해주세요</p>");		
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");		
	}else{
		//out.print("<p>로그인 성공</p>");	
		//out.print(mlevel);	
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
	
		//쿠키 아이디 저장----------------------
		String c_id=Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie= null;
		
		if(c_id.equals("SAVE")){
			//new Cokie("c_id", c_id);
			cookie=new Cookie("c_id", id);
			cookie.setMaxAge(60*60*24*30);
			
		}else{
			//new Cokie("c_id", "");
			cookie=new Cookie("c_id", "");
			cookie.setMaxAge(0);
			
		}//if end
		//요청한 사용자 PC에 쿠키값을 저장
		response.addCookie(cookie);
		
		//쿠키저장 끝--------------------------
		
		//첫 페이지로 이동
		String root = request.getContextPath();//작업중인 도메인 루트값
		//=Utility.getRoot();
		
		response.sendRedirect(root + "/index.jsp");		
	}
	

%>
	

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>