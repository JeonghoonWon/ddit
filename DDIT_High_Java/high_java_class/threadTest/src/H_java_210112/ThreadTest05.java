package H_java_210112;

import javax.swing.JOptionPane;

public class ThreadTest05 {

	public static void main(String[] args) {
		// 사용자로부터 데이터 입력 받기
		// 창 생성 후 입력하면 콘솔 창에 뜬다.
		// 창 생성에서 esc 누르면 null 값 으로 표시
		String str = JOptionPane.showInputDialog("아무거나 입력하세요.");
		//창 생성 후 입력값을 기다린다.
		System.out.println("입력값 :" + str);
		
		for(int i = 10; i>0; i--) {
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				
			}
			
		}
		
		

	}

}
