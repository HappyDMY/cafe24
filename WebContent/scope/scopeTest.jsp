<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>scopeTest.jsp</title>
</head>
<body>
  <h3>웹 페이지의 scope(유효범위)</h3>
<%
/*
	- SCOPE 의 종류 
	1) page : 현재페이지에서만 유효
	2) request : 서로 연결되어있는 페이지 에서만 유효
	3) session : 모든페이지에서 유효 (사용자 개별 접근, 시간)
	4) application : 모든페이지에서 유효 (모든 사용자 접근) 
	
	-각 SCOPE의 변수선언 형식
	1) pageContext.setAttribute("변수명", 값)
	2) request.setAttribute("변수명", 값)
	3) session.setAttribute("변수명", 값)
	4) application.setAttribute("변수명", 값)
	
	-각 SCOPE의 변수선언 형식
	1) pageContext.getAttribute("변수명")
	2) request.getAttribute("변수명")
	3) session.getAttribute("변수명")
	4) application.getAttribute("변수명")

	
	-각 SCOPE의 변수 삭제
	1) pageContext.removeAttribute("변수명")
	2) request.removeAttribute("변수명")
	3) session.removeAttribute("변수명")
	4) application.removeAttribute("변수명")
*/
//--------------------------------------
	//각 SCOPE에 값 올리기
	pageContext.setAttribute("kor", 100);
	request.setAttribute("eng", 200);
	session.setAttribute("mat", 300);
	application.setAttribute("uname", "soldesk");
	
	//SCOPE 영역의 값 얻어오기
	Object obj = pageContext.getAttribute("kor");
	int kor = (int)obj;
	int eng = (int)request.getAttribute("eng");
	int mat = (int)session.getAttribute("mat");
	String uname = (String)application.getAttribute("uname");

	//출력 
	out.println("1) pageContext 영역 	:"+kor+"<br />");
	out.println("2) request 영역 			: "+eng+"<br />");
	out.println("3) session 영역 			: "+mat+"<br />");
	out.println("4) application 영역 		: "+uname+"<br />");
	out.println("<hr />");
	/*
	//각 SCOPE의 변수 삭제
	pageContext.removeAttribute("kor");
	request.removeAttribute("eng");
	session.removeAttribute("mat");
	application.removeAttribute("uname");
	out.println("<p>SCOPE 변수 삭제 후 </p>");
	*/
	//출력 
	out.println("1) pageContext 영역 	:"+pageContext.getAttribute("kor")+"<br />");
	out.println("2) request 영역 			: "+request.getAttribute("eng")+"<br />");
	out.println("3) session 영역 			: "+session.getAttribute("mat")+"<br />");
	out.println("4) application 영역 		: "+application.getAttribute("uname")+"<br />");

	//----------------------------------------------
	/*
	//request.getAttribute(""); 와 request.getParameter("");
	request.setAttribute("aver", 85);
	int aver = (int)request.getAttribute("aver");	
	
	//http://172.16.10.16:9090/myweb/test.jsp?aver=70	
	int aver1 = (int)request.getParameter("web sever(tomcat)");	
	*/
	//------------------------------------------
	
	/*
		-페이지 이동
		1) <a href=""></a>
		2) <form action=""></form>
		3) location.href=""
		4) <jsp:forward page=""></jsp:forward>
		5) response.sendRedirect("")
		6)String view = "scopeResult.jsp";
			
	*/
	out.println("<hr />");
%>  
	<!--1) pageContext / request  애서는 null 값 나옴
	링크로  <a href="scopeResurt.jsp">[SCOPE 결과 페이지 이동]</a>
	-->
	
	<!--2) pageContext / request  애서는 null 값 나옴
	폼으로  <form action="scopeResurt.jsp"><button>[SCOPE 결과 페이지 이동]</button></form>
	-->

	<!--3)  pageContext / request  애서는 null 값 나옴
	<script>
	alert("scope결과페이지로 이동합니다.");
	location.href="scopeResurt.jsp"
	</script>
	-->
	
	<%--4) request.getAttribute("eng")는200 
	 //response.sendRedirect(""); 사용하는데 제약있음
	<jsp:forward page="scopeResurt.jsp"></jsp:forward>
	--%>
	
<% 
	//5)
	//request.getAttribute("eng") 는 null
	response.sendRedirect("scopeResurt.jsp");
/* 	
 	//6)
	String view = "scopeResult.jsp";
	RequestDispatcher rd= request.getRequestDispatcher(view);
	rd.forward(request, response);
  */
 
 
 /* scopeResult.jsp 	|그밖의 JSP페이지
 -----------------------
 page 			x 			|				x
 request 		o 			|				x
 session 		o 			|				o
 application 	o 			|				o 
 
 -----------------------
 */
 
 
 
 %>
</body>
</html>