<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.utility.*"%>
<%@ page import="net.bbs.*"%>

<jsp:useBean id="dao" class="net.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.bbs.BbsDTO"></jsp:useBean>

<%
	//ssi.jsp
	//공통으로 사용할 코드 작성	
	request.setCharacterEncoding("utf-8");
%>

<%
	//검색 목록 페이지------------------------
	String col = request.getParameter("col");//검색 칼럼
	String word = request.getParameter("word");//검색어

	col 	=	Utility.checkNull(col);
	word =	Utility.checkNull(word);
	//검색끝-------------------------------
%>


