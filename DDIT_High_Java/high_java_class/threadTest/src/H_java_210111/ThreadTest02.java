package H_java_210111;

public class ThreadTest02 {

	public static void main(String[] args) {
		// 멀티 쓰레드 프로그램
		
		// Thread 를 사용하는 방법
		
		//방법1.
		// Thead 클래스를 상속한 class 를 작성 한 후
		// 이 class 의 인스턴스르 생성한 후, 이 인스턴스의 start() 매서드를 호출한다.
		Mythread1 th1 = new Mythread1();
		th1.start();
		
		// 방법2
		// Runnable 인터페이스를 구현한 class 를 작성한 후
		// 이 class 의 인스턴스를 생성한 후,
		// 이 인스턴스를 thread 객체의 인스턴스를 생성할 때
		// 생성자에 '인자값'으로 넣어서 생성한다.
		// 이 때 생성된 Thread의 인스턴스의 start() 메서드를 호출한다.
		Mythread2 r2 = new Mythread2();
		Thread th2 = new Thread(r2);   //thread 객체에 r2를 인자값으로 넣어서 실행 한 것
		th2.start();
		
		// start() 를 쓰지않고 run 을 호출 할 수 있지만, run 을 호출하면 싱글 쓰레드가 실행되는것.
		// start() 는 main thread 에 자동으로 포함 되어 있다.
		// 메인메서드가 종료되도 thread 가 진행되고 있으면 종료된게 아님. thread 가 종료됬을때 종료라고 봐야한다. 
		
		
		// 방법3 
		// 익명구현체를 이용하는 방법
		Runnable r3 = new Runnable() {   // 인터페이스는 객체를 생성할 수 없음 (메소드가 구현되어 있지 않기 때문에)      
	         // 1회용으로 사용함
	         @Override
	         public void run() {
	            for(int i=1; i<=200; i++) {
	               System.out.print("@");
	               try {
	                  Thread.sleep(100);
	               } catch (InterruptedException e) {
	                  e.printStackTrace();
	               }
	            }            
	         }
	      };
	      Thread th3 = new Thread(r3);
	      th3.start();
	      System.out.println("*$main()메소드 끝...");
			
		
		
	}

}


// 방법1 에 해당하는 Thread 만들어보기  ==> Thread클래스 상속하기
class Mythread1 extends Thread {
	@Override
	public void run() {
		// 이 run() 메서드 안에 이 Thread 가 처리할 내용을 기술한다.
		for(int i=1; i <= 200; i++) {
			System.out.print("*");
			
			// 반복문 속도 천천히 출려되게 하는 방법
			// Thread.sleep(시간) ==> 주어진'시간' 동안 작업을 잠시 멈춘다.
			// '시간'의 단위는 밀리세컨드(1/1000초)이다.
			// 1초 == 1000
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println();
		
		
		// 이 run() 메서드의 실행이 끝나면 해당 Thread 도 끝난다.
		// 200개 * 출력하면 Thread 가 끝나는것.
	}
	
}
// 방법2 에 해당하는 Thread 만들어보기 ==> Runnable 인터페이스 구현하기
// java 가 상속을 하나만 할수 있기 때문에 Runnable 을 이용해서 여러개
class Mythread2 implements Runnable {
	@Override
	public void run() {
		for(int i=1; i <= 200; i++) {
			System.out.print("$");
			
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println();
		
	}
	
	
}




