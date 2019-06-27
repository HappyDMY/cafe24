<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>

<!-- 본문 시작 pdsForm.jsp -->
<p>* Photo Detail *</p>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));	
	dto = dao.read(pdsno);
	if(dto==null){
		out.print("해당글 없음");
	} else {
		//dao.incrementCnt(pdsno);
%>
<table class="table-bordered table-condensed" style="margin: auto; font-size: medium">
	<tr>

		<th style="text-align: center;">제목</th>
		<td colspan=3><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th style="width: 20%; text-align: center;">작성자</th>
		<td style="width: 30%; text-align: center;"><%=dto.getWname()%></td>
		<th style="width: 20%; text-align: center;">등록일</th>
		<td style="width: 30%; text-align: center;"><%=dto.getRegdate()%></td>
	</tr>
	<tr>
		<th style="text-align: center;">조회수</th><td><%=dto.getReadcnt()%></td>
		<th style="text-align: center;">파일크기</th><td><%=dto.getFilesize() %></td>
	</tr>
	<tr>
		<th style="text-align: center;" colspan=4>사진</th>
	</tr>
	<tr>
		<th style="text-align: center;" colspan=4><img src="../upload/<%=dto.getFilename() %>" /></th>
	</tr>
	<tr>
		<th style="text-align: center;" colspan=2>비밀번호</th><td colspan=2><%=dto.getPasswd() %></td>
	</tr>

<%
	}
%>
</table>

<form action="">
	<input type="hidden" name="pdsno" value="<%=pdsno%>"/>
	<input type="button" value="목록" onclick="move(this.form, 'pdsList.jsp')"/>
	<input type="button" value="삭제" onclick="move(this.form, 'pdsDel.jsp')"/>
	<input type="button" value="수정" onclick="move(this.form, 'pdsUpdatePwF.jsp')"/>
</form>
<script>
	function move(f,file) {
		f.action =file;
		f.submit();
	}
</script>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>