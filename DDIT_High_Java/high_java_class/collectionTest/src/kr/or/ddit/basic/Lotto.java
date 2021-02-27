package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Scanner;

public class Lotto {

	static void show() {
		System.out.println("==================================");
		System.out.println("LOTTO 프로그램");
		System.out.println("----------------------------------");
		System.out.println("1. Lotto 구입 ");
		System.out.println("2. 프로그램 종료 ");
		System.out.println("==================================");

	}

	public static void main(String[] args) {

		while (true) {
			// show 메서드 출력
			show();
			Scanner sc = new Scanner(System.in);
			ArrayList<Integer> arr = new ArrayList<>();
			System.out.println("메뉴선택 > ");
			// 1,2 번 중 선택 받을 수 있는 입력 값
			int input = Integer.parseInt(sc.nextLine());

			switch (input) {

			case 1: // 로또 구입
				System.out.println("Lotto 구입 시작");
				System.out.println("(1000원에 로또 번호 하나입니다.)");
				System.out.print("금액입력>");
				int m = Integer.parseInt(sc.nextLine());
				int change = m; // m - 1000*n ; // 거스름돈
				int count = 0;

				while (change > 999) {
					change -= 1000;
					count++;
				}

				// 1000원 에 1장
				if (1000<=m && m <=100000 ) {

					System.out.println("행운의 로또번호는 아래와 같습니다.");
					for (int i = 0; i < count; i++) {

						// 1~45 렌덤 값
						HashSet<Integer> LottoNum = new HashSet<>();
						while (LottoNum.size() < 6) {
							int random = (int) (Math.random() * (45 - 1 + 1) + 1);
							LottoNum.add(random);
						}// System.out.println(LottoNum);
						ArrayList<Integer> num = new ArrayList<>(LottoNum);
						Collections.sort(num);
						System.out.print("로또번호 " + (i+1) + " : ");
						for(int j=0; j<num.size(); j++) {
							if(j>0)  System.out.print(", ");
							System.out.print(num.get(j));
								
							}
							System.out.println();
					
					
					
					}

					/*
					 * for(int i=0; i <num.size(); i++){ num.get(i); }
					 */

					System.out.println("받은 금액은" + m + "원이고 거스름돈은 " + change
							+ "원입니다.");
					break;
				}else if(m<1000){
					System.out.println("입력 금액이 너무 적습니다. 로또 번호 구입 실패!!");
					break;
				}else {
					System.out.println("입력 금액이 너무 많습니다. 로또 번호 구입 실패!!!");
					break;
				}
			case 2: // 종료
				System.out.println("프로그램 종료");
				System.exit(0);
				break;

			}
		}
	}

}
