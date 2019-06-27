<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>

<!-- 본문 시작 -->
<h3>Board</h3>
<table class="table-hover list table-bordered table-condensed"
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
		
		//한페이지 당 출력할 글의 줄 수
		int recordPerPage= 10;
		//검색된 글개수
		int rec = dao.count2(col, word);		

		//글갯수
		int totalRecord = dao.count2();
		//전체 목록
		ArrayList<BbsDTO> list = dao.list2(col, word, nowPage, recordPerPage);//리스트뽑는 함수사용
		if (list == null) {
			out.println("<tr>");
			out.println("<td colspan='7'>글없음</td>");
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
			<!-- 제목  --> 
<%
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
						
				//댓글수 출력 [0]
				if(dto.getComment()>1){
					out.print("["+ (dto.getComment()-1)+"]");
				}
				
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
		String paging= new Paging().paging3(rec, nowPage, recordPerPage, col, word, "bbsList.jsp");
		out.println(paging);				
	%>		
		</td>
	</tr><!-- 페이징 ------------------->
</table>
<table></table>
<a href="bbsListRe.jsp"style="width: auto; margin: auto; font-size: medium;">답변포함목록</a>

<br />
<div class="container">
	<table class="table-condensed" style="width: auto; margin: auto; font-size: medium;">
		<%
			out.println("<tr><td colspan='4'>");
			out.println(" 총 글 갯수 : <strong>");
			out.println(totalRecord);
			out.println("</strong>");
			out.println("</td></tr>");
		%>
		<tr>
			<td colspan="4">검색 결과 갯수 : <%=rec%></td>
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
					</select> <input type="text" name="word" /> <input type="submit" value="검색" />
				</form>
			</td>
		</tr>
		<!-- 검색 끝 ----------------------------->
	</table>
</div>

<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
</p>

<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
