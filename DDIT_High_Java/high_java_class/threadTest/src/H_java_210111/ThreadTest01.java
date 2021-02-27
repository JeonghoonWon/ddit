package H_java_210111;

public class ThreadTest01 {

	public static void main(String[] args) {
		// 싱글 쓰레드 프로그램  
		
		// 싱글 쓰레드는 위에서 아래로 하나씩 출력된다. 
		for(int i=1; i <= 200; i++) {
			System.out.print("*");
		}
		System.out.println();
		
		for(int i = 1; i<=200; i++) {
			System.out.print("$");
		}
		System.out.println();
		
	}

}
