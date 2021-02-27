package H_java_210108;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

/*
문제문제) 이름, 주소, 전화번호를 멤버로 갖는 Phone클래스를 작성하고,
	Map을 이용하여 전화번호 정보를 관리하는 프로그램을 작성하시오.
	
	- 삭제, 검색기능은 '이름'을 입력 받아서 처리한다.
	
	(Map의 구조는 key값으로 '이름'을 사용하고,
	 value값으로는 'Phone클래스의 인스턴스'로 한다.)
	 
	 - 추가 조건 )
	 1) '6. 전화번호 정보 저장' 메뉴를 추가하고 구현한다.
	 	(저장파일명은 'd:/d_other/phoneData.dat' 로 한다.)
	 2) 프로그램이 시작할 때 저장된 파일이 있으면
	 	그 데이터를 읽어와 Map에 셋팅하여 사용한다.
	 3) 프로그램을 종료할 때 Map 의 데이터가 변경되거나
	 	추가 또는 삭제되면 저장한 후 종료되도록 한다.
	 
	 
	 아래 메뉴의 내용을 프로그램하시오.
	 
실행예시)
	---------------------
	 다음 메뉴를 선택하세요.
	 
	 1. 전화번호 등록
	 2. 전화번호 수정
	 3. 전화번호 삭제
	 4. 전화번호 검색
	 5. 전화번호 전체 출력
	 6. 전화번호 정보 저장
	 0. 프로그램 종료
	----------------------
	번호입력 >> 1
	
	새롭게 등록할 전화번호 정보를 입력하세요.
	이름 >> 홍길동
	전화번호 >> 010-1111-1111
	주소 >> 대전시 중구 대흥동
	
	'홍길동' 전화번호 등록 완료!!
	 
	---------------------
	 다음 메뉴를 선택하세요.
	 
	 1. 전화번호 등록
	 2. 전화번호 수정
	 3. 전화번호 삭제
	 4. 전화번호 검색
	 5. 전화번호 전체 출력
	 6. 전화번호 정보 저장
	 0. 프로그램 종료
	----------------------
	번호입력 >> 1
	
	새롭게 등록할 전화번호 정보를 입력하세요.
	이름 >> 홍길동
	
	'홍길동'은 이미 등록된 사람입니다.
	
	---------------------
	 다음 메뉴를 선택하세요.
	 
	 1. 전화번호 등록
	 2. 전화번호 수정
	 3. 전화번호 삭제
	 4. 전화번호 검색
	 5. 전화번호 전체 출력
	 6. 전화번호 정보 저장
	 0. 프로그램 종료
	----------------------
	번호입력 >> 5
	
	------------------------------------------------------------
	 번호         이름        전화번호        주소
	------------------------------------------------------------
	 1         홍길동    010-1111-1111  	대전시 중구 대흥동
	 ~~~~
	 ~~~~
	------------------------------------------------------------
	출력 완료... 
	
	---------------------
	 다음 메뉴를 선택하세요.
	 
	 1. 전화번호 등록
	 2. 전화번호 수정
	 3. 전화번호 삭제
	 4. 전화번호 검색
	 5. 전화번호 전체 출력
	 6. 전화번호 정보 저장
	 0. 프로그램 종료
	----------------------
	번호입력 >> 0
	
	 프로그램을 종료합니다.
*/


public class PhoneBookTest2 {

	
		HashMap<String, Phone> phoneBookMap;
		Scanner scan;
		
		private boolean dataChange;
		
		
		// 생성자 생성
		public PhoneBookTest2() {
			phoneBookMap = new HashMap<>();
			scan = new Scanner(System.in);
		}
		
		public static void main(String[] args) {
			new PhoneBookTest2().phoneBookStart();
			
	}

		private void phoneBookStart() {
			readPhoneData();
			System.out.println("++++++++++++++++++++++++++++");
			System.out.println("               전화번호 관리 프로그램           ");
			System.out.println("++++++++++++++++++++++++++++");
			System.out.println();
			
			while(true) {   // 메서드를 각각 만들어 호출 해준다.
				int choice = displayMenu();
				switch(choice) {
				case 1 :	//등록
					insert();
					break;
				case 2 :	// 수정
					update();
					break;
				case 3 :	// 삭제
					delete();
					break;
				case 4 :	// 검색
					 search();
					break;
				case 5 :	// 전체 출력
					displayAll();
					break;
				case 6 :	//전화번호 저장 
					savePhoneData();
					break;
				case 0 :	// 종료
					if(dataChange == true){
						savePhoneData();
					}
					
					System.out.println("프로그램을 종료합니다.");
					return;  //System.exit(0); 으로 써줘도 됨.
				default :
					System.out.println("번호를 잘못 입력했습니다.");
					System.out.println("다시입력해주세요.");
						
				
				}
				
			}
		}
		
		
		/*//변경 내용 확인
		private void dataChange() {*/
			
								
			
			
		
		//전화번호 불러오기
		private void readPhoneData() {
			try {
						
			ObjectInputStream ois = new ObjectInputStream(
					new BufferedInputStream(
						new FileInputStream("d:/d_other/phoneData.dat")
						)
					);
			
			Object obj;
			
			try{
				System.out.println("객체 읽기 작업 시작.");
				while((obj=ois.readObject())!=null) {
					Phone p = (Phone)obj;
					phoneBookMap.put(p.getName(), p);
				}
			} catch (EOFException e) {
				System.out.println("객체 읽기 작업 끝.");
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println("test1");
				
			}finally {
				ois.close();
				System.out.println("test2");
			}
			} catch (IOException e) {
				// TODO: handle exception
				System.out.println("test3");
			}
			}
		
		
		// 전화번호 정보 저장
		private void savePhoneData() {
			Set<String> keySet = phoneBookMap.keySet();
			//System.out.println(keySet);
			
			try {
				// 객체를 파일에 저장하기
				FileOutputStream fout = new FileOutputStream("d:/d_other/phoneData.dat");
				BufferedOutputStream bos = new BufferedOutputStream(fout);
				ObjectOutputStream oos = new ObjectOutputStream(bos);
				
				// 쓰기 작업
				System.out.println("객체 저장하기 시작.");
				for(String key : keySet) {
					Phone p = phoneBookMap.get(key);
					oos.writeObject(p);
				}
				System.out.println("객체 저장하기 끝.");
				dataChange = false;
				oos.close();
			} catch (IOException e) {
				// TODO: handle exception
			}
			
		}

		// 전화번호 정보를 검색하는 메서드
		private void search() {
			System.out.println("----------------------------");
			System.out.println("검색할 전화번호 정보를 입력하세요.");
			System.out.print("이름>>");
			String name = scan.next(); 
			
			//이미 등록된 사람인지 검사
			if(!phoneBookMap.containsKey(name)) {  //!phoneBookMap.containsKey(name) : key 값으로 이름이 없는경우
				System.out.println(name + "씨는 등록되지 않은 사람입니다.");
				return;
			}
		
		Phone p = phoneBookMap.get(name);
		System.out.println(" 검 색 결 과 ");
		System.out.println("----------------------------");
		System.out.println(name + "씨 전화번호 정보");
		System.out.println("----------------------------");
		System.out.println("이름 :" + p.getName());
		System.out.println("전화번호 :" + p.getTel());
		System.out.println("주소 :" + p.getAddr());
		System.out.println("----------------------------");


		
		
		}
		// 전화번호 정보를 삭제하는 메서드
		private void delete() {
			System.out.println("----------------------------");
			System.out.println("삭제할 전화번호 정보를 입력하세요.");
			System.out.print("이름>>");
			String name = scan.next(); 
			
			//이미 등록된 사람인지 검사
			if(!phoneBookMap.containsKey(name)) {  //!phoneBookMap.containsKey(name) : key 값으로 이름이 없는경우
				System.out.println(name + "씨는 등록되지 않은 사람입니다.");
				return;
				}
			phoneBookMap.remove(name);
			System.out.println(name + "님 정보를 삭제했습니다.");
			dataChange = true;
			}
		
				
				
				
		// 전화번호 정보를 수정하는 메서드
		private void update() {
			System.out.println();
			System.out.println("수정할 전화번호 정보를 입력하세요.");
			System.out.println("이름>>");
			String name = scan.next();
			
			//이미 등록된 사람인지 검사
			if(!phoneBookMap.containsKey(name)) {  //!phoneBookMap.containsKey(name) : key 값으로 이름이 없는경우
				System.out.println(name + "씨는 등록되지 않은 사람입니다.");
				return;
			}
			System.out.println("새로운 전화번호>>");
			String newTel = scan.next();
			
			scan.nextLine();
			// 입력 버퍼 비우기 (스페이스바 나 텝, 엔터가 위에 입력 되어있으면 주소입력에 적용되서 아래로 바로 넘어가기 때문에
			// scan.nextLine(); 를 써서 입력 버퍼를 비워준다.
			System.out.println("새로운 주소>>");
			String newAddr = scan.nextLine();
			
			phoneBookMap.put(name, new Phone(name, newAddr, newTel));
			
			System.out.println(name + "씨 전화번호 정보를 수정했습니다.");
			dataChange = true;
		}
		
		// 전체 전화번호 정보를 출력하는 메서드
		private void displayAll() {
			System.out.println();
			Set<String> keySet = phoneBookMap.keySet();   // 이름이 키값이고 String 이니까 제네릭을 String 으로
			
			System.out.println("----------------------------");
			System.out.println("\t번호\t이름\t전화번호\t주소");
			System.out.println("----------------------------");
			if(keySet.size()==0) {
				System.out.println("출력할 데이터가 하나도 없습니다.");
			}else {
				int cnt = 0;
				for(String key : keySet) {
					cnt++;
					Phone p= phoneBookMap.get(key);
					String tel = p.getTel(); // 폰 객체에서 전화번호 가져오기
					String addr = p.getAddr();
					System.out.println("\t"+cnt + "\t" + key + "\t" + tel + "\t" + addr);
					
				}
			}
			System.out.println("--------------------------------------");
			System.out.println("출력 끝...");
			
			
			
			
		}
	
		
		
		// 새로운 전화번호 정보를 등록하는 메서드
		private void insert() {
			System.out.println();
			
			System.out.println("----------------------------");
			System.out.println("새롭게 등록할 전화번호 정보를 입력하세요.");
			System.out.print("이름>>");
			String name = scan.next(); 
			
			// 이미 등록된 사람인지 검사한다. 이름이 겹치지 않게 하기 위한것
			if(phoneBookMap.containsKey(name)) {  //put set 을 안했는데 어떻게 맵에 들어가지???
				/*if(phoneBookMap.containsKey(name))  : name 이라는 키 값에 정보가 있는지 확인. true, false 로 나타남*/
				System.out.println(name + "씨는 이미 등록된 사람입니다.");
				return;
			}
			System.out.println("전화번호>>");
			String tel = scan.next();
			
			scan.nextLine();
			// 입력 버퍼 비우기 (스페이스바 나 텝, 엔터가 위에 입력 되어있으면 주소입력에 적용되서 아래로 바로 넘어가기 때문에
			// scan.nextLine(); 를 써서 입력 버퍼를 비워준다.
			// nextLine() 과 nextInt() or next()  다른 것들을 같이 사용할때 쓴다.
			
			System.out.println("주소>>");
			String addr = scan.nextLine();
			
			Phone p = new Phone(name, addr, tel);
			phoneBookMap.put(name, p);
	//== 	phoneBookMap.put(name, new Phone(name, addr, tel));  
			System.out.println(name + "씨 전화번호 등록 완료!!");
			dataChange = true;
		
			
			/*
			 * next(), nextInt(), nextDouble() 등등
			 * ==> 사이띄기, Tab키, Enter 키를 구분 문자로 분리해서
			 * 		분리된 자료만 읽어간다.
			 * 
			 * nextLine() ==> 한 줄 단위로 입력한다.
			 * 	즉, 자료를 입력하고 Enter키를 누르면 Enter키까지 읽어간다.
			 *
			 * Scanner 객체는 입력 버퍼에 자료가 남아 있으면 새로 입력 받지 않고
			 * 입력 버퍼에 있는 값을 가져간다.
			 *
			 */
			
		}

		// 메뉴를 출력하고 작업 번호를 입력받아 반환하는 메서드
		private int displayMenu() {
			
			System.out.println("----------------------------");
			System.out.println("다음 메뉴를 선택하세요.");
			System.out.println("----------------------------");
			System.out.println("1. 전화번호 등록");
			System.out.println("2. 전화번호 수정");
			System.out.println("3. 전화번호 삭제");
			System.out.println("4. 전화번호 검색");
			System.out.println("5. 전화번호 전체 출력");
			System.out.println("6. 전화번호 정보 저장");
			System.out.println("0. 프로그램 종료");
			System.out.println("----------------------------");
			System.out.print("번호입력>>");
			int num = scan.nextInt();
			return num;
		}
}

// 이름, 주소, 전화번호
class Phone implements Serializable {
	
	private static final long serialVersionUID = -3821026650517125718L;
	private String name;
	private String addr;
	private String tel;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Phone(String name, String addr, String tel) {
		super();
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}

}