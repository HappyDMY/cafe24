package net.member2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class IdCheckProc implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		String id = req.getParameter("id").trim();
		String msg = "";
		//out.print(id+" ��");
		MemberDBBean dao = new MemberDBBean();
		int cnt = dao.duplecatedID(id);
		if(cnt==0){
			msg += "<p> �ߺ����� ���� ���̵� �Դϴ�.</p>";
			msg += "<a href='javascript:apply(\\\"\"+id+\"\\\")'>[����]</a>";
		//out.println("<p> �ߺ����� ���� ���̵� �Դϴ�.</p>");	
		//out.println("<a href='javascript:apply(\""+id+"\")'>[����]</a>");
		}else{
			msg += "<p style='color:red;'>�ش���̵�� ��� �� �� �����ϴ�</p>";
			//out.println("<p style='color:red;'>�ش���̵�� ��� �� �� �����ϴ�</p>");
		}
		return "idCheckProc.jsp";
	}
}
