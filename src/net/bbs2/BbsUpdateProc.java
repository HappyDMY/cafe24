package net.bbs2;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;
import net.utility.Utility;

public class BbsUpdateProc implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		BoardDataBean upDto = new BoardDataBean();
		upDto.setNum(Integer.parseInt(req.getParameter("num")));
		upDto.setWriter(req.getParameter("writer"));
		upDto.setEmail(req.getParameter("email"));
		upDto.setSubject(req.getParameter("subject"));
		upDto.setPasswd(req.getParameter("passwd"));
		upDto.setContent(req.getParameter("content"));
		upDto.setIp(req.getRemoteAddr());
		
		BoardDBBean update = new BoardDBBean();
		int res = update.updateArticle(upDto);
		
		//1)
		//return "bbsInsertProc.jsp";
		
		//2)
		String root= req.getContextPath();
		System.out.println("root = "+ root);
		String msg="";
		if (res==1) {
			msg +=  "<script>alert('수정되었습니다');</script>";
			msg += "<meta http-equiv=\'refresh\' content=\'0;url="+root+"/bbs2/bbslist.do\'>";
		}
		
		req.setAttribute("msg",	msg);
		
		return "bbsResult.jsp";
		
	}

}//bbsinsert end
