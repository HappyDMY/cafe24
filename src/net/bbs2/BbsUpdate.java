package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdate implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		int  num	=	Integer.parseInt(req.getParameter("num"));
		String passwd	= req.getParameter("passwd");		
		
		BoardDBBean dao = new BoardDBBean();
		BoardDataBean dto=dao.updateCheck(num, passwd);
		String msg = "";
		
		if (dto!=null) {//비번 맞는지 검사
			System.out.println("비번일치");
		}else {
			msg +=  "<script>alert('수정 실패 (비밀번호가 일치하지 않습니다.)');";
			msg +=  "location.href='javascript:history.back()';</script>	";	
		}		
		req.setAttribute("msg", msg);
		req.setAttribute("dto",dto);
		return "bbsUpdateForm.jsp";
	}

}
