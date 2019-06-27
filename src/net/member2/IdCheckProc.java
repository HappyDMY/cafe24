package net.member2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class IdCheckProc implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		String id = req.getParameter("id").trim();
		String msg = "";
		//out.print(id+" 는");
		MemberDBBean dao = new MemberDBBean();
		int cnt = dao.duplecatedID(id);
		if(cnt==0){
			msg += "<p> 중복되지 않은 아이디 입니다.</p>";
			msg += "<a href='javascript:apply(\\\"\"+id+\"\\\")'>[적용]</a>";
		//out.println("<p> 중복되지 않은 아이디 입니다.</p>");	
		//out.println("<a href='javascript:apply(\""+id+"\")'>[적용]</a>");
		}else{
			msg += "<p style='color:red;'>해당아이디는 사용 할 수 없습니다</p>";
			//out.println("<p style='color:red;'>해당아이디는 사용 할 수 없습니다</p>");
		}
		return "idCheckProc.jsp";
	}
}
