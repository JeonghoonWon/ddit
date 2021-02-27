package H_java_210111;

public class ThreadTest03 {

	public static void main(String[] args) {
		// 쓰레드가 수행되는 시간을 체크해 보자.
		Thread th = new Thread(new MyRunner());
		
		// 1970년 1월 1일 0시 0분 0초(표준시간)로 부터 경과한 시간을
		// 밀리세컨드(1/1000초) 단위로 반환한다.
		long startTime = System.currentTimeMillis();  // 이 명령을 실행했을 
		
		th.start();
		
		try {
			th.join(); // 현재 실행중인 쓰레드에서
					   // 대상이 되는 쓰레드 (여기에서는 th)가 
					   // 종료될 때까지 기다린다.
		} catch (InterruptedException e) {
			
		}
		
		long endTime = System.currentTimeMillis();  
		// main thread에 있는 start 를 기준으로 시간을 제기 떄문에 0초로 나오는것.
		// 호출만 하고 끝나기 때문에.
		
		System.out.println("경과시간 : " + (endTime - startTime));
		

	}

}

// 1~10 억 까지의 합계를 구하는 쓰레드
class MyRunner implements Runnable {
	@Override
	public void run() {
		long sum = 0L;
		
		for(long i=1L; i<=1_000_000_000L; i++) {
			sum += i;
		}
		System.out.println("합계 : " + sum);
		
		
	}
	
}