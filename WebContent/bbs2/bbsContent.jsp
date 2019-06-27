<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->

<strong>Content</strong>
<table class="table-bordered table-condensed"
	style="margin: auto; text-align: justify-content; font-size: medium;">
	
	<tr>
		<th style="text-align: center;">제목</th>
		<td colspan=3>${article.subject }</td>
	</tr>
	<tr>
		<th style="width: 20%; text-align: center;">작성자</th>
		<td style="width: 30%; text-align: center;">${article.writer }</td>
		<th style="width: 20%; text-align: center;">등록일</th>
		<td style="width: 30%; text-align: center;">${article.reg_date }<td>
	</tr>
	<tr>
		<th style="text-align: center;">조회수</th>
		<td>${article.readcount }</td>
		<th style="text-align: center;">IP</th>
		<td>${article.ip }</td>
	</tr>
	<tr>
		<th style="text-align: center;" colspan=4>내용</th>
	</tr>
	<tr>
		<td colspan=4 height="250px"><textarea class="form-control"
				rows="15" cols="30" name="content" readonly="readonly">${article.content }</textarea>

		</td>
	</tr>
	<tr>
		<th style="text-align: center;">글번호</th>
		<td>${article.num }</td>
		<th style="text-align: center;">비밀번호</th>
		<td>
					<form action="" method="post"  name="pwfrom" id="pwform" style="color: black">
				<!-- <form action="bbsDelete.jsp" method="post"  onsubmit="return pwCheck(this)"> -->
					<!-- <input class="btn"  type="button" value="삭제" name="passwd" onclick="pwcheck(this.form, 'bbsDelete.jsp')" /> -->
					<input type="hidden" name="num" value="${num }"> 
					<input type="password" class="" name="passwd"
							id="passwd" size="10" maxlength="15" style="width:70%" required>
					<!-- <input class="btn"  type="submit"   value="삭제" /> -->
					
					<br />
					<input class="btn"  type="button" value="수정" onclick="pwUPCheck('./bbsupdate.do?num=${num}')" />
					<input class="btn"  type="button"   value="삭제" onclick="pwDELCheck('./bbsdelete.do?num=${num}')"/>
					
				</form>
		</td>
	</tr>

</table>
<form action="" method="get">		
	<input class="btn"  type="button" value="목록" onclick="location.href='./bbslist.do?pageNum=${pageNum}'">
	<input class="btn"  type="button" value="답변"  onclick="location.href='./bbsform.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'"> 
</form>
${ref}
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>