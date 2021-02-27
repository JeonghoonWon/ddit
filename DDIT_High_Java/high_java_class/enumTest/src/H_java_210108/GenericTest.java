package H_java_210108;

class NonGenericClass{
	private Object value;
	
	
	public void setValue(Object value) {
		this.value = value;
	}
	public Object getValue() {
		return value;
	}
}
/*
 * 일반적으로 프로그래밍을 할 때,
객체들의 데이터(필드)를 외부에서 직접적으로 접근하는 것을 막아놓습니다.
필드들을 private 접근 제한자로 막아두고,
각 필드의 Getter, Setter로 접근하는 방식을 사용합니다.
이렇게 프로그래밍 하는 이유는 객체의 무결성을 보장하기 위함입니다.
예를들어 Man이라는 클래스에 weight(몸무게)라는 필드가 존재할 때
weight는 0보다 작을 수 없으나, 
외부에서 직접적으로 접근할 경우,
weight에 -100이라는 값을 줌으로써 객체의 무결성이 깨지는 일이 발생합니다.
이를 방지하기 위해,
필드를 private로 만들어 외부의 접근을 제한한 후,
Setter를 사용해 전달받은 값을 내부에서 가공해 필드에 넣어주는 방식을 사용하고
마찬가지로 필드 값을 가져올 때도,
Getter를 사용해 본 필드의 값을 숨긴 채
내부에서 가공된 값을 꺼낼 수 있습니다.
 */

/*
 * 	- 제네릭 클래스를 만드는 방법
 * 형식)
 * 	class 클래스명<제네식타입글자> {
 * 		제네릭타입글자 변수명;			//변수 선언에 제네릭을 사용할 경우
 * 		...
 * 		제네릭타입글자 메서드명() {		// 메서드의 반환값에  제네릭을 사용할 경우
 * 			...
 * 			return 값;
 * 
 * 		}
 * 
 * 		void 메서드명 (제네릭타입글자 변수명) { // 메서드의 매개변수에 제네릭을 사용할 경우
 * }
 * 
 * 
 * -- 제네릭 타입 글자로 많이 사용되는 것 --
 * T ==> type
 * K ==> key
 * V ==> value
 * E ==> Element(자료구조에 들어가는 것들을 주로 나타낸다.)
 * 
 */

class MyGeneric<T> {
	private T value;
	
	public void setValue(T value) {
		this.value = value;
	}
	
	public T getValue() {
		return value;
	}
}


public class GenericTest {
	class test {
		// 클래스 안에 클래스를 만들 수 있다.
	}
	public static void main(String[] args) {
		NonGenericClass ng1 = new NonGenericClass();
		ng1.setValue("가나다라");
		
		NonGenericClass ng2 = new NonGenericClass();
		ng2.setValue(100);
		
		// 부모쪽(Object) 에 자식을 저장할땐 형 변환을 해주지 않아도 됨.
		// 대신 부모의 데이터를 자식에 넣기 위해선 형변환을 해줘야 한다. 
		String rtnNg1 = (String)ng1.getValue();
		System.out.println("문자열 반환값 : " + rtnNg1 );
		int rtnNg2 = (int)ng2.getValue();
		System.out.println("정수 반환값 : " + rtnNg2);
		
//		String rtnNg3 = (String)ng2.getValue();  // 문법적으론 error 가 아니지만 , 실행 시 오류 발생
		// 실제 ng2.getValue(); 에 들어가있는 int 변수를 String 으로 변환하겠다 라는 의미라 
//		System.out.println("rtnNg3 = " + rtnNg3);
		
		
		MyGeneric<String> mg1 = new MyGeneric<>();
		MyGeneric<Integer> mg2 = new MyGeneric<>();
		
		mg1.setValue("우리나라");   
		// mg1.setValue(700); 을 넣을경우 코딩 할 때 컴파일 에러가 나타남 .
		// String 값이 들어가야하는데 int 값이 들어갔기 때문이다.
		
		mg2.setValue(500);
		
		String rtnMg1 = mg1.getValue();
		int rtnMg2 = mg2.getValue();
		
		
		System.out.println("-------------------------------");
		System.out.println("문자열 반환값 : " + rtnMg1);
		System.out.println("정수 반환값 : " + rtnMg2);
		
	}

}
