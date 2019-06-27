package net.member2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.CommandAction;
import net.utility.Utility;

public class LoginProc implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		String id = req.getParameter("id").trim();
		String passwd = req.getParameter("passwd").trim();

		System.out.println(id + "_" + passwd);

		MemberDBBean dao = new MemberDBBean();
		int res = dao.login(id, passwd);
		String msg = "";
		if (res == 1) {
			// �α��� ����
			HttpSession session = req.getSession();
			session.setAttribute("s_id", id);
			session.setAttribute("s_passwd", passwd);
			msg += "<script>alert('�α��� �Ǿ����ϴ�.');";
			msg += "location.href='loginform.do';</script>";
		} else {
			msg += "<script>alert('�α��� ���� (��й�ȣ�� ��ġ���� �ʽ��ϴ�.)');";
			msg += "location.href='javascript:history.back()';</script>";
		}
		req.setAttribute("res", res);
		req.setAttribute("msg", msg);
		System.out.println("res " + res);
		System.out.println("msg " + msg);

		// ��Ű ���̵� ����----------------------
		String c_id = Utility.checkNull(req.getParameter("c_id"));
		Cookie cookie = null;

		if (c_id.equals("SAVE")) {
			// new Cokie("c_id", c_id);
			cookie = new Cookie("c_id", id);
			cookie.setMaxAge(60 * 60 * 24 * 30);

		} else {
			// new Cokie("c_id", "");
			cookie = new Cookie("c_id", "");
			cookie.setMaxAge(0);

		} // if end
			// ��û�� ����� PC�� ��Ű���� ����
		resp.addCookie(cookie);
		//��Ű ��------------------
		
		return "loginProc.jsp";
	}
}// LoginPro class end
