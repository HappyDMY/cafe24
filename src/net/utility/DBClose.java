package net.utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class DBClose {// �����ͺ��̽� �ڿ� �ݳ��� ���� �Լ� �� ������
	public void close(Connection con) {
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {}
	}//method end
	//----------------------------------------
	public void close(Connection con, PreparedStatement pstmt) {		
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (Exception e) {}

		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {}
	}//method end
	//----------------------------------------
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {}
		
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (Exception e) {}

		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {}
		
	}//method end
}//class end
