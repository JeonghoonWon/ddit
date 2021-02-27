package kr.or.ddit.basic;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
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



public class PhoneBookTest {

	
		HashMap<String, Phone> phoneBookMap;
		Scanner scan;
		
		// 생성자 생성
		public PhoneBookTest() {
			phoneBookMap = new HashMap<>();
			scan = new Scanner(System.in);
		}
		
		public static void main(String[] args) {
			new PhoneBookTest().phoneBookStart();
			
		
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
				case 6 :	// 전화번호 저장
					savePhoneData();
					break;					
				case 0 :	// 종료
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
				default :
					System.out.println("번호를 잘못 입력했습니다.");
					System.out.println("다시입력해주세요.");
						
				
				}
				
			}
		}
		
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
					System.out.println(keySet);
					
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
			if(!phoneBookMap.containsKey(name)) {  
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
			if(!phoneBookMap.containsKey(name)) {  
				System.out.println(name + "씨는 등록되지 않은 사람입니다.");
				return;
				}
			}
		
				
				
				
		// 전화번호 정보를 수정하는 메서드
		private void update() {
			System.out.println();
			System.out.println("수정할 전화번호 정보를 입력하세요.");
			System.out.println("이름>>");
			String name = scan.next();
			
			//이미 등록된 사람인지 검사
			if(!phoneBookMap.containsKey(name)) { 
				System.out.println(name + "씨는 등록되지 않은 사람입니다.");
				return;
			}
			System.out.println("새로운 전화번호>>");
			String newTel = scan.next();
			
			scan.nextLine();
			
			System.out.println("새로운 주소>>");
			String newAddr = scan.nextLine();
			
			phoneBookMap.put(name, new Phone(name, newAddr, newTel));
			
			System.out.println(name + "씨 전화번호 정보를 수정했습니다.");
		}
		
		// 전체 전화번호 정보를 출력하는 메서드
		private void displayAll() {
			System.out.println();
			Set<String> keySet = phoneBookMap.keySet();   
			
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
					System.out.println(cnt + "\t" + key + "\t" + tel + "\t" + addr);
					
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
			if(phoneBookMap.containsKey(name)) {  
			
				System.out.println(name + "씨는 이미 등록된 사람입니다.");
				return;
			}
			System.out.println("전화번호>>");
			String tel = scan.next();
			
			scan.nextLine();
			
			System.out.println("주소>>");
			String addr = scan.nextLine();
			
			Phone p = new Phone(name, addr, tel);
			phoneBookMap.put(name, p);
	
			System.out.println(name + "님 전화번호 등록 완료");
		
			
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
			System.out.println("0. 프로그램 종료");
			System.out.println("----------------------------");
			System.out.print("번호입력>>");
			int num = scan.nextInt();
			return num;
		}
}

// 이름, 주소, 전화번호 Phone 클래스 생성
class Phone implements Serializable{

	private static final long serialVersionUID = 5212671553148841438L;
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