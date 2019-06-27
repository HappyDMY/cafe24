<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>

<!-- 본문 시작 -->
<h3>Board</h3>
<table class="table table-hover list"
	style="margin: auto; text-align: justify-content; font-size: medium;">
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
		/* 이부분 ssi로 옮김
			//검색 목록 페이지
			String col = request.getParameter("col");
			String word = request.getParameter("word");
		
			if (col == null) {
				col = "";
			}
			if (word == null) {
				word = "";
			}
		*/

		int rec = dao.count(col, word);
		
		//한페이지 당 출력할 글의 줄 수
		int recordPerPage= 10;
		

		//글갯수
		int totalRecord = dao.count();
		//전체 목록
		ArrayList<BbsDTO> list = dao.list(col, word, nowPage, recordPerPage);//리스트뽑는 함수사용
		if (list == null) {
			out.println("<tr>");
			out.println("<td colspan='5'>글없음</td>");
			out.println("</tr>");
		} else { //오늘 날짜를  yyyy-mm-dd 형식으로 작성
			String today = Utility.getDate();
			for (int i = 0; i < list.size(); i++) {
				dto = list.get(i);
	%>
	<!-- 링크열 시작---------------------- -->
	<tr  onclick="window.location='bbsRead.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'">
		<td><%=dto.getBbsno()%></td>
		<!-- 번호 -->

		<td colspan="3">
			<!-- 제목  --> <%
 	//제목앞에 리플이미지
 			int reply = dto.getIndent();
 			for (int a = 0; a < reply; a++) {
 				out.print("Re : ");
 			}
 %> 	<a
			href="bbsRead.jsp?	bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%>
		</a>

			<%
				//오늘 작성항 글제목 뒤에 new 이미지 붙이기	
						//yyyy-mm-dd
						String regdt = dto.getRegdt().substring(0, 10);

						if (regdt.equals(today)) {
							out.print("<img src='../images/New.gif'> ");
						}
						if (dto.getReadcnt() >= 10) {
							out.print("<img src='../images/hot.gif'>");
						} //제목 끝
			%>
		</td>
		<td><%=dto.getWname()%></td>
		<!-- 작성자  -->
		<td><%=dto.getRegdt()%></td>
		<!-- 등록일 -->
		<td><%=dto.getReadcnt()%></td>
		<!-- 조회수 -->
		<%-- 
			<td><%=dto.getContent()%></td>
			<td><%=dto.getPasswd()%></td>
			 --%>
	</tr>
	<!-- 링크열 끝---------------------- -->
	<%
		} //for end
		} //if end-------------------------------------------------------
	%>	
	<tr><!-- 페이징---------------- -->
		<td colspan="7">
	<%
		String paging= new Paging().paging(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
				out.println(paging);
				
	%>		
		</td>
	</tr><!-- 페이징 ------------------->
</table>

<div class="container">
	<table class="table table-bordered" style="width: auto; margin: auto">
		<%
			out.println("<tr><td colspan='4'>");
			out.println("전체 글 갯수 : <strong>");
			out.println(totalRecord);
			out.println("</strong>");
			out.println("</td></tr>");
		%>
		<tr>
			<td colspan="4">검색한 결과 갯수 : <%=rec%></td>
		</tr>
		<!-- 검색 시작  --------------------------->
		<tr>
			<td colspan="4"
				style="text-align: center; height: 50px; color: black">
				<form action="" method="get" onsubmit="return searchCheck(this)">
					<select name="col" id="">
						<option value="wname">작성자
						<option value="subject">제목
						<option value="content">내용
						<option value="subject_content">제목+내용
					</select> 
					<input type="text" name="word" />
					 <input type="submit" value="검색" />
				</form>
			</td>
		</tr>
		<!-- 검색 끝 ----------------------------->
	</table>
</div>






<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	<a href="bbsComment.jsp">[댓글 목록]</a>
</p>

<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
