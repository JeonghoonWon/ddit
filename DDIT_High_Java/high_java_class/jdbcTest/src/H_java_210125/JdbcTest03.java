package H_java_210125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

//문제2) lprod_id값을 2개 입력 받아 두 값 중 작은 값부터 큰 값사이의
// 자료들을 출력하시오.


public class JdbcTest03 {

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
				
				System.out.println("검색할 첫번째 Lprod_id를 입력하세요>>");
				
				int num1 = sc.nextInt();
				
				System.out.println("검색할 두번째 Lprod_id를 입력하세요>>");
				
				int num2 = sc.nextInt();
				
				
				String sql = "select * from lprod"
							+" where Lprod_id between ? and ? ";
							
				
				ps = conn.prepareStatement(sql);
				if(num1>num2) {
					ps.setInt(1, num2);
					ps.setInt(2, num1);
					
				}else {
					ps.setInt(1, num1);
					ps.setInt(2, num2);
				}
				
				
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
					System.out.println("Lprod_gu : " + rs.getString(2));
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
