package H_java_210126;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/*

 LPROD테이블에 새로운 데이터를추가하시오.

 조건 ) lprod_gu와 lprod_nm은 직접 입력받아서 처리하고,
 lprod_id는 현재의 lprod_id중 제일 큰 값보다 1 증가된 값으로 한다.
 그리고, 입력받은 lprod_gu 가 이미 등록되어 있으면 다시 입력받아서 처리한다.

 */

public class JdbcTest06 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		// db 연결 객체
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "WJH12", "java");

			String sql1 = "select lprod_gu from lprod ";

			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql1);
			while (true) {
				boolean isdata = false;
				System.out.println("lprod_gu를 입력하세요>>");
				String lprodgu = sc.next();

				while (rs.next()) {
					//System.out.println(rs.getString("lprod_gu"));
					// System.out.println(rs.next());
					if (rs.getString("lprod_gu").equals(lprodgu)) {
						isdata = true;
						System.out.println("이미 등록된 lprod입니다. 다시 입력해주세요.");
						continue;
					}

				}

			

				 String maxNum =
				 " select * from lprod where lprod_id = (select max(lprod_id) from lprod) ";
				if (isdata == false) {

					 System.out.println("lprod_nm을 입력하세요>>");
					 String lprodid = sc.next();
					
					 String maxNum2 =" select * from lprod where lprod_id = (select max(lprod_id) from lprod) ";
					
					
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		} finally {
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			;
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			;
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
			;

		}

	}

}
