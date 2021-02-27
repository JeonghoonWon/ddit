package H_java_210113;

	// 쓰레드의 상태값을 출력하는 예제

public class ThreadTest10 {

	public static void main(String[] args) {
			StatePrintThread th = 
					new StatePrintThread(new TargetThread());
			th.start();

	}

}

// 쓰레드 상태의검사 대상이 되는 쓰레드 ( 상태가 변함 )
class TargetThread extends Thread{
	
	@Override
	public void run() {
		for(long i = 1L; i <=20_000_000_000L; i++) { }		// 시간 지연용 TargetThread 의 상태값 : RUNNABLE
			
			try {
				Thread.sleep(1500);							// TargetThread 의 상태값 : TIMED_WAITING
			} catch (InterruptedException e) {
			
			}
			for(long i = 1L; i <=20_000_000_000L; i++) {}	// 시간 지연용 TargetThread 의 상태값 : RUNNABLE
		}
	}


// 검사 대상 쓰레드의 상태값을 출력하는 쓰레드
class StatePrintThread extends Thread {
// 검사 대상 쓰레드가 저장될 변수 선언
	private TargetThread target;
	
	public StatePrintThread(TargetThread target) {
		this.target = target;
	}
	
	@Override
	public void run() {
		while(true){ // 무한 반복을 돌린다.
		// 쓰레드의 상태값 구하기
		Thread.State state = target.getState(); 
		// getState(); 현재 쓰레드의 상태에 맞는 열거형 형태가 출력된다.
		System.out.println("TargetThread 의 상태값 : " + state);

		// 검사 대상 쓰레드가 NEW 상태이면...
		if(state == Thread.State.NEW) { 
			target.start(); 	//검사 대상 쓰레드를 작동 시킨다.
		}

		// 쓰레드 상태가 종료 상태이면...
		if(state == Thread.State.TERMINATED){   //TargetThread 의 상태값 : TERMINATED
			break;
		}
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
	}
}
	
	
}
