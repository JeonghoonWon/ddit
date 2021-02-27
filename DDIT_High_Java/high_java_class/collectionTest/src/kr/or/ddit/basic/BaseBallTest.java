package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Scanner;

/*
 문제) Set 과 List 를 이용하여 숫자 야구 게임 프로그램을 작성하시오.
 	컴퓨터의 숫자는 난수를 이용하여 구한다.
 	(스트라이크는 S, 볼은 B로 나타낸다.)
 
 */
 
public class BaseBallTest {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		HashSet<Integer> comNum = new HashSet<>();

		// 1~9 난수 3개 생성
		while (comNum.size() < 3) {
			int random = (int) (Math.random() * (9 - 1 + 1) + 1);
			comNum.add(random);

		}
		// System.out.println("야구게임 랜덤 숫자 :" + comNum);

		// 난수 3개 List 에 담기
		ArrayList<Integer> numList = new ArrayList<>(comNum);

		System.out.println();
		//System.out.print("리스트에 담긴 랜덤 숫자 : ");
		for (int i = 0; i < numList.size(); i++) {
			//System.out.print(numList.get(i) + " ");

		}
		// 리스트 셔플
		System.out.println();
		Collections.shuffle(numList);
		//System.out.println("셔플된 랜덤 숫자 :" + numList);

		System.out.println();
		System.out.println("---------<< 숫자 야구게임 >>---------- ");
		System.out.println("---------------------------------");
		System.out.println("1부터 9까지 숫자 3개를 입력해주세요 >");
		System.out.println("---------------------------------");

		// 입력 받은 값 List에 넣기

		int count = 0; //count
		while (true) {
		
			int b = 0; // ball
			int s = 0; // strike
			int o = 0; // out
			
			ArrayList<Integer> myNum = new ArrayList<>();
			int num1 = sc.nextInt();
			int num2 = sc.nextInt();
			int num3 = sc.nextInt();
			
			if(num1==num2||num1==num3||num2==num3) {
				System.out.println(" 같은 숫자는 입력 할 수 없습니다. 다시 입력해주세요.");
			
			}
			
			myNum.add(num1);
			myNum.add(num2);
			myNum.add(num3);
			System.out.println("입력 값 > " + myNum);

			for (int i = 0; i < 3; i++) {
				if (numList.get(i) == myNum.get(i)) {
					s++;
				}
			}
			
			if(numList.get(0)==myNum.get(1)||numList.get(0)==myNum.get(2)) b++;
			if(numList.get(1)==myNum.get(0)||numList.get(1)==myNum.get(2)) b++;
			if(numList.get(2)==myNum.get(0)||numList.get(2)==myNum.get(1)) b++;
						
			 o = 3 - s - b;
			 
			 System.out.println( + s + "S" + b + "B" + o + "O"); 
			 if(s == 3){
				 System.out.println(count+1 + "번째 도전. 정답입니다!!" );
				 break;
			}count ++;
			System.out.println("---------------------------------");
			System.out.println("틀렸습니다. 숫자를 다시 입력해주세요 >");
			}

	}
		
}