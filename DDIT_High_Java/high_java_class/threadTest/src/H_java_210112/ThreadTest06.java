package H_java_210112;

import javax.swing.JOptionPane;

public class ThreadTest06 {

	public static void main(String[] args) {
		Thread th1 = new DataInput();
		Thread th2 = new MyCountDown();
		
		th1.start();
		th2.start();
	}

}

// 데이터를 입력 받는 쓰레드
class DataInput extends Thread {
	// 스테틱 변수를 사용해 입력값을 받았을때 카운트를 종료 시킬 수 있다.
	// 입력 여부를 확인하기 윈한 변수 선언 => 쓰레드에서 공통으로 사용할 변수
	public static boolean inputCheck = false;
	
	
	
	@Override
	public void run() {
		String str = JOptionPane.showInputDialog("아무거나 입력하세요.");
		
		inputCheck = true;		//입력이 완료되면 inputCheck 변수를 true 로 변경한다.
		
		System.out.println("입력값 :" + str);
		
	}
	
}
// 카운트 다운을 처리하는 쓰레드
class MyCountDown extends Thread {
	
	@Override
	public void run() {
		for(int i = 10; i>0; i--) {
			// 입력이 완료 되었는지 여부를 검사해서 입력이 완료되면
			// 카운트 다운 쓰레드를 종료시킨다.
			if(DataInput.inputCheck == true) {
				//메서드를 끝내는건 return;
				return; // run 메서드가 종료되면 쓰레드도 종료된다.
				
			}
			System.out.println(i);
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
		System.out.println("10초가 지났습니다. 프로그램을 종료합니다.");
		System.exit(0);

	}
}

