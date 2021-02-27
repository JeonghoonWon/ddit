package H_java_210113;
	
	// 데몬 쓰레드 연습 ==> 자동 저장하는 쓰레드

public class ThreadTest09 {

	public static void main(String[] args) {
		AutoSaveThread auto = new AutoSaveThread();
		
		// 데몬 쓰레드로 설정하기 ==> 반드시 start()가 호출 되기 전에 설정 되어야 한다.
		//auto.setDaemon(true);  
		// auto.setDadmon(true); 를 설정 안해줄 경우 main 이 끝나도 계속 돌아간다.
		
		
		auto.setDaemon(true);    // main이 종료되면 함께 종료된다.
		
		auto.start();
		
		try {
			for(int i = 1; i <= 20; i++){
					System.out.println(i);
					Thread.sleep(1000);
					
			}
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		System.out.println("main Thread 종료.");
		
		

	}

}


// 자동 저장하는 쓰레드 (3초에 한번 )
class AutoSaveThread extends Thread{
	// 작업 내용을 저장하는 메서드
	public void save() {
		System.out.println("작업 내용을 저장합니다.");
	}
	
	@Override
	public void run() {
		while(true) {
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
			save();
		}
		
	}
}