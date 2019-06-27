package net.member;

import java.sql.*;
import java.util.ArrayList;
import net.utility.*;

public class MemberDAO {
	private DBOpen dbopen = null;
	private DBClose dbclose = null;

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	private int res = 0;

	// Date Access Object : �����ͺ��̽��� �����ϱ� ���� ��ü

	public MemberDAO() {
		dbopen = new DBOpen();
		dbclose = new DBClose();
	}
	
	public int duplecatedID(String id) {
		con = dbopen.getConnection();
		sql = new StringBuilder();
		
		int cnt=7;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select count(id) as cnt from member ");
			sql.append(" where id = ? ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt=rs.getInt("cnt");
				
			}
			
			System.out.println(rs.getInt("cnt"));
			System.out.println(id);
			System.out.println("Commit : "+con.getAutoCommit());
			System.out.println(cnt);

		} catch (Exception e) {
			System.out.println("�ߺ��˻� ����" + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		return cnt;		
	}// duplecatedID end
	
	public int duplecatedEmail(String email) {
		con = dbopen.getConnection();
		sql = new StringBuilder();
		
		int cnt=7;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select count(email) as cnt from member ");
			sql.append(" where email = ? ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt=rs.getInt("cnt");
				
			}
			
			System.out.println(email);
			System.out.println("cnt : "+ cnt);

		} catch (Exception e) {
			System.out.println("�ߺ��˻� ����" + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		return cnt;		
	}// duplecatedID end-----------------------
	
	public int insert(MemberDTO dto) {

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
			sql.append(" values( ?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', now() ) ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());

			res = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("�߰�����" + e);
		} finally {
			dbclose.close(con, pstmt);
		}

		return res;
	}// insert end------------------------------------------

	public String login(String id, String passwd){
		con = dbopen.getConnection();
		sql = new StringBuilder();

		String mlevel=null;
		
		try {
			sql.append(" select mlevel from member ");
			sql.append(" where id=? and passwd=? ");
			sql.append(" and mlevel in ('A1','B1','C1','D1') ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mlevel=rs.getString("mlevel");
			}
			
			System.out.println(id);
			System.out.println(passwd);

		} catch (Exception e) {
			System.out.println("�α��� ����" + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		
		
		return mlevel;		
	}//login() end
	
	public int recordCount() {
		int cnt=0;
		con = dbopen.getConnection();
		sql = new StringBuilder();

		
		try {
			sql.append(" SELECT COUNT(*) AS cnt FROM member ");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt=rs.getInt("cnt");
				System.out.println("ī��Ʈ ���� cnt = "+cnt);
			}
			
			

		} catch (Exception e) {
			System.out.println("ȸ���� ī��Ʈ ����" + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		
		return cnt;		
	}// recordCount end
	
	public synchronized ArrayList<MemberDTO> list(String col) {
		ArrayList<MemberDTO> list = null;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" SELECT  id, passwd, mname, tel, email, mdate, mlevel ");
			sql.append(" FROM member ");
			
			if(col.equals("id")||col.equals("")) {
				sql.append(" order by id asc ");
			}else if (col.equals("mname")) {
				sql.append(" order by mname asc ");
			}else if (col.equals("mdate")) {
				sql.append(" order by mdate asc ");				
			}
			
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();// ��ü ����
				do {
					MemberDTO dto = new MemberDTO(); // ��������
					dto.setId(rs.getString("id"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setMname(rs.getString("mname"));
					dto.setTel(Utility.checkNull(rs.getString("tel")));
					dto.setEmail(rs.getString("email"));
					dto.setMdate(rs.getString("mdate"));
					dto.setMlevel(rs.getString("mlevel"));
					list.add(dto);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("��� ����" + e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return list;
	}// list end-------------------------------------------

	
	public int updateMlevel(String id, String mlevel) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" update member");
			sql.append(" set mlevel=? ");
			sql.append(" where id=?  ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mlevel);
			pstmt.setString(2, id);
			res = pstmt.executeUpdate();

			System.out.println(id+" �� ��޺��� ����"+res);

		} catch (Exception e) {
			System.out.println("��޺��� ����" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;
	}// updateMlevel end
	
	
	public int deleteMem(String id) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" DELETE MEMBER ");
			sql.append(" WHERE id=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			

			res=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ȸ�� ���� ����" + e);		
		} finally {
			dbclose.close(con, pstmt);
		}
		
		return res;		
	}//deleteMem ebd
	
	public int update(MemberDTO dto) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" update member ");
			sql.append(" set passwd=?, mname=?, tel=? , email=?, zipcode=?, ADDRESS1=?, ADDRESS2=?, JOB=?  ");
			sql.append(" where id=?  ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getJob());
			pstmt.setString(9, dto.getId());
			res = pstmt.executeUpdate();

			System.out.println(res);

		} catch (Exception e) {
			System.out.println("��������" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;
	}//update end
	
	public String forgot(String id, String mname) {
		String temporaryPW="";
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT id, mname, PASSWD FROM MEMBER WHERE id=? and mname=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, mname);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {

				for (int i = 0; i < 5; i++) {
					temporaryPW+=(char)((int)(Math.random()*10)+48);//0~9����
				}//for end				
				for (int i = 0; i < 5; i++) {
					temporaryPW+=(char)((int)(Math.random()*26)+65);//A~Z����
				}//for end				
				System.out.println(temporaryPW);

				sql = new StringBuilder();
				sql.append(" UPDATE MEMBER set PASSWD=? where id=? ");			
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, temporaryPW);
				pstmt.setString(2, id);
				res=pstmt.executeUpdate();					
				
				System.out.println(res);
				
			}else {
				temporaryPW = "null";//������
			}//if end		
			
		} catch (Exception e) {
			System.out.println("ã�����"+e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return temporaryPW;
	}//forgot end
	
	public int updateLikeDel(String id) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();

			sql.append(" update member");
			sql.append(" set mlevel='F1' ");
			sql.append(" where id=?  ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			res = pstmt.executeUpdate();

			System.out.println(id+" �� ����� F1 ���� ���� ����"+res);

		} catch (Exception e) {
			System.out.println(" F1 ���� ��޺��� ����" + e);
		} finally {
			dbclose.close(con, pstmt);
		}
		return res;
	}// updateLikeDel end

}//class end