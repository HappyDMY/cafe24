<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>

<!-- 본문 시작 bbs-->

<h3>* 글수정 *</h3>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd =request.getParameter("passwd").trim();
	
	dto.setPasswd(passwd);
	dto.setBbsno(bbsno);
	dto = dao.check(dto);
	
	if(dto==null){
		out.print("비밀번호가 이상해요");		
	}else{
		
%>
<h3>수정할내용 입력</h3>
<div class="row">
	<div class="col-md-12">
		<form class="form-group" name="bbsfrm" method="post" 
			action="bbsUpdateProc.jsp" onsubmit="return bbsCheck(this)">
				<input type="hidden" name="bbsno" value="<%=bbsno%>"> 
			<table class="table table-bordered table-condensed"  style="margin:0 auto;">		
				<tr>
					<th>작성자</th>
					<td><input type="text" class="form-control" name="wname"
						value="<%=dto.getWname() %>" maxlength="20" required></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" class="form-control" name="subject"
						value="<%=dto.getSubject() %>" size="20" maxlength="100" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" rows="5" cols="30"
							name="content" required> <%=dto.getContent()%> </textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" class="form-control" name="passwd"
						value="<%=dto.getPasswd()%>" size="10" maxlength="15" required></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정">
						<input type="reset" value="취소(reset)"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%
	}
%>
<%




%>


<!-- 본문 끝 -->
<%@include file="../footer.jsp"%>
