<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>pdsTest.jsp</title>
</head>
<body>
<h3>파일 첨부 테스트</h3>
	<form action="pdsTestProc.jsp" method="post" 
	enctype="multipart/form-data" ><!-- 파일 첨부시 필수 -->
	이름 : <input type="text" name="uname" /><br />
	제목 : <input type="text" name="subject" /><br />
	내용 : <textarea name="content" id="content" cols="30" rows="10"></textarea><br />
	첨부 : <input type="file" name="filem" /><br />
	<input type="submit"  value="전송"/>
	</form>
</body>	
</html>















