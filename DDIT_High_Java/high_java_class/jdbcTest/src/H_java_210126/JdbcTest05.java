package H_java_210126;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcTest05 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		// DB 연결 사용시 connection 객체 필요
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","WJH12","java");
			
			System.out.println("계좌번호 정보 추가하기");
			System.out.print("계좌번호 : ");
			String bankNo = scan.next();
			
			System.out.print("은행명 : ");
			String bankName = scan.next();
			
			System.out.print("예금주 : ");
			String userName = scan.next();
			
			// Statement 객체를 이용하기
		/*	String sql = " insert into bankinfo ( bank_no, bank_name, bank_user_name, bank_date)"
							+ "values ('"+ bankNo +"','"+ bankName +"','"+ userName +"',sysdate)";
			
			System.out.println("SQL : " + sql);
			
			int cnt = stmt.executeUpdate(sql);
			
			stmt = conn.createStatement();

			// SQL문이 select문일때 실행하는 메서드는 executeQuery()메서드르 사용하고
			// SQL문 insert, update, delete등과 같이 select문이 아닐 경우에는
			// executeUpdate()메서드를 사용하여 실행한다.
			// executeUpdate()메서드의 반환값은 작업에 성공한 레코드 수이다.
			
			*/
			
			// PreparedStatement 객체 이용하기
			
			// SQL문을 작성할 때 SQL문에 데이터가 들어갈 자리를 
			// 물음표(?)로 표시해서 작성한다.
			
			String sql = " insert into bankinfo ( bank_no, bank_name, bank_user_name, bank_date)"
					+ "values (?, ?, ?, sysdate )";
			
			// PreparedStatement객체 생성하기
			// -- 실무에서 더 많이 사용 
			// ==> 실행할 SQL문을 인수값으로 지정하여 생성한다.
			
			pstmt = conn.prepareStatement(sql);
			
			// SQL문의 물음표(?) 자리에 들어갈 데이터를 세팅한다.
			// 형식 ) pstmt.set자료형이름(물음표 번호, 세팅할 데이터)
			//		==> 물음표 번호는 1번부터 시작한다.
			
			pstmt.setString(1,bankNo);
			pstmt.setString(2, bankName);
			pstmt.setString(3, userName);
	
			// 데이터가 셋팅이 완료되면 SQL문을 실행한다.
			// SQL 쿼리문이 들어가지 않는다.
			int cnt = pstmt.executeUpdate();
			
			System.out.println("SQL : " + sql);
			
			System.out.println("반환값  : " + cnt);
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}finally {
			if(stmt!=null) try{ stmt.close(); }catch(SQLException e ){};
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
			if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				
			
		}
	}

}
