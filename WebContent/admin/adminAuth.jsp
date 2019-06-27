<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.utility.*" %>
<%
	//adminAuth.jsp
	//로그인 상태 확인 페이지
	String s_admin_id = "";
	String s_admin_pw = "";
	String s_admin_mlevel = "";
	
	if(session.getAttribute("s_admin_id")==null||
	session.getAttribute("s_admin_pw")==null||
	session.getAttribute("s_admin_mlevel")==null){
		// 로그인 하지 않은 경우
		s_admin_id = "guest";
		s_admin_pw = "guest";
		s_admin_mlevel = "guest";
		// 로그인안한사람 로그인 페이지로 자동 이동
		String root = Utility.getRoot();//=
%>
	<!doctype html>
	<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<title>Document</title>
	</head>
	<script>
	function jumpTo() {
		alert("로그인페이지로 이동합니다");
		window.top.location.href="<%=root%>/admin/adminLogin.jsp";
		
	}
	</script>
	<body onload="jumpTo()"></body>
	</html>
<%		
	}else{
		//로그인 한 경우
		s_admin_id = (String)session.getAttribute("s_admin_id");
		s_admin_pw = (String)session.getAttribute("s_admin_pw");
		s_admin_mlevel = (String)session.getAttribute("s_admin_mlevel");	
	}

%>
