package H_java_210125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 문제1) 사용자로부터 Lprod_id값을 입력받아 입력한 ㄱ밧보다
// 		lprod_id가 큰 자료들을 출력하시오.

// 문제2) lprod_id값을 2개 입력 받아 두 값 중 작은 값부터 큰 값사이의
// 		 자료들을 출력하시오.


public class JdbcTest02 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		// DB 작업에 필요한 객체 변수 선언
		Connection conn = null;
		//Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2.DB 연결
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","WJH12","java");
			
			// 3-1. SQL문 작성
			// 
			System.out.println("검색할 Lprod_id를 입력하세요>>");
			
			int num = sc.nextInt();
			
			
			String sql = "select * from lprod"
						+" where Lprod_id > ? ";
			// 실제 사용시 데이터 양이 많기때문에 조건을 사용해 db에서 걸러서 가지고오는게 가장 좋은 방법이다.
			// 
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			// System.out.println("num"+num);
			//3-2. Statement 객체 생성 	 ==> Connection 객체 이용
			//  ==> SQL 문을 실행하고 결과를 얻어오는 객체 생성
			//stmt = conn.createStatement();
			
			// 3-3. SQL문을 DB서버로 보내서 결과를 얻어온다.
			//	(지금은 실행할 SQL문이 select문이기 때문에 
			//	결과가 ResultSet객체에 저장되어 반환된다.)
			
			rs = ps.executeQuery();
			
			// 4. 결과 처리하기 ==> 한 레코드씩 화면에 출력 하기
			System.out.println(" == 쿼리문 처리 결과  ==");
			
			// ResultSet객체에 저장된 데이터를 차례로 꺼내오려면
			// 반복문과 next()메서드를 이용한다.
						
			// rs.next() ==> ResultSet객체의 데이터를 가리키는
			// 포인터를 다음번째의 레코드로 이동 시키고 그 곳에
			// 데이터가 있으면 true 를 반환한다.
			
			while(rs.next()){
				System.out.println("Lprod_id : " + rs.getInt("lprod_id"));  // 따음표 안에 문자열은 대소문자 섞어 써도 괜찮다.
				System.out.println("Lprod_gu : " + rs.getString(2));		// 꺼내온 형태에 맞춰서 int / String 으로 변경해준다.
				System.out.println("Lprod_nm : " + rs.getString("LPROD_NM"));
				System.out.println("-----------------------------------------");	
				
			}
			
			System.out.println("출력 끝");
		}catch(SQLException e){
			e.printStackTrace();
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			
		}finally{
			// 5. 자원 반납하기
					if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
					if(ps!=null) try{ ps.close(); }catch(SQLException e ){};
					if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
						
			
		}

	}

}
