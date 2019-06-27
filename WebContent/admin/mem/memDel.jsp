<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../adminAuth.jsp"%>
<%@include file="../../member/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mem_memDel.jsp</title>
</head>
<body>
	<h3>회원 삭제</h3>
	회원수:
	<strong><%=dao.recordCount()%></strong>
	<hr>
	<table border="1" class="table">
		<tr>
			<th>아이디</th>
			<th>비번</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>등급</th>
			<th>삭제</th>
		</tr>
		<%
			String col = Utility.checkNull(request.getParameter("col"));
			ArrayList<MemberDTO> list = dao.list(col);
			if (list == null) {
				out.println("<tr><td colspan='8'>자료없음</td></tr>");
			} else {
				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPasswd()%></td>
			<td><%=dto.getMname()%></td>
			<td><%=dto.getTel()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getMdate()%></td>
			<td><%=dto.getMlevel()%></td>
			<!-- 회원 삭제-->
			<td align="center">
			<form action="memDelProc.jsp">
				<input type="hidden" name="id"  id="id" value="<%= dto.getId()%>"/>
				<input type="hidden" name="s_admin_pw"  id="s_admin_pw" value="<%=s_admin_pw%>"/>
				<input type="button" value="삭제"  onclick="delpwCheck(this.form)"/>
				
			</form>
			</td>
		</tr>
		<%
			} //for end
		%>
		<!-- 정렬  -->
		<tr>
			<td colspan="8" align="center">
			
			<form action="memDel.jsp">
			정렬 방식 : 
				<select name="col" onchange="sort(this.form)">
					<option value="id" <%if (col.equals("id")) {out.print("selected");}%>>ID순
					<option value="mname" <%if (col.equals("mname")) {}%>>이름순					
					<option value="mdate" <%if (col.equals("mdate")) {out.print("selected");}%>>가입일
					
				</select>
			</form>
			</td>
		</tr>
		<%
			} //if end--------리스트 뽑기--------------
		%>
	</table>
	
	<script>
	function sort(f) {
		f.submit();
	}//sort() end
			alert(f.s_admin_pw.value);
	
	function delpwCheck(f) {
		  var check = prompt("비밀번호를 입력해주세요");
		  if (check==null) {
			return false;
		}else if (f.s_admin_pw.value==check) {
			delCheck(f)
		}else {
			alert("비밀번호가 틀렸습니다.");
			return false;
		}

	}//delpwCheck end
	
	function delCheck(f) {		
		
		var message = "회원 "+f.id.value+"의 아이디를 삭제하시겠습니까?";
		if (confirm(message)) {
			f.submit();
		}
	}
	</script>
</body>
</html>
