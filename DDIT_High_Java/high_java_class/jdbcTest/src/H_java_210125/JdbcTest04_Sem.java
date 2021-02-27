package H_java_210125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/*
	문제) 사용자로부터 시, 군, 구 중 한가지를 입력 받아 
		DB의 	Member테이블에서 회원의 주소에 입력한 값이 포함되는 데이터를 
		아이디, 이름, 우편번호, 주소를 출력하시오.

*/


public class JdbcTest04_Sem {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","WJH12","java");
			
			System.out.println("검색할 주소를 입력하세요>>");
			String addr = scan.next();
			
			String sql = "select * from member "
					+ " where mem_add1 like '%" + addr + "%' ";
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			System.out.println();
			System.out.println(" == 검색결과 == ");
			while(rs.next()){
				System.out.println("ID : " + rs.getString("mem_id"));
				System.out.println("이름 : " + rs.getString("mem_name"));
				System.out.println("우편번호 : " + rs.getString("mem_zip"));
				System.out.println("주소 : " + rs.getString("mem_add1")+" "+ rs.getString("mem_add2"));
				System.out.println("----------------------------------------------------");
			}
			System.out.println("출력 끝..");			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			
		}finally{
			if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
			if(stmt!=null) try{ stmt.close(); }catch(SQLException e ){};
			if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
			
		}

	}

}
