package net.bbs2;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsList implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		//총 개시글 수
		int total_cnt = 0;
		BoardDBBean dao = new BoardDBBean();
		total_cnt=dao.getArticleCount();
		
		int numPerPage=3;//페이지당 레코드
		int pagePerBlock=10;//페이지 
		
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum==null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*numPerPage+1;
		int endRow=currentPage*numPerPage;
		
		//페이지수
		double totcnt = (double)total_cnt/numPerPage;
		int totalPage = (int)Math.ceil(totcnt);
		
		double d_page= (double)currentPage/pagePerBlock;
		int pages = (int)Math.ceil(d_page)-1;
		int startPage = pages*pagePerBlock;
		int endPage = startPage+pagePerBlock+1;
		
		System.out.println("totcnt:"+totcnt);
		System.out.println("totalPage:"+totalPage);
		System.out.println("pageNum:"+pageNum);
		
		ArrayList articleList = null ;
		if (total_cnt>0) {
			articleList=dao.getArticles(startRow, endRow);
			System.out.println("articleList 글있음:"+articleList);
		}else {
			System.out.println("articleList 글없음:"+articleList);
			//articleList=(ArrayList) Collections.EMPTY_LIST;
			//articleList=(ArrayList) Collections.EMPTY_LIST;
			
		}//if end
		System.out.println();
		int number= 0;
		number = total_cnt-(currentPage-1)*numPerPage;
		
		req.setAttribute("number", new Integer(number));
		req.setAttribute("pageNum", new Integer(currentPage));
		req.setAttribute("startRow", new Integer(startRow));
		req.setAttribute("endRow", new Integer(endRow));
		req.setAttribute("count", new Integer(total_cnt));
		req.setAttribute("pageSize", new Integer(pagePerBlock));
		req.setAttribute("totalPage", new Integer(totalPage));
		req.setAttribute("startPage", new Integer(startPage));
		req.setAttribute("endPage", new Integer(endPage));
		req.setAttribute("articleList", articleList);				
		return "bbsList.jsp";
	}//requesPro end
}//bbsList end
