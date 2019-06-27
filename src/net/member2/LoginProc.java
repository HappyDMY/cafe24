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
			// 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("s_id", id);
			session.setAttribute("s_passwd", passwd);
			msg += "<script>alert('로그인 되었습니다.');";
			msg += "location.href='loginform.do';</script>";
		} else {
			msg += "<script>alert('로그인 실패 (비밀번호가 일치하지 않습니다.)');";
			msg += "location.href='javascript:history.back()';</script>";
		}
		req.setAttribute("res", res);
		req.setAttribute("msg", msg);
		System.out.println("res " + res);
		System.out.println("msg " + msg);

		// 쿠키 아이디 저장----------------------
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
			// 요청한 사용자 PC에 쿠키값을 저장
		resp.addCookie(cookie);
		//쿠키 끝------------------
		
		return "loginProc.jsp";
	}
}// LoginPro class end
