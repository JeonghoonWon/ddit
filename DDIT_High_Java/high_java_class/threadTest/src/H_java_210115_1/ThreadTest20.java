package H_java_210115_1;

	// wait(), notify() 메서드를 이용해서
	// 두 쓰레드가 번갈아 한번씩 실행되는 예제

	// wait(), notify(), notifyAll()메서드는 동기화 영역에서만 사용 가능하다.

public class ThreadTest20 {

	public static void main(String[] args) {
		WorkObject workObj = new WorkObject();
		
		ThreadA thA = new ThreadA(workObj);
		ThreadB thB = new ThreadB(workObj);
		
		thA.start();
		thB.start();
		

	}

}

// 공통으로 사용할 객체
class WorkObject {
	public synchronized void testMethodA(){
		System.out.println("testMethod A ()메서드 호출.......");
		
		notify();
		try {
			wait();
			System.out.println("testMethod A ()waiting pool 로 들어감.......");

		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		System.out.println("testMethod A () - wait()메서드 호출  후...");
	}
	
	public synchronized void testMethodB() {
		System.out.println("testMethod B ()메서드 호출!!!!!!!!!!!!!!!!!!!");
		
		notify();
		try {
			wait();
			System.out.println("testMethod B ()waiting pool 로 들어감!!!!!!!!!!");
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		System.out.println("testMethod B () - wait()메서드 호출  후...");
	}
	
}

// WorkObject 의 testMethodA()메서드만 호출하는 쓰레드
class ThreadA extends Thread{
	private WorkObject workObj;
	
	public ThreadA(WorkObject workObj) {
		this.workObj = workObj;
	}
	@Override
	public void run() {
		for(int i = 0; i<=10; i++) {
			workObj.testMethodA();
			
		}
	}
	
}

//WorkObject 의 testMethodB()메서드만 호출하는 쓰레드
class ThreadB extends Thread{
private WorkObject workObj;
	
	public ThreadB(WorkObject workObj) {
		this.workObj = workObj;
	}
	@Override
	public void run() {
		for(int i = 0; i<=10; i++) {
			workObj.testMethodB();
			
		}
		synchronized (workObj) {
			workObj.notify();
		}
	}
	
}
