package H_java_210113;

import java.util.Arrays;




/*
 *  문제) 10마리의 말들이 경주하는 경마 프로그램을 작성하시오.
 *  
 *  말은 Horse 라는 이름의 쓰레드 클래스로 작성하는데,
 *  이 클래스의 말 이름 (String), 등수(int), 현재위치값(int)을 멤버 변수로 갖는다.
 *  그리고 이 클래스에는 등수를 오름차순으로 처리 할 수 있는 내부 정렬 기준이 있다.(Comparable 인터페이스 구현)
 *  
 *  경기 구간은 1~50 구간으로 되어있다.
 *  
 *  경기가 진행되는중간 중간에 각각의 말들의 위치를 아래와 같이 나타내시오.
 *  예시)
 *  01번말 : ---->---------------------------------------------
 *  02번말 : -------------------------------------->----------- 
 *  03번말 : ------------------------>-------------------------
 * 	:
 *  10번말 : ---------->---------------------------------------
 *  
 *  경기가 끝나면 등수 순으로 출력 한다.
 *  
 *  
 */
public class ThreadTest12 {

	public static void main(String[] args) {
		Horse1[] hor = new Horse1[]
				{new Horse1("01번말"),
				new Horse1("02번말"),
				new Horse1("03번말"),
				new Horse1("04번말"),
				new Horse1("05번말"),
				new Horse1("06번말"),
				new Horse1("07번말"),
				new Horse1("08번말"),
				new Horse1("09번말"),
				new Horse1("10번말")
				};
		
		HorseGame hg = new HorseGame(hor);
		
		System.out.println( "<<< 경주 시작 >>>");
		// 배열에 저장된 쓰레드를 실행
		for(Horse1 h : hor) {
			h.start();
		}
		hg.start();
		// 모든 쓰레드의  출력이 끝날때 까지 기다린다.
		for(Horse1 h : hor) {
			try {
				h.join();
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
			try {
				hg.join();
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		
		
		System.out.println();
		System.out.println("경기 끝");
		System.out.println();
		
		Arrays.sort(hor);
		
		System.out.println("<<< 경기결과 >>>");
		for(Horse1 h : hor) {
			
			
			System.out.println(h);
					
		}
		
	}
}
// 등수 이름 현위치 메서드
class Horse1 extends Thread implements Comparable<Horse1>{
	public static int setRank = 0; // 경기 끝난 말 등수 처리 변수
	
	private String name1;		// 말 이름
	private int rank;			// 등수
	private int now;			// 현 위치
	
	public Horse1(String name1) {
		super();
		this.name1 = name1;
	}
	
	
	public String getName1() {
		return name1;
	}


	public void setName1(String name1) {
		this.name1 = name1;
	}


	public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public int getNow() {
		return now;
	}


	public void setNow(int now) {
		this.now = now;
	}

	
	@Override
	public String toString() {
		return "경주마" + name1 + "은 " + rank + "등 입니다.";
	}

	// 등수 오름차순 정렬하는 내부 정렬 기준 설정
	@Override
	public int compareTo(Horse1 h) {
		
		return Integer.compare(rank,h.getRank());
	}
	
	@Override
	public void run() {
		// 일단 숫자i 가 찍히게 해보자
		for(int i = 1; i<=50; i++) {
			this.now = i;
			
			try {
				Thread.sleep((int)(Math.random()*500));
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
		
		
		setRank++;
		this.rank = setRank;		// 등수 값을 rank에
	
	}
	
}

// 경기중인 말 현재 위치 나타내는 Thread
class HorseGame extends Thread {
	private Horse1[] horses;
	// 말들 정보 저장 배열

	// 생성자
	public HorseGame(Horse1[] horses) {
		this.horses = horses;
	}

	@Override
	public void run() {
		while(true) {
			if(Horse1.setRank==horses.length){
				break;
			}
			
		for(int i = 1; i <= 10; i++)
			System.out.println();
		
		for(int i = 0; i < horses.length; i++) {
			System.out.print(horses[i].getName1() + " : ");
			
		for(int j = 1; j <=50; j ++) {
			
			if(horses[i].getNow()==j) {
				System.out.print(">");
			}else {
				System.out.print("-");
			}
		}
		System.out.println();
		} 
		
		}
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
	}
	
}