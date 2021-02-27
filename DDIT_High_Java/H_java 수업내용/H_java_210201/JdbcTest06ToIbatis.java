package H_java_210201;

import java.io.Reader;
import java.nio.charset.Charset;
import java.util.Scanner;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// jdbcTest 프로젝트에 있는 'jdbcTest06.java' 의 처리방법을
// ibatis를 이용하여 처리하는 것으로 변경하시오.

// 쿼리문이 저장될 xml문서 이름은 'jdbc06.xml'로 한다.

/*

LPROD테이블에 새로운 데이터를추가하시오.

조건 ) lprod_gu와 lprod_nm은 직접 입력받아서 처리하고,
lprod_id는 현재의 lprod_id중 제일 큰 값보다 1 증가된 값으로 한다.
그리고, 입력받은 lprod_gu 가 이미 등록되어 있으면 다시 입력받아서 처리한다.

*/


public class JdbcTest06ToIbatis {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		try {
			// 1-1. 문자 인코딩 케릭터셋 설정
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			
			// 1-2. 환경 설정 파일 읽어오기
			Reader rd = Resources.getResourceAsReader("sqlMapConfig.xml");
			
			// 1-3. 위에서 읽어온 Reader객체를 이용하여 실제 환경 설정을
			//		진행한 후 SQL문을 호출해서 실행할 객체를 생성한다.
			
			SqlMapClient smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			// smc : 쿼리문을 읽어와 실행할 객체
			
			rd.close();
			
			//-----------------------------------------------------------
			// insert 작업 실행
			System.out.println("insert작업 시작>>>");
			
			// 중복 확인
			while(true) { 
			System.out.print("lprod_gu 입력 >>");
			String lprodGu = sc.next();
			lprodGu = (lprodGu + "  ").substring(0,4);
			
			//int number = Integer.parseInt(변경할Object객체.toString());

			
			LprodVO lprodVo =(LprodVO) smc.queryForObject("jdbc06.getLprod",lprodGu);
			
			//System.out.println(lprodVo.getLprod_gu());
			
			if(lprodVo == null) {
				// id 숫자 넣기
				System.out.println("test1");
				
				LprodVO maxid =  (LprodVO) smc.queryForObject("jdbc06.getAllLprod");
				
				System.out.println(maxid.getLprod_id());
				
				System.out.print("lprod_nm 입력>>");
				String lprodNm = sc.next();
				
				LprodVO lvo = new LprodVO();
				
				lvo.setLprod_id(maxid.getLprod_id());
				lvo.setLprod_gu(lprodGu);
				lvo.setLprod_nm(lprodNm);
			
				Object obj = smc.insert("jdbc06.insertLprod",lvo);
				
				if(obj == null) {
					System.out.println("insert 성공");
					break;
				}else {
				System.out.println("insert 실패");
				}
				
			}else {
				System.out.println(lprodGu + "는 이미 있습니다.");
			}	
			
			
			}
			
			System.out.println("insert 종료");
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}