<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<!-- 본문시작 loginForm.jsp -->
<h3>비번 찾기</h3>
<%
	String id = request.getParameter("id");
	String mname = request.getParameter("mname");
	String email = request.getParameter("email");
	
	String temporaryPW = dao.forgot(id, mname);
	
	if(temporaryPW.equals("null")){
		out.print("일치하는 값이 없습니다.");
		out.print("<a href='javascript:history.back()'>[다시시도]</a>");
		
	}else{		
		//------이메일로 입시 비밀먼호 전송--------------------------

		//1) 메일서버 (POP3/SMTP)지정하기
		String mailServer = "mw-002.cafe24.com";
		
		Properties props = new Properties();
	    props.put("mail.smtp.host", mailServer);
	    props.put("mail.smtp.auth", "true");
	    
	    //2) 메일서버에서 인증받은 나의 계정 / 비번
		Authenticator myAuth= new MyAuthenticator();
		
	    //3) 1)과 2)가 유효한지 인증
	    Session sess = Session.getInstance(props, myAuth);
		out.print("메일 서버 인증 성공<br />");	
		
		try{
			//4) 메일 보내기
			//	받는사람, 보내는 사람, 참조, 숨은참조
			// 	제목, 내용, 보낸 날짜...
			String to = email;
			String from = "vagrantsj@gmail.com";
			String subject = "임시비밀번호 입니다.";
			String msgText = "임시비밀번호 : ("+temporaryPW +")를 입력 하세요";
			
			//엔터 및 특수문자 변경
			msgText = Utility.convertChar(msgText);			
					
			
			//받는사람 
			InternetAddress[] address = {
					new InternetAddress(to)
			};
			
			/*
			받는 사람이 여러명인 경우		
			InternetAddress[] address = {
					new InternetAddress(to)
					new InternetAddress(to2)
					new InternetAddress(to3)
			};		
			*/
			
			Message msg = new MimeMessage(sess);
			
			//받는사람
			msg.setRecipients(Message.RecipientType.TO, address);;
			
			//보내는 사람
			msg.setFrom(new InternetAddress(from));
			
			//메일 제목
			msg.setSubject(subject);
			
			//메일 내용
			msg.setContent(msgText, "text/html; charset=UTF-8");
			
			//보낸 날짜
			msg.setSentDate(new Date());
			
			//메일 전송
			Transport.send(msg);
			out.println(to+"님에게 <br /> 임시비밀번호가 발송 되었습니다.");
			
			
			
		}catch(Exception e){
			out.print("<p>전송실패"+e +"</p>" );
			out.print("<p><a href='javascript:history.back();'>[다시시도]</a></p>" );		
		}
		
		
	}//if end
%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>