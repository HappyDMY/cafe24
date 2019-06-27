package net.member2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDBBean {
	  DBOpen  dbopen =null;
	  DBClose dbclose=null;

	  Connection con = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  StringBuffer sql = null;
	  int res = 0;

	  public MemberDBBean() {
	    dbopen =new DBOpen(); //�����ͺ��̽� ���� ��ü �Ҵ�
	    dbclose=new DBClose();
	  }

	public int login(String id, String passwd) {
		con = dbopen.getConnection();
		sql = new StringBuffer();
		sql.append(" select COUNT(id)as cnt from member ");
		sql.append(" where id=? and passwd=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				res=rs.getInt("cnt");
			}	
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		System.out.println("�α��� res : "+res);
		return res;
	}

	public int duplecatedID(String id) {
		con = dbopen.getConnection();
		sql = new StringBuffer();
		sql.append(" select COUNT(id)as cnt from member ");
		sql.append(" where id=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();			
			if (rs.next()) {
				res=rs.getInt("cnt");
			}	
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		System.out.println("id �ߺ�üũ res : "+res);
		return res;
	}  

/*
	  //DBCP����� ����Ŭ ����
	  private Connection getConnection() throws Exception{
	    Context initCtx=new InitialContext();
	    DataSource ds  =(DataSource)initCtx.lookup("java:comp/env/jdbc/oracle");
	    return ds.getConnection();
	  }
*/

}//class end
