<%@page import="net.pds.PdsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>

<!-- 본문 시작 pdsForm.jsp -->
<p>* Photo List *</p>

<p><a href="pdsForm.jsp">[사진올리기]</a></p>
<%
	ArrayList<PdsDTO> list = dao.list();
	if(list==null){
		out.println("<tr>");
		out.println("<td colspan='5'>사진없음</td>");
		out.println("</tr>");
	}else{
%>
	<table class="table-hover list table-bordered table-condensed" style="font-size: medium; margin: auto;">
		<tr>
			<th style="text-align: center;">제목</th>
			<th style="text-align: center;">사진</th>
			<th style="text-align: center;">작성자</th>
			<th style="text-align: center;">조회수</th>
			<th style="text-align: center;">작성일</th>
		</tr>
<%
		for(int i=0; i<list.size();i++){
			dto = list.get(i);
%>
		<tr>
			<td><a href="pdsRead.jsp?pdsno=<%=dto.getPdsno()%>"><%=dto.getSubject() %></a></td>
			<td><img src="../upload/<%=dto.getFilename() %>"  width="50"/></td>
			<td><%=dto.getWname() %></td>
			<td><%=dto.getReadcnt() %></td>
			<td><%=dto.getRegdate().substring(0, 10) %></td>
		</tr>						
<%
		}//for end
	}//if end
%>
	</table>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>