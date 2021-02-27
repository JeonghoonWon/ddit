package H_java_210108;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.Map;
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
public class PhoneBookTest3 {
	Map<String, Phone3> phoneBookMap3 = new HashMap<>();
	Scanner sc = new Scanner(System.in);
	
	// 생성자 생성
	public PhoneBookTest3() {
				// 이 안에선 인스턴스 변수를 초기화 하는게 좋다.
				
		// PhoneBookTest3 p = new PhoneBookTest3(); 
				// 클래스 초기화는 권장하지않는다.
				// 값을 공유해야 하는 클래스 변수가 객체 생성 시 마다 계속 초기화되기 때문에 
				// 클래스 변수를 생성자에서 초기화하는 것은 좋지 않다.
				
				
				// 생성자 사용 이유
				// 초기화에 여러줄의 코드가 필요할 때
				// 초기화에 파라미터가 필요할 때
	
		
		phoneBookMap3 = new HashMap<>();
		sc = new Scanner(System.in);
	}
	
	
	
	public static void main(String[] args) {
		new PhoneBookTest3().phoneBookStart();
		
		// TODO Auto-generated method stub
		/*
	 main 메서드함수 ==> java로 구현된 프로그램이 시작될 때 가장 먼저 실행되는 메서드
	 	java의 규칙
	 	
	 	"java 소스는 무조건 main 함수에서 부터 시작된다!!"
	 	
	 	public static void main(String[] args) {  }
	 	
	 	1. public : 접근에 제한이 없음
	 	2. static : java에서 '메모리에 고정된다. 변하지 않는다 라는 의미로 사용
	 				하지만 실제로는 '공유' 의 의미를 가지고 있음
	 	3. void : 반환형이 필요 없다.
	 	4. String[] args : 매개변수 
	 	 				   main 메서드를 실행하는데 필요한 값들이 있다면,
	 	 				   args변수를 통해서 main 메서드에 전달되는 것
	 	 				   args = arguments
	 	 				   
	 
	 
	 
	 
	 */
		

	}

	
	//public 클래스에서  매인 메서드에서 실행될 메서드들을 만들어준다.
	
	private void phoneBookStart() {
		readPhoneData();
		System.out.println("---------------------------");
		System.out.println("\t전화번호 관리 프로그램");
		System.out.println("---------------------------");
		System.out.println();
		
		while(true) { // 각 메서드를 만들어 호출해줌  등록, 수정, 삭제, 검색, 전체 출력, (전화번호 저장) , 종료
			int input = showInfo();
			switch(input){
			case 1 :
				insert(); // 등록
				break;
			case 2 :
				update(); 	//수정
				break;
			case 3 :
				delete();	// 삭제
				break;
			case 4 :
				search();	// 검색
				break;
			case 5 :
				print(); 	// 전체 줄력
				break;
			case 6 :
				saveData();		// 전화번호 저장
				break;
			case 0 :
				System.out.println("프로그램을 종료합니다.");
				System.exit(0);
			default : 
				System.out.println("번호를 잘못입력했습니다.");
				System.out.println("다시입력해주세요.");
				
		
			
			
			}
		}
		
		
	}
	
	// 전화번호 불러오기
	private void readPhoneData() {
		try {
			
			ObjectInputStream ois = new ObjectInputStream(
					new BufferedInputStream(
						new FileInputStream("d:/d_other/savePhonedata3.dat")
						)
					);
			
			Object obj;
			
			try{
				System.out.println("객체 읽기 작업 시작.");
				while((obj=ois.readObject())!=null) {
					Phone3 p = (Phone3)obj;
					phoneBookMap3.put(p.getName(), p);
				}
			} catch (EOFException e) {
				System.out.println("객체 읽기 작업 끝.");
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
				
				
			}finally {
				ois.close();
				
			}
			} catch (IOException e) {
				// TODO: handle exception
				
			}
			}



	// 전화번호 저장
	private void saveData() {
		Set<String> keySet = phoneBookMap3.keySet();
		//System.out.println(keySet);
		
		try {
			// 객체를 파일에 저장하기
			FileOutputStream fout = new FileOutputStream("d:/d_other/savePhonedata3.dat");
			BufferedOutputStream bos = new BufferedOutputStream(fout);
			ObjectOutputStream oos = new ObjectOutputStream(bos);
			
			// 쓰기 작업
			System.out.println("객체 저장하기 시작.");
			for(String key : keySet) {
				Phone3 p = phoneBookMap3.get(key);
				oos.writeObject(p);
			}
			System.out.println("객체 저장하기 끝.");
			
			oos.close();
		} catch (IOException e) {
			// TODO: handle exception
		}
		
	}



	// 전체출력
	private void print() {
	
	//Set<String> keySet = phoneBookMap3.keySet();
	
	System.out.println();
	System.out.println("---------------------------");
	System.out.println("번호\t이름\t전화번호\t주소");
	System.out.println("---------------------------");
	
	 
	if(phoneBookMap3.size() == 0) {
		System.out.println("출력할 데이터가 없습니다.");
	}
	int count = 0;
		
	for(String key : phoneBookMap3.keySet()){
		count++;
		Phone3 p = phoneBookMap3.get(key);
		String name = p.getName();
		String tel = p.getTel();
		String addr = p.getAddr();
		System.out.println(count+"\t"+ name +"\t" + tel + "\t" + addr);
	
	
			
		
	
	}
	
	}



	// 검색
	private void search() {
		System.out.println();
		System.out.println("검색할 사람을 입력하세요.");
		System.out.println("이름>>");
		String name = sc.next();
		
		if(!phoneBookMap3.containsKey(name)){
			System.out.println("일치하는 사람이 없습니다.");
			return;
		}
		
		//일치하는 사람이 있으면 불러오기
		Phone3 p = phoneBookMap3.get(name);
		System.out.println("검색결과");
		System.out.println("---------------------------");
		System.out.println(name + "님 검색결과");
		System.out.println("---------------------------");
		System.out.println("이름 : " + p.getName());
		System.out.println("전화번호 : "+ p.getTel());
		System.out.println("주소 : " + p.getAddr());
		System.out.println("---------------------------");
		
	}



	//삭제
	private void delete() {
	System.out.println();
	System.out.println("삭제할 전화번호 정보를 입력하세요.");
	System.out.println("이름>>");
	String name = sc.next();
	
	if(!phoneBookMap3.containsKey(name)){
		System.out.println("일치하는 이름이 없습니다.");
		return;
	}
	phoneBookMap3.remove(name);
	System.out.println(name + "님 정보를 삭제했습니다.");
		
	}



	//수정
	private void update() {
		System.out.println();
		System.out.println("수정할 전화번호 정보를 입력하세요.");
		System.out.println("이름>>");
		String name = sc.next();
		
		// 검사
		if(!phoneBookMap3.containsKey(name)){
			System.out.println("등록된 이름이 없습니다.");
			return;
		}
		
		System.out.println("새로운 전화번호>>");
		String tel = sc.next();
		
		System.out.println("새로운 주소>>");
		String addr = sc.next();
		
		phoneBookMap3.put(name,new Phone3(name, tel, addr));
		
		System.out.println(name + "님의 정보를 수정했습니다.");
	}


	// 등록
	private void insert() {
		// 이름 입력
		System.out.println("---------------------------");
		System.out.println("새롭게 등록할 전화번호 정보를 입력하세요.");
		System.out.println("이름>>");
		String name = sc.next();
		
		// 이름 중복 검사
		if(phoneBookMap3.containsKey(name)) {
			System.out.println(name + "은 이미 있는 사람 입니다.");
			System.out.println("다른 이름을 입력해주세요.");
			return;
		}
		// 전화번호
		System.out.println("전화번호>>");
		String tel = sc.next();
		
		// 주소
		System.out.println("주소>>");
		String addr = sc.next();
		
		Phone3 p = new Phone3(name,tel,addr);
		// key 값을 name 으로 갖는 map
		phoneBookMap3.put(name, p);
		System.out.println(name + "님 등록 완료");
		
		
		
	}



	private int showInfo() {
		
		System.out.println("---------------------------");
		System.out.println("다음 메뉴를 선택하세요.");
		System.out.println("---------------------------");
		System.out.println("1. 전화번호 등록");
		System.out.println("2. 전화번호 수정");
		System.out.println("3. 전화번호 삭제");
		System.out.println("4. 전화번호 검색");
		System.out.println("5. 전화번호 전체 출력");
		System.out.println("6. 전화번호 정보 저장");
		System.out.println("0. 프로그램 종료");
		System.out.println("----------------------------");
		System.out.print("번호입력>>");
		int num = sc.nextInt();
		return num;
	}
	
}




 // 이름, 주소, 전화번호를 멤버로 갖는 Phone클래스를 작성
class Phone3{
	//멤버 변수 // Phone은 name, addr, tel 이라는 문자열 타입을 인스턴스변수로 갖는 클래스 	
	String name;
	String addr;
	String tel;
	
	
	//생성자(Constructor)
	// ==> 인스턴스를 초기화 하는 메서드
	// 인스턴스(Instance) = 메모리에 생성된 클래스
	// 어떠한 클래스를 사용하고자 할때는
	// new 연산자를 사용해 메모리 상에 클래스를 생성(인스턴스화) 하고
	// 이 생성된 주소(인스턴스의 주소)를 리턴해 레퍼런스 변수에 저장.
	// 생성자 조건
	// 1. 생성자명은 클래스명과 같아야 함.
	// 2. 리턴타입 없어야 함.
	
	
	/* - 클래스와 같은 이름의 메서드
	 * - 인스턴스 변수를 초기화하기 위해 사용한다.
	 * - 클래스에 생성자는 반드시 하나 이상 존재해야 한다.
	 * - 직접 선언해주지 않으면 컴파일러가 기본 생성자를 만들어준다.
	 * - 생성자는 리턴타입이 없다.
	 */
	
	//출처: https://aljjabaegi.tistory.com/408 [알짜배기 프로그래머]
 
	public Phone3(String name, String addr, String tel) {
		super();  // extends Object 가 생략된 것.
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}
	// 수정 삭제 등록을 위해 get/set
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
	

	
	
	
}
