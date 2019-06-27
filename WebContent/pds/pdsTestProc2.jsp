<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>pdsTestProc2.jsp</title>
</head>
<body>
<% 
/*
request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("uname"));
out.print("<hr />");
out.print(request.getParameter("subject"));
out.print("<hr />");
out.print(request.getParameter("content"));
out.print("<hr />");
out.print(request.getParameter("filem"));
out.print("<hr />");
//-----------------
/*
	폼에 enctype 이 추가되면 request객체가 가지고 있는 값을 제대로 가져올 수 없다.
	request.getParemeter()메소드는 null이 반환된다
	
	★★★★★  request 객체가 가지고 있는 파일을 가져오려면 ★★★★★
 	1) 사용자가 직접 클래스 작성 (교재 : web.tool.Upload)
	2) cos.jar
	@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" 
	-- 이름 바꾸기 기본
	@ page import="com.oreilly.servlet.multipart.FileRenamePolicy" 
	-- 이름 바꾸기 커스텀
	
	//강사님 홈 jsp 26번글
*/
try{
	String saveDirectory = application.getRealPath("/upload");
	int maxPostSize = 1024*1024*10; //10m
	String encoding = "utf-8";

	//1) 사용자가 전송한 텍스트 정보 및 파일 저장하기
	MultipartRequest mr = new MultipartRequest(request, 
																		saveDirectory,
																		maxPostSize,
																		encoding,
																		new DefaultFileRenamePolicy()
																		);
	out.print("<p>파일 전송 성공</p>");
	out.print(saveDirectory);
	out.print("<hr />");	
	out.print(mr.getFileNames());
	out.print("<br />");
	out.print(mr.getParameter("uname"));
	out.print("<br />");
	out.print(mr.getParameter("subject"));
	out.print("<br />");
	out.print(mr.getParameter("content"));
	out.print("<br />");
	out.print("<hr />");
	

	String item = "";
	String fileName = "";
	String ofileName = "";
	File file = null;
	// <input type="file" name="filem1" />
	// <input type="file" name="filem2" />
	// <input type="file" name="filem3" />
	Enumeration files = mr.getFileNames();
	//Enumeration = 열거형 (배열이랑 똑같음)
	/*
	int[]a = {1,3,5,}
	Enumeration = {1,3,5,}
	*/		
	
	int idx=1;
	
	while(files.hasMoreElements()){
		item = (String)files.nextElement();
		fileName = mr.getFilesystemName(item);
		ofileName = mr.getOriginalFileName(item);
		
		if(fileName!=null){
			file= mr.getFile(item);
			if(file.exists()){//파일 존재 여부
				long filesize = file.length();
				out.print(idx+")원본파일명 : " + ofileName +"<hr />" );
				out.print(idx+")파일명 : " + file.getName() +"<hr />" );
				out.print(idx+")파일크기 : " + filesize +"<hr />" );
			}
		}
		idx++;
	}//while end
	
	
	
}catch(Exception e) {
	out.print(e);
	out.print("<p>파일 업로드 실패</p>");
	out.print("<a href='javascript:history.back();)'>[다시시도]</a>");
}//try end


%>


</body>	
</html>















