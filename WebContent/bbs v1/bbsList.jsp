<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문 시작 -->
<h3>게시판 목록</h3>
<table class="table-hover list"
	style="margin: 0 auto; text-align: justify-content; font-size: medium;">
	<thead>
		<tr>
			<th style="text-align: center;">번호</th>
			<th colspan="3" style="text-align: center; width: 50%;"><span>제목</span></th>
			<th style="text-align: center;">작성자</th>
			<th style="text-align: center;">등록일</th>
			<th style="text-align: center;">조회수</th>
			<!-- 
				<td>내용</td>
				<td>비밀번호</td>
				 -->
		</tr>
		<tr></tr>
	</thead>
	<%
		//전체 목록
		ArrayList<BbsDTO> list = dao.list();
		if (list == null) {
			out.println("<tr>");
			out.println("<td colspan='5'>글없음</td>");
			out.println("</tr>");
		} else {
			//오늘 날짜를  yyyy-mm-dd 형식으로 작성
			String today = Utility.getDate();
			for (int i = 0; i < list.size(); i++) {
				dto = list.get(i);
	%>
	<!-- 테이블 열시작  -->
	<tr onclick="window.location='bbsRead.jsp?bbsno=<%=dto.getBbsno()%>'">
		<td><%=dto.getBbsno()%></td>

		<td colspan="3">
					<!-- 제목  --> 
<%
 	//제목앞에 리플이미지
 			int reply = dto.getIndent();
 			for (int a = 0; a < reply; a++) {
 				out.print("Re : ");
 			}
 %> 
		<%=dto.getSubject()%> <%
 	//오늘 작성항 글 뒤에 new 이미지 붙이기	
 			//yyyy-mm-dd
 			String regdt = dto.getRegdt().substring(0, 10);

 			if (regdt.equals(today)) {
 				out.print("<img src='../images/New.gif'> ");
 			}
 			if (dto.getReadcnt() >= 10) {
 				out.print("<img src='../images/hot.gif'>");
 			}
 %></td>
		<td><%=dto.getWname()%></td>
		<td><%=dto.getRegdt()%></td>
		<td><%=dto.getReadcnt()%> <%
 	
 %></td>
	</tr>
	<!-- 테이블 열 끝 -->
	<%
		} //for end
		} //if end
	%>

	<tr></tr>


</table>


<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
</p>

<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
