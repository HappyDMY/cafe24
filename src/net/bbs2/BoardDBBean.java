package net.bbs2;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BoardDBBean {
	  DBOpen  dbopen =null;
	  DBClose dbclose=null;

	  Connection con = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  StringBuffer sql = null;

	  public BoardDBBean() {
	    dbopen =new DBOpen(); //데이터베이스 연결 객체 할당
	    dbclose=new DBClose();
	  }

	public void insertArticle(BoardDataBean article) {
		int num = article.getNum();
		int ref =article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuffer();
			pstmt= con.prepareStatement("Select max(num) from board");	
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				number=rs.getInt(1)+1;
			} else {
				number = 1;
			}//if end
			
			//답변 글순서 재조정
			if (num!=0) {
				sql.delete(0, sql.length());
				sql.append("update board SET re_step=re_step+1 where ref=? and re_step>? ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step+1;
				re_level = re_level+1;
				
			} else {
				ref=number;
				re_step=0;
				re_level=0;					
			}
			sql.delete(0, sql.length());
			sql.append(" insert into board(num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) ");
			sql.append("  values((SELECT ifnull(max(num),0)+1 FROM board as TB), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose.close(con, pstmt, rs);
		}
	}// insertArticle end
	
	
	public int getArticleCount() {
		int count=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuffer();
			
			sql.append(" SELECT COUNT(*)as cnt from board  ");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		System.out.println("총 글수"+count);
		return count;
	}

	public ArrayList getArticles(int startRow, int endRow) {
		ArrayList articleList=null;
		
		try {
			sql =new StringBuffer();
			con=dbopen.getConnection();
			
			sql.append(" SELECT aa.* ");
			sql.append(" from ");
			sql.append(" 	(SELECT @rownum := @rownum + 1 as rnum, bb.* ");
			sql.append(" 	from ");
			sql.append(" 		(SELECT num, writer, email, subject, passwd, reg_date,ref ");
			sql.append("  		, re_step, re_level, content, ip, readcount");
			sql.append(" 		FROM board ORDER BY ref DESC, re_step ASC ");
			sql.append("		)bb JOIN (select @rownum := 0) r ");
			sql.append("		ORDER BY ref DESC, re_step ASC ");
			sql.append(" 	)aa ");
			sql.append(" WHERE aa.rnum >=? AND aa.rnum<=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(endRow);
				do {
					BoardDataBean article=new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					article.setReadcount(rs.getInt("readcount"));
					
					articleList.add(article);					
				} while (rs.next());				
			}

			
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return articleList;
	}

	public BoardDataBean getArticle(int num) {		
		BoardDataBean article = new BoardDataBean();
		try {
			con=dbopen.getConnection();
			sql =new StringBuffer();
			sql.append(" update board ");
			sql.append(" set readcount= readcount+1 ");
			sql.append(" where num=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql.delete(0, sql.length());			
			sql.append(" SELECT * FROM board where num=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));				
			}
			
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return article;
	}//getArticle end

	public boolean delete(int num, String passwd) {
		try {
			System.out.println(num+"_"+passwd);
			con=dbopen.getConnection();
			sql =new StringBuffer();
			sql.append(" SELECT num FROM board where num=? and passwd=?  ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);			
			pstmt.setString(2, passwd);	
			rs=pstmt.executeQuery();			
			System.out.println();
			if (rs.next()) {
				sql.delete(0, sql.length());	
				sql.append(" DELETE FROM board WHERE NUM=? ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, num);
				int res=pstmt.executeUpdate();
				System.out.println(res);
			}else {
				dbclose.close(con, pstmt, rs);
				return false; 				
			}
			
			
		} catch (Exception e) {
			System.out.println(e);			
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		return true;
	}// delete end

	public BoardDataBean updateCheck(int num, String passwd) {
		BoardDataBean dto = new BoardDataBean();
		try {
			System.out.println(num+"_"+passwd);
			con=dbopen.getConnection();
			sql =new StringBuffer();
			sql.append(" SELECT num, writer, subject, email, content, passwd FROM board where num=? and passwd=?  ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);			
			pstmt.setString(2, passwd);	
			rs=pstmt.executeQuery();			
			
			if (rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setEmail(rs.getString("email"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));				
			}else {
				dto = null;
			}
			System.out.println(dto.getEmail());
		} catch (Exception e) {
			System.out.println(e);			
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		return dto;
	}//updateCheck end

	public int updateArticle(BoardDataBean upDto) {
		int res = 0;
		try {
			con=dbopen.getConnection();
			sql =new StringBuffer();	
			
			sql.append(" UPDATE board SET WRITER=?, SUBJECT=? , EMAIL=?, CONTENT=? , PASSWD=? ");
			sql.append(" WHERE num=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, upDto.getWriter());
			pstmt.setString(3, upDto.getSubject());
			pstmt.setString(2, upDto.getEmail());
			pstmt.setString(5, upDto.getContent());
			pstmt.setString(4, upDto.getPasswd());
			pstmt.setInt(6, upDto.getNum());
			res=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;	
		
	}//updateArticle end

	
	  

/*
	  //DBCP방식의 오라클 연결
	  private Connection getConnection() throws Exception{
	    Context initCtx=new InitialContext();
	    DataSource ds  =(DataSource)initCtx.lookup("java:comp/env/jdbc/oracle");
	    return ds.getConnection();
	  }
*/

}//class end
