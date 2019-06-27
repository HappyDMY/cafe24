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
	<title>pdsTestProc.jsp</title>
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
	
	//2) mr rorcprk /upload 폴더에 저장시킨
	// 파일관련 정보(파일명, 확장명, 용량)가져오기
	out.print(mr.getFileNames());
	out.print("<br />");
	
	
	// <input type="file" name="filem1" />
	// <input type="file" name="filem2" />
	// <input type="file" name="filem3" />
	Enumeration files = mr.getFileNames();
	//Enumeration = 열거형 (배열이랑 똑같음)
	/*
	int[]a = {1,3,5,}
	Enumeration = {1,3,5,}
	*/		
	out.print(files);	
	out.print("<hr />");//-------------------
	
	
	//3) 2) 가가지고 있는 객체에서 개별 접근
	String item =  (String)files.nextElement();
	out.println(item); // <input type="file" name=filem  />
	out.print("<hr />");//--------------------------
	
	//4) 3)에서 item  이름으로 전송된 파일을 
	// mr 객체에서 가져오기
	String ofileName = mr.getOriginalFileName(item);
	String fileName = mr.getFilesystemName(item);	
	out.print(ofileName+"(원본파일명)");
	out.print("<br />");
	out.print(fileName+"(renamed 파일명)");
	out.print("<hr />");//--------------------------
	
	//5 파일의 크기 알아보기
	File file = mr.getFile(item);//
	if(file.exists()){
		out.print("파일명 : " + file.getName());
		out.print("<br />");
		out.print("파일 크기 : " + file.length());
		out.print("<br />");
		out.print("파일 크기 : " + Utility.toUnitStr(file.length()));
		out.print("<br />");
		
		//6) 파일 다운로드 
		// 웹브라우저에서 해석되는 페이지는 제외
		// .htiml .jsp .asp .php
		// .png .jpg .gif .avi .mp3 등 은 제외
		out.print("첨부파일 : ");
		out.print("<a href='../upload/"+file.getName()+"'>");
		out.print(file.getName());
		out.print("</a>");
		

		
		
		
	}else{
		out.print("해당파일이 존재하지 않음");
	}
	
	
	
	
}catch(Exception e) {
	out.print(e);
	out.print("<p>파일 업로드 실패</p>");
	out.print("<a href='javascript:history.back();)'>[다시시도]</a>");
}//try end


%>


</body>	
</html>















