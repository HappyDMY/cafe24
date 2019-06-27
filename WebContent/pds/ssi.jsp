<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>
<%@ page import="net.bbs.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

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
	
	
	//페이징------------------------------
	
	
	//현재페이지
	int nowPage=1;
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>

<jsp:useBean id="dao" class="net.pds.PdsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.pds.PdsDTO"></jsp:useBean>

  