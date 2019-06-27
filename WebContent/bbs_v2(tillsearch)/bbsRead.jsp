<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>

<!-- 본문 시작 -->
<h3>글내용</h3>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dto = dao.read(bbsno);
%>

<table class="table table-bordered table-condensed"
	style="margin: 0 auto;">
	<%
		if (dto == null) {
			out.print("해당글 없음");
		} else {
			dao.incrementCnt(bbsno);
	%>
	<tr>
		<th style="text-align: center;">제목</th>
		<td colspan=3><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th style="width: 20%; text-align: center;">작성자</th>
		<td style="width: 30%; text-align: center;"><%=dto.getWname()%></td>
		<th style="width: 20%; text-align: center;">등록일</th>
		<td style="width: 30%; text-align: center;"><%=dto.getRegdt()%></td>
	</tr>
	<tr>
		<th style="text-align: center;">조회수</th>
		<td><%=dto.getReadcnt()%></td>
		<th style="text-align: center;">답글수</th>
		<td>0</td>
	</tr>
	<tr>
		<th style="text-align: center;" colspan=4>내용</th>
	</tr>
	<tr>
		<td colspan=4 height="250px"><textarea class="form-control"
				rows="15" cols="30" name="content" readonly="readonly"><%=dto.getContent()%></textarea>

		</td>
	</tr>
	<tr>
		<th style="text-align: center;">글번호</th>
		<td><%=dto.getBbsno()%></td>
		<th style="text-align: center;">IP</th>
		<td><%=dto.getIp()%></td>
	</tr>
	<tr>
		<th style="text-align: center;">그룹번호</th>
		<td><%=dto.getGrpno()%></td>
		<th style="text-align: center;">비밀번호=<%=dto.getPasswd()%></th>
		<td>
					<form action="" method="post"  name="pwfrom" id="pwform" style="color: black">
				<!-- <form action="bbsDelete.jsp" method="post"  onsubmit="return pwCheck(this)"> -->
					<!-- <input class="btn"  type="button" value="삭제" name="passwd" onclick="pwcheck(this.form, 'bbsDelete.jsp')" /> -->
					<input type="hidden" name="bbsno" value="<%=bbsno%>"> 
					<input type="password" class="" name="passwd"
							id="passwd" size="10" maxlength="15" style="width:70%" required>
					<!-- <input class="btn"  type="submit"   value="삭제" /> -->
					<input class="btn"  type="button" value="수정" onclick="pwUPCheck('bbsUpdate.jsp')" />
					<input class="btn"  type="button"   value="삭제" onclick="pwDELCheck('bbsDelete.jsp')"/>
					
				</form>
		</td>
	</tr>

</table>
<%
	}
%>  

<form action="" method="post">
	<input type="hidden" name="bbsno" value="<%=bbsno%>"> 
	<input type="hidden" name="col"      value="<%=col%>"> 
	<input type="hidden" name="word"   value="<%=word%>">  	
		
	<input class="btn"  type="button" value="목록" onclick="move(this.form, 'bbsList.jsp')">
	<input class="btn"  type="button" value="답변"  onclick="move(this.form, 'bbsReply.jsp')"> 
	
</form>



<script>
<!--제출//-->
	function move(f, file) {
		//alert(f);
		//alert(file);
		f.action = file;
		f.submit();
	}

</script>



<br />

<a href="bbsUpdate.jsp">[수정]</a>
<a href="bbsReply.jsp?bbsno=<%=dto.getBbsno()%>">[답변]</a>
<br />

<p>
	<a href="bbsList.jsp">[글목록]</a>
</p>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
</p>

<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
