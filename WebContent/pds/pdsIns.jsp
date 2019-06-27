<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>
<!-- 본문 시작 -->
<h3>사진 올리기 결과</h3>
<%
	try{
		//1) 첨부된 파일 저장하기
		String saveDirectory = application.getRealPath("/upload");
		int maxPostSize = 1024*1024*10; //10m
		String encoding = "utf-8";
		//--------------------
		out.print(saveDirectory);
		//--------------------
		
		MultipartRequest mr = new MultipartRequest(request, 
				saveDirectory,
				maxPostSize,
				encoding,
				new DefaultFileRenamePolicy()
				);
		
		
		//2) 저장된 파일명, 파일 크기 가져오기
		String item = "";
		String ofileName = ""; 
		String fileName = "";
		long filesize = 0 ;
		File file = null;
		
		Enumeration files = mr.getFileNames();		
		int idx=1;
		
		while(files.hasMoreElements()){
			item = (String)files.nextElement();
			ofileName = mr.getOriginalFileName(item);
			fileName = mr.getFilesystemName(item);
			
			if(fileName!=null){
				file= mr.getFile(item);
				if(file.exists()){//파일 존재 여부
					filesize = file.length();									
				}
			}
			idx++;
		}//while end
		

		//3) tb_pds 테이블에 저장하기
		String wname = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd = mr.getParameter("passwd").trim();
		//String ip = request.getRemoteAddr();
		String ip = request.getHeader("X-Forwarded-For");
		
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getRemoteAddr();
		}
		   
		dto.setWname(wname+" "+ip);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(filesize);

		Boolean flag = dao.insert(dto);
		
		if(flag){
			out.print("<script>");
			out.print("alert('사진이 추가되었습니다.');");
			out.print("location.href='pdsList.jsp';");
			out.print("</script>");
		}else{
			out.print("<p>사진추가 실패</p>");
			out.print("<p><a href='javascript:history.back();''></a></p>");		
		}

	}catch(Exception e){
		out.print(e);
		out.print("<p>파일 업로드 실패</p>");
		out.print("<a href='javascript:history.back();)'>[다시시도]</a>");
	}//try end

%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>