package H_java_210126;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import kr.or.ddit.util.DBUtil;
import kr.or.ddit.util.DBUtil2;

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

public class JdbcTest07_Sem {
	Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		new JdbcTest07_Sem().memberStart();

	}

	private void memberStart() {
		while(true) {
			int choice = displayMenu();
			
			switch(choice) {
				case 1 :		// 추가
					insertMember();
					break;		
				case 2 :		// 삭제
					deleteMember();
					break;
				case 3 :		// 수정
					updateMember();
					break;
				case 4 :		// 전체 자료 출력
					readMember();
					break;
				case 5 : 		//원하는 것만 수정하도록
					updateMember2();
					break;
				case 0 :		// 작업 끝
					System.out.println("프로그램을 종료합니다.");
					return;
				default :
					System.out.println("번호를 잘못 입력했습니다.");
					System.out.println("다시 입력해주세요.");
						
			}
		}
	}

		// 회원 정보를 수정하는 메서드(원하는 컬럼 한가지만 수정)
		private void updateMember2() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			System.out.println();
			System.out.println("수정할 회원 정보를 입력하세요.");
			System.out.println("회원ID >>");
			String memId = sc.next();
			
			int count = getMemberCount(memId);
			
			if(count == 0){		// 없는 회원일 경우
				System.out.println(memId + "회원은 존재하지않습니다.");
				System.out.println("수정 작업을 마칩니다.");
				return;
			}
					
			try {
				
				System.out.println("수정을 원하는 부분을 입력하세요.(이름, 전화번호, 주소)");
				conn = DBUtil.getConnection();
				
				String input = sc.next();
				
				if(input.equals("이름")){
					
					System.out.println("새로운 회원 이름 >>");
					String memName = sc.next();
					
					String sql = "update mymember set mem_name = ? where mem_id = ?";
									
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memName);
					pstmt.setString(2, memId);
					
					int cnt = pstmt.executeUpdate();
					
					if(cnt>0){
						System.out.println(memId + "회원의 이름을 변경하였습니다.");
					}else{
						System.out.println("회원정보 변경 실패");
						
					}
				}
					if(input.equals("전화번호")){
					
					System.out.println("새로운 회원 전화번호 >>");
					String memTel = sc.next();
					
					String sql = "update mymember set mem_tel = ? where mem_id = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memTel);
					pstmt.setString(2, memId);
					
					int cnt = pstmt.executeUpdate();
					
					if(cnt>0){
						System.out.println(memId + "회원의 전화번호를 변경하였습니다.");
					}else{
						System.out.println("회원정보 변경 실패");
						
					}
				}
					if(input.equals("주소")){
						
						System.out.println("새로운 회원 주소 >>");
						String memAddr = sc.next();
						
						String sql = "update mymember set mem_addr = ? where mem_id = ?";
					
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, memAddr);
						pstmt.setString(2, memId);
						
						int cnt = pstmt.executeUpdate();
						
						if(cnt>0){
							System.out.println(memId + "회원의 주소를 변경하였습니다.");
						}else{
							System.out.println("회원정보 변경 실패");
							
						}
					}
					
									
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				
				
			}
			
			
		}
		
		
	

		// 메뉴 출력 및 작업번호를 입력 받아 반환하는 메서드
		private int displayMenu() {
			System.out.println("--작업선택--");
			System.out.println("1. 자료추가");
			System.out.println("2. 자료삭제");
			System.out.println("3. 자료수정");
			System.out.println("4. 전체 자료 추력");
			System.out.println("5. 자료 수정 2");
			System.out.println("0. 작업 끝");
			System.out.println("----------");
			System.out.print("작업 선택>>");
			int num = sc.nextInt();
			
			return num;
		}
		
		// 회원 정보를 수정하는 메서드
		private void updateMember() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			System.out.println();
			System.out.println("수정할 회원 정보를 입력하세요.");
			System.out.println("회원ID >>");
			String memId = sc.next();
			
			int count = getMemberCount(memId);
			
			if(count == 0){		// 없는 회원일 경우
				System.out.println(memId + "회원은 존재하지않습니다.");
				System.out.println("수정 작업을 마칩니다.");
				return;
			}
			
			System.out.println("새로운 회원 이름 >>");
			String memName = sc.next();
			
			System.out.println("새로운 전화번호 >>");
			String memTel = sc.next();
			
			// 버퍼 비우기
			sc.nextLine();
			System.out.println("새로운 주소 >>");
			String memAddr = sc.nextLine();
			
			try {
				conn = DBUtil.getConnection();
				
				String sql = "update mymember set mem_name = ?, mem_tel = ?, mem_addr = ? where mem_id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memName);
				pstmt.setString(2, memTel);
				pstmt.setString(3, memAddr);
				pstmt.setString(4, memId);
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt>0){
					System.out.println(memId + "회원의 정보를 변경하였습니다.");
				}else{
					System.out.println("회원정보 변경 실패");
					
				}
						
						
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				
				
			}
			
			
		}
		
		
		//회원 정보를 삭제하는 메서드
		private void deleteMember() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			System.out.println();
			System.out.println("삭제할 회원 정보를 입력하세요.");
			System.out.println("삭제할 회원ID >>");
			String memId = sc.next();
			
			try {
				conn = DBUtil.getConnection();
				
				String sql = "delete from mymember where mem_id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt > 0) {
					System.out.println(memId + "회원 정보 삭제 성공");
				}else{
					System.out.println(memId + "회원은 존재하지 않거나 삭제 할 수 없습니다.");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				
			}
			
		}
		
		
		
		   //전체 회원 정보를 출력하는 메소드
		   private void readMember(){
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs =null;
			   	    
		      System.out.println();
		      System.out.println("----------------------------------");
		      System.out.println("ID     이름               전화번호            주소");
		      System.out.println("----------------------------------");
		      
		      try {
		         conn = DBUtil2.getConnection();
		         String sql = "select * from mymember";
		         stmt = conn.createStatement();
		         
		         rs = stmt.executeQuery(sql);
		         
		         while(rs.next()){
		            String memId = rs.getString("mem_id");
		            String memName = rs.getString("mem_name");
		            String memTel = rs.getString("mem_tel");
		            String memAddr = rs.getString("mem_addr");
		            
		            System.out.println(memId + "\t"+ memName+ "\t"+ memTel+ "\t"+memAddr);
		         }
		         System.out.println("----------------------------------------------------");
		         System.out.println("출력끝");
		         
		      } catch (SQLException e) {
		         // TODO: handle exception
		      }finally {
		         if(rs!=null) try{rs.close();}catch(SQLException e){};
		         if(stmt!=null) try{stmt.close();}catch(SQLException e){};
		         if(conn!=null) try{conn.close();}catch(SQLException e){};
		      }
		      
		   }
		   

		// 회원 정보를 추가하는 메서드
		private void insertMember() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			System.out.println();
			System.out.println("추가할 회원 정보를 입력하세요.");
			
			int count = 0;
			String memId;		// 입력한 회원ID가 저장될 변수
			do{
			System.out.print("회원ID >>");
			 memId = sc.next();
			
			count = getMemberCount(memId);
			if(count > 0) {
				System.out.println("회원ID가" + memId + "인 회원은 이미 존재 합니다.");
				System.out.println("다른 ID로 다시 입력하세요.");
				System.out.println();
				
			}
			
			}while(count > 0);
			
			System.out.print("회원이름 >>");
			String memName = sc.next();
			
			System.out.print("전화번호 >>");
			String memTel = sc.next();
			
			sc.nextLine();
			System.out.print("주소>>");
			String memAddr = sc.nextLine();
			
			
			
			
			try {
					conn = DBUtil.getConnection();
					
					String sql = "insert into mymember (mem_id, mem_name, mem_tel, mem_addr) values (?, ?, ?, ?)";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memId);
					pstmt.setString(2, memName);
					pstmt.setString(3, memTel);
					pstmt.setString(4, memAddr);
					
					int cnt = pstmt.executeUpdate();
					
					if(cnt>0) {
						System.out.println(memId + "회원 추가 성공");
					}else{
						System.out.println(memId + "회원 추가 실패");
					}
			
										
			} catch (SQLException e) {
				e.printStackTrace();
			
			} finally {
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
				
			}
			
		}
		
		// 회원ID를 인수로 받아서 해당 회원ID의 개수를 반환하는 메서드
		private int getMemberCount(String memId){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			
			int count = 0; // 회원 ID 개수가 저장될 변수
			
			try {
				conn = DBUtil.getConnection();
				
				String sql = "select count(*) cnt from mymember where mem_id = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memId);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt("cnt");
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e ){};
				if(rs!=null) try{ rs.close(); }catch(SQLException e ){};
				if(conn!=null) try{ conn.close(); }catch(SQLException e ){};
					
			}
			return count;
					
			
		}
		
		
}
