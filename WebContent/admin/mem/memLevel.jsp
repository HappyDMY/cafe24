<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../adminAuth.jsp"%>
<%@include file="../../member/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mem_memLevel.jsp</title>
</head>
<body>
	<h3>등급조정</h3>
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
			<th>등급변경</th>
		</tr>
		<%
			String col = Utility.checkNull(request.getParameter("col"));
			ArrayList<MemberDTO> list = dao.list(col);
			if (list == null) {
				out.println("<tr><td colspan='8'>자료없음</td></tr>");
			} else {
				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);
					String mlevel =dto.getMlevel();
		%>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPasswd()%></td>
			<td><%=dto.getMname()%></td>
			<td><%=dto.getTel()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getMdate()%></td>
			<td><%=dto.getMlevel()%></td>
			<!-- 회원 등급 변경 -->
			<td align="center">
			<form action="memLevelProc.jsp">
				<input type="hidden" name="id"  id="id" value="<%= dto.getId()%>"/>
				<select name="mlevel" id="mlevel" onchange="levelChange(this.form)">
				<option value="A1"<%if(mlevel.equals("A1") ){out.print("selected");} %>>최고관리자</option>
				<option value="B1"<%if(mlevel.equals("B1") ){out.print("selected");} %>>중간관리자</option>
				<option value="C1"<%if(mlevel.equals("C1") ){out.print("selected");} %>>우수사용자</option>
				<option value="D1"<%if(mlevel.equals("D1") ){out.print("selected");} %>>일반사용자</option>
				<option value="E1"<%if(mlevel.equals("E1") ){out.print("selected");} %>>비회원</option>
				<option value="F1"<%if(mlevel.equals("F1") ){out.print("selected");} %>>탈퇴회원</option>
				<option value="X1"<%if(mlevel.equals("X1") ){out.print("selected");} %>>휴면계졍</option>
				</select>
			</form>
			</td>
		</tr>
		<%
			} //for end
		%>
		<!-- 정렬  -->
		<tr>
			<td colspan="8" align="center">
			<form action="memLevel.jsp">
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
			
			function levelChange(f) {
				var message = "회원 등급을 변경 할까요?";
				if (confirm(message)) {
					f.submit();
				}
			}
		</script>

</body>
</html>
