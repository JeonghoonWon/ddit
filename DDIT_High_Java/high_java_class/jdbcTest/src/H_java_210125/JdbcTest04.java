package H_java_210125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

/*
 	문제) 사용자로부터 시, 군, 구 중 한가지를 입력 받아 
 		DB의 	Member테이블에서 회원의 주소에 입력한 값이 포함되는 데이터를 
 		아이디, 이름, 우편번호, 주소를 출력하시오.

 */



public class JdbcTest04 {

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
			
			System.out.println("검색할 시, 도 군 중 하나를 입력하세요>>");
			
			String addr = sc.nextLine();
			
			
			String sql = " select * from member "
					+ " where MEM_ADD1 like '%" +addr+"%'";
						
			
			ps = conn.prepareStatement(sql);
			
			
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
				System.out.println("MEM_ID : " + rs.getString("MEM_ID"));  // 따음표 안에 문자열은 대소문자 섞어 써도 괜찮다.
				System.out.println("MEM_NAME : " + rs.getString("MEM_NAME"));
				System.out.println("MEM_ZIP : " + rs.getString("MEM_ZIP"));
				System.out.println("MEM_ADD1 : " + rs.getString("MEM_ADD1"));
				System.out.println("MEM_ADD2 : " + rs.getString("MEM_ADD2"));
				
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
