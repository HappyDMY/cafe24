package net.member2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.CommandAction;

public class LoginForm implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		String s_id = "";
		String s_passwd = "";
		HttpSession session = req.getSession();
		String msg = "";

		if (session.getAttribute("s_id") == null || session.getAttribute("s_passwd") == null) {
			s_id = "guest";
			s_passwd = "guest";
			System.out.println(s_id+ "-"+s_passwd);
		} else {
			s_id = (String) session.getAttribute("s_id");
			s_passwd = (String) session.getAttribute("s_passwd");
			System.out.println(s_id+ "-"+s_passwd);
		}

		if (s_id.equals("guest") || s_passwd.equals("guest")) {
			// �α����� ���� ���� ���
			// ��Ű�� ��������------------------
			Cookie[] cookies = req.getCookies();
			String c_id = "";
			if (cookies != null) {// ��Ű�� �����ϸ� true
				for (int i = 0; i < cookies.length; i++) {
					Cookie cookie = cookies[i];
					if (cookie.getName().equals("c_id") == true) {// ��Ű���� c_id�� �ִ���
						c_id = cookie.getValue();
						
						System.out.println("c_id="+c_id);
						req.setAttribute("c_id", c_id);
					}
				} // for end
			} // if end
				// ---------------------------
		} else {
			// �α��� ������
			msg+= "<strong>" + s_id + "</strong>"; 
			msg+= "<a href='logout.do'>[�α׾ƿ�]</a>"; 
			msg+= "<br /><br />"; 
			//msg+= "<a href='memberupdate.do'>[ȸ����������]</a>"; 
			//msg+= "<a href='memberwithrow.do'>[ȸ��Ż��]</a>"; 
			req.setAttribute("msg", msg);
		} // if end
		
		return "loginForm.jsp";
	}// requestPro end
}// LoginForm class end
