package H_java_210114;

public class ThreadTest16 {

	public static void main(String[] args) {
		// 공통 객체 생성
		ShareObject sObj = new ShareObject();

		TestThread th1 = new TestThread("Test1", sObj);
		TestThread th2 = new TestThread("Test2", sObj);

		th1.start();
		th2.start();

	}

}

class TestThread extends Thread {
	private ShareObject sObj;

	public TestThread(String name, ShareObject sObj) {
		super(name); // 쓰레드 이름 설정
		this.sObj = sObj;

	}

	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			sObj.add();

		}
	}

}

// 공통으로 사용할 클래스
class ShareObject {
	private int sum = 0;

	// 동기화 하기

	// 방법1 ==> 메서드 자체에 동기화 설정을 한다.

	public synchronized void add() {

		// 방법2 ==> 동기화 블럭으로 설정한다.
		synchronized (this) {  // 동기화 블럭에 진입하면 동기화가 처리되고 나가면 동기화가 해제 된다.

			// 아래 3줄과 sum += 10; 과 동일
			int n = sum;

			n += 10;

			sum = n;

			
			// Thread.currentThread() : 현재 실행중인 쓰래드
			// getName() : 그 쓰래드의 이름을 가지고오는 함수
		}
		System.out.println();
		System.out.println(Thread.currentThread().getName() + "합계 : " + sum);
	}

}