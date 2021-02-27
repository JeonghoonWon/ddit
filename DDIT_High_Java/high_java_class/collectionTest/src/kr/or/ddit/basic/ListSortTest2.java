package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class ListSortTest2 {

	public static void main(String[] args) {
		ArrayList<Member> memList = new ArrayList<>();
		
		memList.add(new Member(1,"홍길동", "010-1111-1111"));
		memList.add(new Member(5,"이순신", "010-2222-1111"));
		memList.add(new Member(10,"성춘향", "010-3333-1111"));
		memList.add(new Member(3,"강감찬", "010-4444-1111"));
		memList.add(new Member(6,"일지매", "010-5555-1111"));
		memList.add(new Member(2,"변학도", "010-6666-1111"));
		
		
		
		
	//	System.out.println("정렬 전...");
		for(Member mem : memList) {
			System.out.println(mem);
		}
//		System.out.println("-----------------------------------------------------");
		
		
		// 회원이름의 오름차순 정렬하기 (내부 정렬기준 이용)
		Collections.sort(memList);   // 정렬 기준을 만들어 줘야 sort에 컴파일 에러가 사라진다. 
		System.out.println();
		System.out.println("-----------------------------------------------------");
		
		System.out.println("정렬 전...");
		for(Member mem : memList) {
			System.out.println(mem);
		}
		System.out.println("-----------------------------------------------------");
		
		// 회원 번호의 내림차순으로 정렬하기 (외부 정렬기준으로..)
		 Collections.sort(memList, new SortNumDesc());
		 System.out.println("내림차순 정렬 후 ...");
		 for(Member num : memList) {
			 System.out.println(num);
		 }
		 System.out.println("-----------------------------------------------------");
	}

}

// Member 클래스의 회원이름의 오름차순 정렬이 되도록하는 내부 정렬 기준 구현하기
// ==> Comparable 인터페이스를 구현한다.

class Member implements Comparable<Member>{ // Comparable<클래스 이름> 
	private int num;
	private String name;
	private String tel;
	
	// 3개의 데이터를 초기화 하는 생성자를 만들어 줘야 한다. 생성자 만드는 단축키 : alt+shift+s 
	public Member(int num, String name, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.tel = tel;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "Member [num=" + num + ", name=" + name + ", tel=" + tel + "]";
	}
	
	public int compareTo(Member mem) { 
		// 회원 이름의 오름차순 정렬 기준 만들기
	return this.name.compareTo(mem.getName());   //this.name : 앞의 데이터  mem.getName() : 뒤의 데이터  / 두 데이터를 반환    
													 
		// 내림차순일 경우
	// return this.name.compareTo(mem.getName())*-1 ; // 반대값을 적용하고 싶으면 *-1 로 처리
	
	
	
	
	}	

}

// 회원 번호의 내림차순 정렬이 되도록하는 외부 정렬 기준 클래스 작성하기 
/*class Desc1 implements Comparator<Member> {

	
	
	
	public int compare(Member num1, Member num2) {
		
		Integer No1 = num1.getNum();
		Integer No2 = num2.getNum();
				
		if(No1.compareTo(No2) > 0) {
			return -1;
		}else if(No1.compareTo(No2) < 0) {
			return 1;
		}else {
			return 0;
		
		}*/
	
	// 선생님 하신것
	class SortNumDesc implements Comparator<Member> {

		@Override
		public int compare(Member num1, Member num2) {
			
		/*	if(num1.getNum() > num2.getNum()) {
				return -1;
			} else if(num1.getNum() < num2.getNum()) {
				return 1;
			} else {
				return 0;
			}*/
		
	// Wrapper 클래스를 이용하는 방법1
	return new Integer(num1.getNum()).compareTo(num2.getNum());
	
		
	// Wrapper 클래스를 이용하는 방법1	
//	return Integer.compare(num1.getNum(),num2.getNum())	*-1;
		}
	
}

