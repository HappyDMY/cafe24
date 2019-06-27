package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	public Connection getConnection() { // DB 연결

		String url = "jdbc:mariadb://localhost:3306/vagrantly";// =localhost, // 127.0.0.1
		String user = "root";
		String password = "1234";
		String driver = "org.mariadb.jdbc.Driver"; 
/*		
		// 2) MySQL DB 정보
		String url = "jdbc:mysql://localhost:3306/soldesk?useUnicode=true&characterEncoding=euckr";// =localhost, // 127.0.0.1
		String user = "root";
		String password = "1234";
		String driver = "org.gjt.mm.mysql.Driver"; // mysql-connector
*/
/*// 카페 24용
		// 2) MySQL DB 정보
		String url = "jdbc:mysql://localhost/vagrantly";
		String user = "vagrantly";
		String password = "q!849416387";
		String driver = "org.gjt.mm.mysql.Driver";
*/
		Connection con = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("DB연결 실패 : " + e);
		}
		return con;
	}// method end

}// class end
