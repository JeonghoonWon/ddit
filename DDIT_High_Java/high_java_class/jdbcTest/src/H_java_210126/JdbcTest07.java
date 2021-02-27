package H_java_210126;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import kr.or.ddit.util.DBUtil;

/*
 	- 회원을 관리하는 프로그램을 작성하시오.
 	(오라클 DB의 MYMEMBER 테이블 이용)
 	
 	- 아래 메뉴의 기능을 모두 구현하시오(CRUD 구현하기 연습)
 	CRUD는 대부분의 컴퓨터 소프트웨어가 가지는 기본적인 데이터 처리 기능인
  	Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말이다.
  
  	메뉴예시 )
  	-- 작업 선택 --
  	1. 자료 추가
  	2. 자료 삭제
  	3. 자료 수정
  	4. 전체 자료 출력
  	0. 작업 끝
  	-------------
  	작업 선택>>
 */
public class JdbcTest07 {
	Scanner sc = new Scanner(System.in);

	// db 연결 객체
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	// 생성자
	public JdbcTest07(){
		conn = DBUtil.getConnection();
		
	}
	
	public static void main(String[] args) {
		JdbcTest07 jdbc = new JdbcTest07();
		
				
				while(true) {
					jdbc.Start();
					
				}
				
			
			
	}

	private void Start() {
		System.out.println("--작업선택--");
		System.out.println("1. 자료추가");
		System.out.println("2. 자료삭제");
		System.out.println("3. 자료수정");
		System.out.println("4. 전체 자료 추력");
		System.out.println("0. 작업 끝");
		System.out.println("----------");
		System.out.println("작업 선택>>");
		int input = sc.nextInt();
		
	
			switch(input) {
			
			case 1 :	//자료 추가
					create();				
				break;
			case 2 :	//자료 삭제
					delete();
				break;
			case 3 :	//자료 수정
					update();
				break;
			case 4 :	//전체 자료 출력
					read();
				break;
			case 0 :	// 작업 끝
				System.out.println("프로그램을 종료합니다.");
				System.exit(0);
				break;
			}
		
	}
	//전체 자료 출력
	private void read() {
		
		String sql = "select * from mymember";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println("===출력 결과===");
			
			while(rs.next()){
				System.out.println("아이디 : " + rs.getString("mem_id"));
				System.out.println("이름 : " + rs.getString("mem_name"));
				System.out.println("전화번호 : " + rs.getString("mem_tel"));
				System.out.println("주소 : " + rs.getString("mem_addr"));
				
				System.out.println("---------------------------------");
				
			}
			
			System.out.println("===출력 완료===");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
			if(stmt!=null) try{ stmt.close(); }catch(SQLException e ){};
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
			if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
			
		}
			
		
		
		
		
		
	}

	// 삭제
	private void delete() {
		try {
			
			String Id="";
			int count = 0;
			
			do{
			System.out.println("삭제할 아이디를 입력하세요>>");
			Id = sc.next();
			
			String sql1 =   "select count(*) cnt from mymember where mem_id= ? ";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, Id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("cnt");
			}
			
			if(count != 1){
				System.out.println("아이디가 없습니다. 다시입력해주세요.");
			continue;
			}
			if(count == 1){
				
				String sql2 = "delete from mymember where mem_id = ?";
				
				pstmt = conn.prepareStatement(sql2);
				
				
			
				pstmt.setString(1, Id);
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt>0){
					System.out.println("삭제 성공");
				}else {
					System.out.println("삭제 실패");
					
				}
			
			}
			
		}while(count!=1);
															
		
			
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				if(stmt!=null) try{ stmt.close(); }catch(SQLException e ){};
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
				
			}
		
		
		
	}
		
	

	//수정
	private void update() {
		
		try {
				
			String Id="";
			int count = 0;
			
			do{
			System.out.println("수정할 아이디를 입력하세요>>");
			Id = sc.next();
			System.out.println(Id);
			String sql1 =   "select count(*) cnt from mymember where mem_id= ? ";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, Id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("cnt");
			}
			
			if(count != 1){
				System.out.println("아이디가 없습니다. 다시입력해주세요.");
			continue;
			}
			if(count == 1){
				System.out.println("수정할 이름을 입력하세요>>");
				String Name = sc.next();
				System.out.println("수정할 전화번호를 입력하세요>>");
				String Num = sc.next();
				System.out.println("수정할 주소를 입력하세요>>");
				String addr = sc.next();
				
				String sql2 = "update mymember set mem_name =?, mem_tel=?, mem_addr=? where mem_id = ? ";
				
				pstmt = conn.prepareStatement(sql2);
				
				
				pstmt.setString(1, Name);
				pstmt.setString(2, Num);
				pstmt.setString(3, addr);
				pstmt.setString(4, Id);
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt>0){
					System.out.println("수정 성공");
				}else {
					System.out.println("수정 실패");
					
				}
			
			}
			
		}while(count!=1);
															
		
			
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				if(stmt!=null) try{ stmt.close(); }catch(SQLException e ){};
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
				
			}
		
		
		
	}

	private void create() {
		
		try {
			
		
		String Id="";
		int count = 0;
		
		do{
		System.out.println("추가할 사람의 아이디를 입력하세요>>");
		Id = sc.next();
		
		String sql1 =   "select count(*) cnt from mymember where mem_id= ? ";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, Id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			count = rs.getInt("cnt");
			System.out.println("test1");
		}
		if(count == 1){
			System.out.println("입력하신 아이디:"+ Id + "는 이미 등록된 아이디 입니다.");
			System.out.println("test2");
		}
		
	}while(count==1);
		System.out.println("test3");											
		System.out.println("추가할 사람의 이름을 입력하세요>>");
		String Name = sc.next();
		System.out.println("추가할 사람의 전화번호를 입력하세요>>");
		String Num = sc.next();
		System.out.println("추가할 사람의 주소를 입력하세요>>");
		String addr = sc.next();
		
		String sql2 = "insert into mymember (mem_id, mem_name, mem_tel, mem_addr) values(?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, Id);
		pstmt.setString(2, Name);
		pstmt.setString(3, Num);
		pstmt.setString(4, addr);
		
		int cnt = pstmt.executeUpdate();
		
		if(cnt>0){
			System.out.println("등록 성공");
		}else {
			System.out.println("등록 실패");
			
		}
		
		} catch (SQLException e) {
			// TODO: handle exception
		}finally{
			if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
			if(stmt!=null) try{ stmt.close(); }catch(SQLException e ){};
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
			if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
			
		}
		
	}


}
