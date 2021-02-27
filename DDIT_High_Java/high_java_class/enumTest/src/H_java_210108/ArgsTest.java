package H_java_210108;

public class ArgsTest {
	
	// 메서드 만들기
	
	// 매개변수로 받은 정수들의 합계를 구하는 메서드를 작성하시오.
	// (매개 변수의 정수들은 상황에 따라 개수가 다르다.)
	
	// 배열을 이용한 메서드 (메서드 만들때 최대한 static 을 사용하지 말고 만들도록!!)
	public int sumArr(int[] data) {
		int sum = 0;
		for(int i=0; i<data.length;i++) {
			sum += data[i];
			
		}
		return sum;
	}
	
	/*
	 * 	가변형 인수 ==> 메서드의 매개변수의 갯수가 호출될 때마다 다를 때 사용한다.
	 * 		- 가변형 인수는 메서드 안에서 배열로 처리된다.
 	 * 		- 가변형 인수는 한가지 자료형만 사용할 수 있다.
 	 * 		- 위에 있는 배열을 이용한 메서드와 동일한 역할을 수행한다.
	 */
	public int sumArg(int...data) {
		
		int sum = 0;
		for(int i=0; i<data.length;i++) {
			sum += data[i];
			
		}
		return sum;
	}
		
		// 가변형 인수와 일반적인 인수를 같이 사용하기
		// ==> 가변형인수를 제일 뒤쪽에 배치해야 한다.
		// public String sumArg2( int...data, String name) {  //X
		// 위처럼 가변형 변수와 일반적인 인수 의 위치를 바꿀 수 없다.
	
		// sumArg2(1,2,3,4,5,6,7)
//	public String sumArg2( int name, int...data )	 // O
//		==> int name 에 1이 들어가고 나머지 2,3,4,5,6,7 은 int...data 에 들어간다. 실행 가능.

	//	public String sumArg2( int...data, int name )	// X
//		==> int...data 에 얼마만큼 데이터를 넣을지 모르기때문에 잘못된 것. 실행 불가
		
	public String sumArg2(String name, int...data) {
		
		int sum = 0;
		for(int i=0; i<data.length;i++) {
			sum += data[i];
			
		}
		return name + "씨의 합계 : " + sum;
	}
	
	
	
	public void test(int a) {   
		System.out.println(" a: " + a);
	}
	
	
	
	public static void main(String[] args) {
		ArgsTest at = new ArgsTest();
		
		int[] nums = {100, 200, 300};
		
		int result = at.sumArr(nums);  //( ) : 매개변수에 들어가는 값
		
		System.out.println(result);
		System.out.println(at.sumArr( new int[]{1,2,3,4,5}));
		
		int k = 100;
		
		at.test(k);    // at 라는 객체에 test 메서드 를 적용 한다 라는 뜻
		
		
		at.test(300);
		
		System.out.println();
		
		System.out.println("가변형 인수 사용 예");
		System.out.println("at.sumArg(100,200,300) : " + at.sumArg(100,200,300));
		System.out.println("at.sumArg(1,2,3,4,5) : " + at.sumArg(1,2,3,4,5));
		System.out.println();
		System.out.println("at.sumArg2(홍길동,1,2,3,4,5,6) :" +at.sumArg2("홍길동",1,2,3,4,5,6)) ;
	}

	

}
