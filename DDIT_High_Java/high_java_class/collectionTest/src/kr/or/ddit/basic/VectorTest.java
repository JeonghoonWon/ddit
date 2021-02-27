package kr.or.ddit.basic;

import java.util.Vector;

public class VectorTest {

	public static void main(String[] args) {
		// 객체 생성
		Vector v1 = new Vector();
		
		System.out.println("처음 크기 :" + v1.size());
		
		// 데이터 추가 : add(추가할 데이터)
		// 반환값 : 추가 성공(true), 실패 (false)
		v1.add("aaaa");
		// 초창기 백터를 만들었을때 백터에 데이터를 아무거나 저장 할 수 있지만 데이터는 전부 객체형 이어야 한다.
		// "aaaa" 도 문자열/String 이기 때문에 저장 가능
		 v1.add(new Integer(1111));
		
		// Integer 형 객체 숫자 1111 을  저장
		v1.add(123); // ==> 오토박싱(기본자료형을 래퍼클래스형으로 변환)
					 // ==> 오토언박싱( 랩퍼클래스형 ==> 기본자료형으로 자동 변환)
		// 기본 자료형을 객체형으로 변환해주는것을 래퍼 클래스(Wrapper Class)라고 한다.
		// 기본 자료타입(primitive type)을 객체로 다루기 위해서 사용하는 클래스들을 래퍼 클래스(wrapper class)라고 합니다.
		v1.add('a');
		v1.add(true);
		boolean chk = v1.add(3.14);
		System.out.println("chk: " + chk);
		System.out.println("현재 크기 : " + v1.size());
		
		// 데이터 추가 : addElement(추가할 데이터)
		// ==> 이전 버전의 프로그램에서도 사용가능 하도록 하기 위해 남아 있는 메서드
		v1.addElement("CCC");
		
		System.out.println("v1 ==> " + v1.toString()); // 값을 집어넣어둔 순서대로 출력 된다.
		System.out.println("v1 ==> " + v1);
		
		// 데이터 추가 : add(index, 추가할 데이터)
		// ==> index 번째에 '추가할데이터'를 끼워 넣는다. (index는 0 부터 시작한다.)
		// ==> 반환값은 없다.
		
		v1.add(1,"kkk");
		System.out.println("v1 ==> " + v1);
		
		// 데이터 수정 : set(index, 새로운데이터)
		// ==> index번째의 데이터를 '새로운데이터'로 덮어쓴다.
		// ==> 반환값 : 원래의 데이터
		
		String temp = (String)v1.set(1,"zzz");
		// 1번째 인덱스에 있는 kkk 는 문자열이지만 최 상위 객체인 Object 형태로 되어 있는것 
		// 꺼내지는 반환값인 Object 를 String 으로 변환 해줘야 하기 때문에 형변환을 해줘야 한다.
		System.out.println("v1 = " +v1);
		System.out.println("반환값 : " + temp);
		
		// 데이터 꺼내오기 : get(index)
		// ==> index번째의 데이터를 반환한다. // 반환하는 데이터의 형에 맞게 반환해줘야 한다.
		int data = (int)v1.get(2);
		System.out.println("2번째 자료 : " + data);
		
		// 데이터 삭제 : remove(index)
		// ==> index번째의 데이터를 삭제한다.
		// ==> 반환값 : 삭제된 데이터
		v1.remove(0);  // ==> 0번째 인덱스에 있는 값을 지우겠다.
		System.out.println("v1 = " + v1);
		
		temp = (String)v1.remove(0);
		System.out.println("v1 = " + v1);
		System.out.println("삭제된 데이터 : " + temp);
		
		
		// 데이터 삭제 : remove(삭제할 데이터)
		// ==> '삭제할 데이터' 를 찾아서 삭제한다.
		// ==> '삭제할 데이터' 가 여러개이면 앞에서 부터 삭제된다.
		// ==> 반환값 : 삭제성공(true), 삭제실패(false)
		// ==> 삭제할 데이터가 '정수형' 이거나 'char형' 일 경우에는 반드시 객체로 변환해서 지정해 주어야 한다.
		
		
		v1.remove("CCC");	
		System.out.println("삭제 후 v1 = " + v1);
		
		
		// v1.remove(123);  // ==> 123을 데이터로 인식하지않고 인덱스로 인식해서 Console 창에 오류 발생
		v1.remove(new Integer(123)); //123 을 Integer 로 처리 데이터로 인식 하도록 한다.
		System.out.println("삭제 후 v1 = " + v1);
		
		//v1.remove('a'); // ==> a 코드가 97 이기 때문에 97 인덱스를 삭제한다 고 인식 Console 창에 오류 발생
		v1.remove(new Character('a'));
		System.out.println("삭제 후 v1 = " + v1);
		
		
	//===================================================================================//	
	/*
	 - 제네릭 타입(Generic Type) ==> 클래스 내부에서 사용할 데이터 타입을 외부에서 지정하는 기법을 말한다.
	 	==> 객체를 선언할 때 괄호(< >)안에 그 클래스 내부에서 사용할 데이터의 타입을 정해주는 것을 말한다.
	 	==> 이런식으로 선언하게 되면 그 데이터 타입 이외의 다른 데이터를 저장 할 수 없게 된다.
	 	==> 이 제네릭으로 선언될 수 있는 데이터 타입은 '클래스형' 이어야 한다.
	 		즉, int 는 Integer, boolean은 Boolean, char는 Character 등으로 대체해서 사용해야 한다.
	 	==> 제네릭 타입으로 선언하게 되면 데이터를 꺼내올때 형변환이 필요없다.
	  
	 */
		Vector<String> v2 = new Vector<String>();
		Vector<String> v22 = new Vector<>();
		
		Vector<Integer> v3 = new Vector<>();
		// Vector<int> v33 = new Vector<>(); // 제네릭 타입은 반드시 '클래스형' 으로 지정해야 한다.
		
		v22.add("안녕하세요");
		// v22.add(123);  // 오류 : 다른 종류의 데이터는 저장 할 수 없다.
		
		String temp2 = v22.get(0); // 형 변환이 필요 없다.
		System.out.println("temp2 = " + temp2);
		System.out.println("v22 : " + v22);
		Vector<Vector> vv = new Vector<>();
		Vector<Vector<Vector>> vvv = new Vector<>(); //  많이 쓰지 않지만 가능은 한 형태
		
		System.out.println();
		System.out.println("-----------------------------------------------");
		System.out.println();
		
		
		// 전체 데이터 삭제하기 : clear();
		v1.clear();
		System.out.println("v1의 개수 : " + v1.size());
		System.out.println("clear 후 v1 = " + v1);
		
		
		v2.add("AAAA");
		v2.add("BBBB");
		v2.add("CCCC");
		v2.add("DDDD");
		v2.add("EEEE");
		
		Vector<String> v4 = new Vector<>();
		v4.add("BBBB");
		v4.add("EEEE");
		
		System.out.println("v2 = " + v2);
		System.out.println("v4 = " + v4);
		
		// 데이터 삭제 : removeAll(Collection 객체)
		// ==> 'Collection 객체' 가 가지고 있는 데이터를 모두 삭제한다.
		// ==> 반환값 : 삭제 성공(true), 삭제 실패(false)
		
		v2.removeAll(v4); // v2 가 가지고있는것 중에서 v4 가 가지고있는 것 중 똑같은 것을 v2 에서 지워라
		System.out.println("v2 : " +v2);
		
		System.out.println();
		System.out.println("-----------------------------------------------");
		System.out.println();
		
		v2.clear();
		
		v2.add("AAAA");
		v2.add("BBBB");
		v2.add("CCCC");
		v2.add("DDDD");
		v2.add("EEEE");
		
		// Vector 에 저장된 데이터를 순서대로 모두 가져와 사용하고 싶으면 반복문을 사용하면 된다.
		// (보통 for문을 많이 사용한다.)
		for(int i = 0; i<v2.size(); i++) {
			System.out.println(i + "번째 자료 : " + v2.get(i));
			
		}
		System.out.println("-----------------------------------------------");
		
		// 향상된 for 문
		// 
		/*
		- 형식) for(자료형명 변수명 : 배열이나 List 또는 Set형 객체 변수) {
				   처리할 내용들;
				  ...
				  
		
		*/
		for(String str : v2) {
			System.out.println(str);
			
		}
		
		
		
		
		
	}

}
