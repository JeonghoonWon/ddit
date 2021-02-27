package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Scanner;

public class ArrayListTest04 {
/*	문제 1) 5명의 별명을 입력 받아 ArrayList 에 저장하고 이들 중 별명의 길이가 제일 긴 별명을 출력하시오.
	(단, 각 별명의 길이는 모두 다르게 입력한다.)

	문제2) 문제1에서 별명의 길이가 같은 것을 입력할 수 있는 경우를 처리하시오.
	(ArrayListTest04.java 파일에 작성한다.)
	
	
	*/
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ArrayList<String> aliasList = new ArrayList<>();
		
		System.out.println("서로 다른 길이의 별명을 5번 입력하세요.");
		for(int i =1; i <=5; i++) {
			System.out.println(i + "번째 별명: ");
			String alias = sc.next();
			aliasList.add(alias);

		}
		// 제일 긴 별명의 길이가 저장될 변수를 선언하고
		// 이 변수는 List의 첫번째 데이터의 길이로 초기화한다.
		int maxlength = aliasList.get(0).length();
		
		for(int i = 1; i < aliasList.size();i++){
			if(maxlength < aliasList.get(i).length()) {
				maxlength = aliasList.get(i).length();
			}
		}
	
		System.out.println("제일 긴 별명들...");
		for(int i=0; i<aliasList.size(); i++) {
			if(aliasList.get(i).length() == maxlength){
				System.out.println(aliasList.get(i));
				
				
			}
		}
	}

}
