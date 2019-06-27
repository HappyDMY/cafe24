<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>
<%@ page import="net.bbs.*" %>

<%
	//ssi.jsp
	//공통으로 사용할 코드 작성	
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="net.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.bbs.BbsDTO"></jsp:useBean>

  