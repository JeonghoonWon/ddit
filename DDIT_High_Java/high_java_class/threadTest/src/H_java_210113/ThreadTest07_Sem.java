package H_java_210113;

import javax.swing.JOptionPane;
/*
 *  문제 ) 컴퓨터와 가위 바위 보를 진행하는 프로그램을 작성하시오.
 * 			컴퓨터의 가위 바위 보는 난수를 이용해서 정하고,
 * 			사용자는 showInputDialog()메서드를 이용해서 입력 받는다.
 * 
 * 			입력 시간은 5초로 제한하고 카운트 다운을 진행한다.
 * 			5초안에 입력이 없으면 게임에진 것으로 처리한다.
 * 
 * 			5초 안에 입력이 완료되면 승 패를 구해서 출력한다.
 * 
 * 		1) 5초 안에 입력을 못했을 경우 실행 예시
 * 			-- 결과 --
 * 			시간 초과로 당신이 졌습니다.
 * 		2) 5초 안에 입력을 했ㅇ르 경우 실행 예시
 * 			-- 결과 --
 * 			컴퓨터 : 가위
 * 			사용자 : 바위
 * 			결  과 : 당신이 이겼습니다. 
 * 
 */

public class ThreadTest07_Sem {
	public static boolean inputCheck = false;
	
	
	public static void main(String[] args) {
			// main 메서드도 thread 이기 때문에 여기에 가위바위보 생성
		
		GameTimer gt = new GameTimer();
		
		// 난수를 이용해서 컴퓨터의 가위 바위 보 정하기
		String[] data = {"가위","바위","보"};
		int index = (int)(Math.random()*3);  // 0~2 사이의 난수 만들기
		String com = data[index]; // com 에 가위 바위 보가 정해짐.
		
		// 사용자의 가위 바위 보 입력 받기
		String  man = null;		// 사용자의 가위 바위 보가 저장될 변수
		gt.start();				// 카운트 다운 쓰레드 시작
		
		do{
			man = JOptionPane.showInputDialog("가위 바위 보 를 입력해주세요.");
		}while(!(man.equals("가위") || man.equals("바위") || man.equals("보")));
		
			inputCheck = true;
		
		// 결과 판정하기
		String result = "";		//판정 결과가 저장될 변수
		if(com.equals(man)){
			result = "비겼습니다.";
		}else if(man.equals("가위") && com.equals("보")||
				 man.equals("바위") && com.equals("가위")||
				 man.equals("보") && com.equals("바위")){
			result = "당신이 이겼습니다.";
		}else {
			result = "당신이 졌습니다.";
		}
		// 결과 출력하기
		System.out.println("\t--결과--\t");
		System.out.println("컴퓨터 : " + com);
		System.out.println("사용자 : " + man);
		System.out.println("결과 : " + result);
		
		
		
	}

}

// 카운트다운 하는 쓰레드
class GameTimer extends Thread {
	
	@Override
	public void run() {
		System.out.println("카운트 다운 시작!!");
		for(int i=5; i>0; i--) {
			// 가위 바위 보를 입력받는 쓰레드에서 입력이 완료되면 카운트 다운을 멈춘다.
			if(ThreadTest07_Sem.inputCheck==true) {
				return;
			}
			
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				
			}
			
		}	// for문
		System.out.println("\t--결과--\t");
		System.out.println("시간 초과로 당신이 졌습니다.");
		System.exit(0); 		//프로그램 종료
	
	
	}
	
}