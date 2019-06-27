<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>sessionTest.jsp</title>
</head>
<body>
  <h3>세션 session</h3>
<%
  /* session 내부객체
     - HttpSession session
     - 요청한 사용자에게 개별적으로 접근
     - 선언된 세션변수는 전역적 성격으로 유지된다
     - 일정 시간동안 이벤트가 발생되지 않으면 자동 삭제
  */
  out.println("현재 세션 유지 시간 : ");
  out.println(session.getMaxInactiveInterval());
  out.println("초(30분)");
  out.println("<hr>");
  
  //세션 유지 시간 변경
  //1)
  session.setMaxInactiveInterval(60*10);
  out.println("변경된 세션 유지 시간 : ");
  out.println(session.getMaxInactiveInterval());
  out.println("초(10분)");
  out.println("<hr>");

  //2) /WEB-INF/web.xml 배치관리자
  /*   세션시간설정, 환경설정등 지정
       web.xml이 수정이 되면 반드시 서버를 재시작 할것!!

       <!-- 세션 유지 시간 설정 -->
       <session-config>
     	  <session-timeout>600</session-timeout>
       </session-config>  
  */
  
  //세션변수 -> myweb프로젝트의 모든 페이지에서 공유
  //         -> 별도의 자료형이 없다
  
  //세션변수 선언
  //session.setAttribute("변수명", 값)
  session.setAttribute("s_id", "soldesk");
  session.setAttribute("s_pw", "12341234");
  
  //세션변수값 가져오기
  Object obj = session.getAttribute("s_id");
  String s_id = (String)obj;
  String s_pw = (String)session.getAttribute("s_pw");
  
  out.println("세션변수 s_id : " + s_id + "<br>");
  out.println("세션변수 s_pw : " + s_pw + "<br>");
  
  //세션변수 강제 삭제(로그아웃)
  session.removeAttribute("s_id");
  session.removeAttribute("s_pw");
  
  out.println("세션변수 삭제후 <br>");
  out.println("세션변수 s_id = "+session.getAttribute("s_id"));
  out.println("<br>");
  out.println("세션변수 s_pw = "+session.getAttribute("s_pw"));
  out.print("<hr />");
  
  //세션에있는 데이터 전부 삭제하는 명력어  invalidate();
  //session.invalidate();
  
  //세션 객체에서 발급해주는 ID
  out.println("세션 임시 아이디 : ");
  out.println(session.getId());
  out.println("<hr />");
  //-----------------------------------
  
  /*
  	application 내부객체
  	- ServletContext application
  	- 사용자 모두가 공유하는 전역적 성격의 객체
  */
  
  // /member 폴더의 실제 물리적인 경로 파악
  // 실제경로 - D:\Java1113\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\myweb\member
  // 웹경로   - http://172.16.10.16:9090/myweb/member
  out.println(application.getRealPath("/member")); // 강추
  out.println("<hr />");
  
  out.println(request.getRealPath("/member"));
  out.println("<hr />");
  
  //application변수
  application.setAttribute("uname", "손흥민");
  out.println(application.getAttribute("uname"));

  //response 내부객체
  // -요청한 사용자에게 응답할때
  // -페이지 이동
  // response.sendRedirect("파일명");
  // - 요청한 사용자에게 응답할 메세지 전송
  // PrintWriter prn = response.getWriter();
  
  
%>  
</body>
</html>