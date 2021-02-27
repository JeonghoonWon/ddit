package H_java_210112;

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



public class ThreadTest07 {

	public static void main(String[] args) {
	
		Thread th1 = new Game();
		Thread th2 = new CountDown();
		
		th1.start();
		th2.start();

		
	}

}

//내가 입력하는 창 만드는 쓰레드
class Game extends Thread {
	public static boolean inputCheck = false;

	@Override
	public void run() {
				
		String input = null;
		// 입력값 받기
		do{
		 input = JOptionPane.showInputDialog("가위, 바위 , 보 를 입력해주세요.");
		}while(!(input.equals("가위") || input.equals("바위") || input.equals("보")));
		
		inputCheck = true;
				
		//System.out.println("입력 값 : " + input);
		
		// 컴퓨터 랜덤 값 생성
				int ranNum = (int)(Math.random()*3)+1;
			//	System.out.println("rannum : "+ ranNum);
				String name = null;
				switch(ranNum) {
				case 1 :
					name = "가위";
					break;
				case 2 : 
					name = "바위";
					break;
				case 3 : 
					name = "보";
					break;
				}
			//	System.out.println("컴퓨터 랜덤값 : " + name );
				
		// 내 입력값 숫자로 변환 
		int myNum = 0 ;
			if(input.equals("가위")) {
			myNum = 1;
			}else if(input.equals("바위")){
				myNum = 2;
			}else if(input.equals("보")) {
				myNum = 3;
			}
		//	System.out.println("myNum : " + myNum);
		// 컴퓨터 랜덤 값 과 입력값 비교
			System.out.println("----------------------------------");
			if(ranNum==myNum) {
				System.out.println("컴퓨터 :" + name);
				System.out.println("사용자 :" + input);
				System.out.println("비겼습니다.");
			}else if (ranNum == 1 && myNum  == 2 || ranNum == 2 && myNum == 3 ) {
				System.out.println("컴퓨터 :" + name);
				System.out.println("사용자 :" + input);
				System.out.println("사용자가 이겼습니다.");
			}else if (ranNum == 1 && myNum  == 3 || ranNum == 2 && myNum == 1) {
				System.out.println("컴퓨터 :" + name);
				System.out.println("사용자 :" + input);
				System.out.println("사용자가 졌습니다.");
			
		}
	
}

	
	
	
	
	/*		// 컴퓨터 난수로 가위바위보.
	// 숫자를 가위=1 바위=2 보=3 로 .
	String name = null;
	ranNum = (int)Math.random()*3+1;
	
	if(ranNum==1){
		name = "가위";
	}else if(ranNum==2){
		name = "바위";
	}else{
		name = "보";
	}
	*/
	

	
	
/*	private void makeNum() {
		int myresult = Integer.parseInt(myNum.input);
		String comresult = String.valueOf(comNum.ranNum);
		if(myresult==comNum.ranNum) {
			System.out.println("컴퓨터 :" + comresult);
			System.out.println("사용자 :" + myNum.input);
			System.out.println("비겼습니다.");
		}else {
			System.out.println("test");
		}
}*/

}

class CountDown extends Thread {
	

	@Override
	public void run() {
		
		for(int i = 5; i>0; i--) {
			if(Game.inputCheck==true) {
				
				return;
			}
			System.out.println(i);		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
	
	}
		System.out.println("시간 초과로 당신이 졌습니다.");
		System.exit(0);
	}
	
}



		
	
