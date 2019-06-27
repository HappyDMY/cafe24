package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;
import net.utility.Utility;

public class BbsDelete implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		int  num	=	Integer.parseInt(req.getParameter("num"));
		String passwd	= req.getParameter("passwd");		
		
		BoardDBBean dao = new BoardDBBean();
		
		boolean del =dao.delete(num,passwd);
		
		String msg="";
		if (del) {
			req.setAttribute("del", del );
			
			String root=  req.getContextPath();
			msg +=  "<script>alert('�����Ǿ����ϴ�.');</script>";
			msg += "<meta http-equiv=\'refresh\' content=\'0;url="+root+"/bbs2/bbslist.do\'>";
		} else {
			msg +=  "<script>alert('���� ���� (��й�ȣ�� ��ġ���� �ʽ��ϴ�.)');";
			msg +=  "location.href='javascript:history.back()';</script>	";	
				
		}		
		req.setAttribute("msg", msg);
		
		
		return "bbsResult.jsp";
	}

}
