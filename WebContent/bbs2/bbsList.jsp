<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->

<strong>List</strong>
<table
	style="margin: auto; text-align: justify-content; font-size: medium;">
	<tr>
		<td>전체 글수 : ${count }</td>		
	</tr>
	<tr>
		<td><a href="./bbsform.do">글쓰기</a></td>
	</tr>
</table>

<table border="1" style="margin: auto; text-align: justify-content; font-size: medium;">
	<tr>
		<td width="30">번호</td>
		<td>제목</td>
		<td width="80">작성자</td>
		<td width="100">작성일</td>
		<td width="50">조회</td>
		<td width="80">IP</td>
	</tr>
	<!-- fmt:formatDate 액션에서 timestamp 객체를 사용하기 위해서 -->
	<c:set var="today"	value="<%=new Timestamp(System.currentTimeMillis())%>"></c:set>
	<c:set var="today"   value="${fn:substring(today, 0,10) }"></c:set>

	<c:forEach var="article" items="${articleList }">
		<tr>
			<td>
			      <c:out value="${number }"></c:out> 
			      <c:set var="number"	value="${number-1 }"></c:set></td>
			<td>
			       <c:if test="${article.re_level>0 }">
					     <c:forEach var="i" begin="1" end="${article.re_level }" step="1">
					     	re:
					     </c:forEach>
				   </c:if>
				
				    <c:if test="${ article.re_level==0 }"></c:if>
					
					<!-- 제목 으로 상세 페이지로 링크 -->
				    <a href="./bbscontent.do?num=${article.num }&pageNum=${pageNum}">${article.subject }</a>

				    <c:set var="reg"     value="${article.reg_date }"></c:set> 
				    <c:set	var="date"  value="${fn:substring(reg,0,10) }"></c:set> 
				    <c:if 	test="${today == date }">
					      <img src="../images/New.gif" />
				    </c:if> 
				    <c:if test="${article.readcount>=20}">
					       <img src="../images/hot.gif" />
				     </c:if></td>
			<td><a href="mailto:${article.email }">${article.writer}</a></td>
			<td>${date }</td>
			<td>${article.readcount }</td>
			<td>${article.ip }</td>
		</tr>
	</c:forEach>
</table>

	<c:if test="${count>0 }">
		<c:set var="pageCount" value="${totalPage }"></c:set>
		<c:set var="startPage"  value="${startPage }"></c:set>
		<c:set var="endPage"  value="${endPage }"></c:set>
<%-- 
		${requestScope.startPage } <br>
		${pageScope.startPage } <br>
		
		${requestScope.endPage } <br>
		${pageScope.endPage } <br>
		
		*${startPage }* <br>		
		*${endPage }* <br>
		*${endPage }* <br>
 --%>
		 
		
<%-- 		<c:out value="${totalPage }"></c:out>
		<c:out value="${startPage }"></c:out>
		<c:out value="${endPage }"></c:out> --%>
		
		<c:if test="${endPage>pageCount }">
		 	<c:set var="endPage" value="${pageCount+1 }"></c:set>
		</c:if>
		
		
		
		<c:if test="${startPage>0}">
		 	<a href="./bbslist.do?pageNum=${startPage}">[이전]</a>
		</c:if>
		
		<c:forEach var="i"  begin="${startPage+1}"  end="${endPage-1}" >
		 	<a href="./bbslist.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount}">
		 	<a href="./bbslist.do?pageNum=${startPage+11 }">[다음]</a>
		</c:if>
	</c:if>




<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>