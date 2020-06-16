package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbConnection {
	private DbConnection() {}  //객체생성을 못하게 하는 것 (private를 써서)
	static Connection getConnection() { //static이 있다는 것 = 클래스명.멤버명으로 call할 수 있다.
			Connection conn = null;
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","1234");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
	}
	static void close (Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
