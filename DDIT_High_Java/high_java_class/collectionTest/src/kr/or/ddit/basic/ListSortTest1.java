package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class ListSortTest1 {

	
		
		/*
		  - 정렬과 관련된 interface 는 Comparable, Comparator 이렇게 두가지가 있다.
		 
		  - Comparable 은 Collection 에 추가되는 데이터 자체에 정렬기준을
		  	넣고 싶을 때 구현하는 interface 이고, 
		  - Comparator 는 외부에 별도로 정렬 기준을 구현하고 싶을 때 구현
		   	(외부 정렬 기준) 하는 interface이다.
		  
		  - Comparable 에서는 compareTo() 메서드를 재정의 하고 
		  	Comparator 에서는 compare() 메서드를 재정의 해야 한다.
		  	
		  - String 클래스, Wrapper클래스, Date 클래스, File 클래스에는 
		  내부 정렬 기준이 구현되어 있다.
		  (내부 정렬 기준은 보통 오름차순으로 처리되도록 구현되어 있다.)
		  
		 */
	
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		
		list.add("일지매");
		list.add("홍길동");
		list.add("성춘향");
		list.add("변학도");
		list.add("이순신");
		
		System.out.println("정렬 전 : " + list);
		
		//	Collection 의 정렬은 Collections.sort() 메서드를 이용한다.
		// 형식1)  Collections.sort(리스트);
		//		==> 내부 정렬 기준이 구현되어 있는 데이터 일 경우에 사용가능
		// 형식2)  Collections.sort(리스트, 외부정렬기준 객체의 인스턴스);
		//		==> 외부 정렬 기준에 맞게 정렬한다.
		
		Collections.sort(list);
		// String 계열의 클래스는 내부정렬 기준이 구현되어있으며 오름차순 순으로 정렬
		System.out.println("정렬 후 : " + list);  // 오름차순 : 앞에가 가장 작고 점점점점 커림
											   // 내림차순 : 앞에가 가장 크고 점점점점 작아짐
		
		 Collections.shuffle(list); // shuffle : 데이터 섞기
		 System.out.println("자료 섞기 후 : " + list);
		 
		
		 // 외부 정렬 기준으로 정렬하기 
		 
//		 Desc dd = new Desc();
//		 Collections.sort(list,dd);
		 
		 Collections.sort(list, new Desc()); // 변수를 사용하지않고 바로 객체 형식으로 쓰는 걸 많이 사용함.
		 System.out.println("내림차순 정렬 후 : " + list);
	} 

}


// 정렬 방식을 외부에서 정해주는 class 작성하기
// 즉, 외부 정렬 기준 클래스 작성하기 ==> Comparator 인터페이스를 구현
class Desc implements Comparator<String> {
	// compare() 메서드를 이용해서 정렬 기준을 정해준다.
	
	// compare() 메서드의 반환값의 역할
	// 0 은 두 값이 같다. 비교대상 1,2의 값이 같으면 0이다.
	// 반환값이 양수이면 앞, 뒤의 순서를 바꾼다.
	// 반환값이 음수이면 앞, 뒤의 순서를 바꾸지 않는다.
	
	// 예) 오름차순일 경우 ==> 앞의 값이 크면 양수, 같으면 0
	//					 앞의 값이 작으면 음수를 반환하도록 구현한다.
	@Override
	public int compare(String str1, String str2) { // 리스트에 있는 근접한 데이터가 처리가 되는것  String str1 : 비교대상 1, String str2 : 비교대상 2  
		// 내림차순으로 정렬되도록 구현하기
		if(str1.compareTo(str2) > 0) {
			return -1; // 음수로 반환 (기본적으로 -1 을 사용함)
		}else if(str1.compareTo(str2)<0) {
			return 1;
		}else{
			return 0;
		}

	}
}