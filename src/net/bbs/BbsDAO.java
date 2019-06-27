package net.bbs;

import java.sql.*;
import java.util.ArrayList;

import net.utility.*;

public class BbsDAO {
	private DBOpen dbopen = null;
	private DBClose dbclose = null;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuilder sql = null;
	int res = 0;

	// Date Access Object : 데이터베이스에 접근하기 위한 객체

	public BbsDAO() {
		dbopen = new DBOpen();
		dbclose = new DBClose();
	}

	public int insert(BbsDTO dto) {

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			/*
			  -----오라클 sql.
			  append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip) " ); 
			  sql.append(" VALUES(	 (select nvl(max(bbsno),0)+1 from tb_bbs) ");
			  sql.append(" ,?, ?, ?, ?,  (select nvl(max(bbsno),0)+1 from tb_bbs), ?) ");
			 */

			//mysql
			sql.append(" INSERT INTO tb_bbs(wname,subject,content,grpno,passwd,ip,regdt)");
			sql.append(" VALUES(?, ?, ?, (SELECT ifnull(max(bbsno),0)+1 FROM tb_bbs as TB),?,?,now())");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());

			res = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("추가실패" + e);
		} finally {
			dbclose.close(con, pstmt);
		}

		return res;
	}// insert end------------------------------------------

	public synchronized ArrayList<BbsDTO> list() {
		ArrayList<BbsDTO> list = null;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" select bbsno, wname, subject, content, passwd, regdt, ip, readcnt, indent ");
			sql.append(" from tb_bbs ");
			sql.append(" order by grpno desc, indent, ansnum desc ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();// 전체 저장
				do {
					BbsDTO dto = new BbsDTO(); // 한줄저장
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIp(rs.getString("ip"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setIndent(rs.getInt("indent"));
					list.add(dto);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("목록 실패" + e);

		} finally {
			dbclose.close(con, pstmt, rs);
		}

		return list;

	}// list end-------------------------------------------

	public BbsDTO read(int bbsno) {
		BbsDTO dto = new BbsDTO();

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select BBSNO, WNAME, SUBJECT, CONTENT, PASSWD, READCNT, REGDT, GRPNO, INDENT, ANSNUM, IP  ");
			sql.append(" from tb_bbs ");
			sql.append(" where bbsno=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setIp(rs.getString("ip"));

			}

		} catch (Exception e) {
			System.out.println("보기 실패" + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}

		return dto;

	}// read end

	public int incrementCnt(int bbsno) {
		// 조회수 증가
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql = new StringBuilder();
			sql.append(" update tb_bbs ");
			sql.append(" set readcnt= readcnt+1 ");
			sql.append(" where bbsno=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("실패" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;
	}// increment end

	public int reply(BbsDTO dto) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			// 1) 부모글 정보를 가져오기
			int grpno = 0, ansnum = 0, indent = 0;
			sql.append(" select grpno, indent, ansnum ");
			sql.append(" from tb_bbs ");
			sql.append(" where bbsno=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				grpno = rs.getInt("grpno");
				indent = rs.getInt("indent") + 1;
				ansnum = rs.getInt("ansnum") + 1;
			}else {
				System.out.println("부모글 가져오기 실패");
			}
//---------------------------------			

			// 2) 글순서 재조정
			sql.delete(0, sql.length());
			sql.append(" update tb_bbs ");
			sql.append(" set ansnum=ansnum+1 ");
			sql.append(" where grpno=? and ansnum>=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			int sort=pstmt.executeUpdate();
			if (sort==0) {
				System.out.println("글순서 조정실패");
			}
			

//--------------------------------------------			
			// 3) 답변글 추가
			sql.delete(0, sql.length());
			sql.append("INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum, regdt) ");
			sql.append(" VALUES(  (SELECT ifnull(max(bbsno),0)+1 FROM tb_bbs as tb) ");
			sql.append(" , ?, ?, ?, ?, ?, ?, ?, ?, now())");
			/*--오라클
			sql.append(" VALUES((SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs) ");
			sql.append(" , ?, ?, ?, ?, ?, ?, ?, ?)");
			 */
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, grpno);
			pstmt.setInt(7, indent);
			pstmt.setInt(8, ansnum);

			res = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("답변 실패" + e);

		} finally {
			dbclose.close(con, pstmt, rs);
		}

		return res;
	}// reply end

	public int delete(BbsDTO dto) {

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql = new StringBuilder();
			sql.append(" delete from tb_bbs ");
			sql.append(" where bbsno=? and passwd=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제 실패" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;
	}// delete end

	public BbsDTO check(BbsDTO dto) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql = new StringBuilder();
			sql.append(" select wname, subject, content, passwd ");
			sql.append("  from tb_bbs ");
			sql.append(" where bbsno=? and passwd=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BbsDTO();
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
			} else {
				dto = null;
			}

		} catch (Exception e) {
			System.out.println("수정 실패" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return dto;
	}// check end

	public int update(BbsDTO dto) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" update tb_bbs ");
			sql.append(" set wname=?, subject=?, content=?, passwd=?, ip=? ");
			sql.append(" where bbsno=?  ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, dto.getBbsno());
			res = pstmt.executeUpdate();

			System.out.println(res);

		} catch (Exception e) {
			System.out.println("수정실패" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;
	}// update end
	/*
	
	*/

	public int count() {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select count(*) as cnt ");
			sql.append(" from tb_bbs ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} finally {

		}

		return cnt;

	}// count end

	public int count(String col, String word) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select count(*) as cnt ");
			sql.append(" from tb_bbs ");
			if (word.length() >= 1) {
				String search = "";
				if (col.equals("wname")) {
					search += "where wname like '%" + word + "%' ";
				} else if (col.equals("subject")) {
					search += "where subject like '%" + word + "%' ";
				} else if (col.equals("content")) {
					search += "where content like '%" + word + "%' ";
				} else if (col.equals("subject_content")) {
					search += "where subject like '%" + word + "%' ";
					search += "or content like '%" + word + "%' ";
				}
				sql.append(search);
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end

		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} finally {

		}

		return cnt;
	}// count end

	public int count2() {//변수값없어서 전체 카운트
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select count(*) as cnt from ");
			sql.append(" (select * from tb_bbs ");
			sql.append(" where indent=0)a ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("검색된 글 갯수 실패" + e);
		} finally {

		}

		return cnt;

	}// count2 end

	public int count2(String col, String word) {//
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select count(*) as cnt ");
			sql.append(" from tb_bbs ");
			if (word.length() >= 1) {
				String search = "";
				if (col.equals("wname")) {
					search += "where wname like '%" + word + "%' ";
				} else if (col.equals("subject")) {
					search += "where subject like '%" + word + "%' ";
				} else if (col.equals("content")) {
					search += "where content like '%" + word + "%' ";
				} else if (col.equals("subject_content")) {
					search += "where (subject like '%" + word + "%' ";
					search += "or content like '%" + word + "%') ";
				}
				sql.append(search);
				sql.append(" and  indent=0");
			} else {
				sql.append("where indent=0");
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end

		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} finally {

		}

		return cnt;
	}// count2 end

	// list (검색 추가)
	public synchronized ArrayList<BbsDTO> list(String col, String word) {
		ArrayList<BbsDTO> list = null;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" select bbsno, wname, subject, content, passwd, regdt, ip, readcnt, indent");
			sql.append(" from tb_bbs ");

			if (word.length() >= 1) {
				String search = "";
				if (col.equals("wname")) {
					search += "where wname like '%" + word + "%' ";
				} else if (col.equals("subject")) {
					search += "where subject like '%" + word + "%' ";
				} else if (col.equals("content")) {
					search += "where content like '%" + word + "%' ";
				} else if (col.equals("subject_content")) {
					search += "where subject like '%" + word + "%' ";
					search += "or content like '%" + word + "%' ";
				}
				sql.append(search);
			} // if end

			sql.append(" order by grpno desc, ansnum asc ");

			System.out.println(sql);

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();// 전체 저장
				do {
					BbsDTO dto = new BbsDTO(); // 한줄저장
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIp(rs.getString("ip"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setIndent(rs.getInt("indent"));
					list.add(dto);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("목록 실패" + e);

		} finally {
			dbclose.close(con, pstmt, rs);
		}

		return list;
	}// list end---------------------------------

	// list (검색, 페이징 추가)
	public ArrayList<BbsDTO> list(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<BbsDTO> list = null;

		// 페이지당 출력할 레코드 갯수 (10개를 기준)
		// 1 page : WHERE r>=1 AND r<=10
		// 2 page : WHERE r>=11 AND r<=20
		// 3 page : WHERE r>=21 AND r<=30
		int startRow = ((nowPage - 1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			word = word.trim(); // 검색어의 좌우 공백 제거

			if (word.length() == 0) { // 검색을 하지 않는 경우
				sql.append(" select bb.* ");
				sql.append(" 	from(select aa.*, @rm := @rm + 1 as rm ");
				sql.append("		from (SELECT * from `tb_bbs` ORDER BY grpno DESC, ansnum asc)aa  ");
				sql.append(" 		join (select @rm := 0)r ");
				sql.append("		ORDER BY grpno DESC, ansnum asc)bb		 ");
				sql.append(" WHERE rm>=" + startRow + " AND rm<=" + endRow);
			} else {
				// 검색을 하는 경우
				sql.append(" select dd.* from(select cc.* ");
				sql.append(" from(select bb.*, @rm := @rm + 1 as rm  ");
				sql.append(" 	from(select aa.* ");
				sql.append(" 		from (SELECT * from `tb_bbs` ORDER BY grpno DESC, ansnum asc)aa   ");
				String search = "";
				if (col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				} else if (col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				} else if (col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%'";
				} else if (col.equals("subject_content")) {
					search += " WHERE (subject LIKE '%" + word + "%'";
					search += " OR content LIKE '%" + word + "%')";
				}

				sql.append(search);

				sql.append("		 )bb join (select @rm := 0)r)cc  order by grpno desc, ansnum asc)dd ");
				sql.append(" WHERE rm>=" + startRow + " AND rm<=" + recordPerPage);
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					BbsDTO dto = new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setSubject(rs.getString("subject"));
					dto.setWname(rs.getString("wname"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					list.add(dto);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("목록 페이징 실패: " + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return list;
	}// list()--페이징추가한 리스트 end ------------------------

	public ArrayList<BbsDTO> list2(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<BbsDTO> list = null;

		// 페이지당 출력할 레코드 갯수 (10개를 기준)
		// 1 page : WHERE r>=1 AND r<=10
		// 2 page : WHERE r>=11 AND r<=20
		// 3 page : WHERE r>=21 AND r<=30
		int startRow = ((nowPage - 1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			word = word.trim(); // 검색어의 좌우 공백 제거

			if (word.length() == 0) { // 검색을 하지 않는 경우
				sql.append(" select dd.* ");
				sql.append(" from (select @rm := @rm + 1 as rm, cc.*  "); //rm붙이기
				sql.append(" 	from (select aa.*, bb.cnt from ");
				sql.append(" 		(select bbsno,subject,wname,content,readcnt,indent,regdt,grpno ");
				sql.append(" 		from tb_bbs where indent=0 " );					
				sql.append(" 		order by grpno desc, ansnum asc)aa join    ");
				sql.append("     	(select grpno, count(*) as cnt from tb_bbs ");
				sql.append("     	group by grpno order by grpno desc)bb ");
				sql.append("     	on aa.grpno=bb.grpno)cc   "); // 조인끝
				sql.append(" 	join (select @rm := 0)r order by grpno desc  "); // rm붙이기
				sql.append(" ) dd WHERE rm>=" + startRow + " AND rm<=" + endRow);
			} else {
				// 검색을 하는 경우
				sql.append(" SELECT ee.* from( ");
				sql.append(" select @rm := @rm + 1 as rm, dd.*   ");
				sql.append(" from(select cc.*  "); //rm붙이기
				sql.append(" 	from(select aa.*, bb.cnt from ");
				sql.append(" 		(select bbsno,subject,wname,content,readcnt,indent,regdt,grpno ");
				sql.append(" 		from tb_bbs where indent=0 " );					
				sql.append(" 		order by grpno desc, ansnum asc)aa join     ");
				sql.append("     	(select grpno, count(*) as cnt from tb_bbs ");
				sql.append("     	group by grpno order by grpno desc)bb ");
				sql.append("     	on aa.grpno=bb.grpno)cc    "); // 조인끝
				String search = "";
				if (col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				} else if (col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				} else if (col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%'";
				} else if (col.equals("subject_content")) {
					search += " WHERE (subject LIKE '%" + word + "%'";
					search += " OR content LIKE '%" + word + "%')";
				}

				sql.append(search);
				sql.append("	)dd join (select @rm := 0)r order by grpno )ee ");
				sql.append(" WHERE rm>=" + startRow + " AND rm<=" + endRow);
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					BbsDTO dto = new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setSubject(rs.getString("subject"));
					dto.setWname(rs.getString("wname"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("Indent"));
					dto.setComment(rs.getInt("cnt"));
					list.add(dto);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("목록 페이징 실패: " + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return list;
	}// list2()--페이징추가한 리스트 end -------------------

}// class end
