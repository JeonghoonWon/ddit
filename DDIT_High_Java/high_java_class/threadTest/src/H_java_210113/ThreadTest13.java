package H_java_210113;

// yield()메서드 연습
// 내 쓰레드가 끝나면 양보하는 것. 나는 안돌고 다른 쓰레드 돌 수 있게 .

public class ThreadTest13 {

	public static void main(String[] args) {
		YieldThread th1 = new YieldThread("1번 쓰레드");
		YieldThread th2 = new YieldThread("2번 쓰레드");
	
		th1.start();
		th2.start();
		
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		System.out.println("111111111 ++++++++++++++++++++++++++++");
		
		th1.work = false;
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		System.out.println("222222222 ++++++++++++++++++++++++++++");
		
		th1.work = true;
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		System.out.println("333333333 ++++++++++++++++++++++++++++");
		
		th1.stop = true;
		th2.stop = true;
	}

}
// yield() 메서드 연습용 쓰레드
class YieldThread extends Thread{
	public boolean stop = false;
	public boolean work = true;
	
	public YieldThread(String name){
		super(name);		// 쓰레드의 이름 설정하기
		
	}
	public void run() {
		while(!stop) {	// stop변수가 true이면 반복문이 끝난다.
			if(work) {
				System.out.println(getName() + "--작업중..."); // getName() 쓰레드 이름 가지고 오는것
			}else {
				System.out.println(getName() + "--양보!!!!!");
				Thread.yield();
			}
			
			
		}
		
	}
}

