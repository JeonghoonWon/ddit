package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Scanner;

/*	
	문제 1) 5명의 별명을 입력 받아 ArrayList 에 저장하고 이들 중 별명의 길이가 제일 긴 별명을 출력하시오.
		(단, 각 별명의 길이는 모두 다르게 입력한다.)
	
	문제2) 문제1에서 별명의 길이가 같은 것을 입력할 수 있는 경우를 처리하시오.
		(ArrayListTest04.java 파일에 작성한다.)

*/
public class ArrayListTest03 {

	public static void main(String[] args) {
	
		//문제 1)  선생님이 하신것
		Scanner sc = new Scanner(System.in);
		ArrayList<String> aliasList = new ArrayList<>();
		
		System.out.println("서로 다른 길이의 별명을 5번 입력하세요.");
		for(int i =1; i <=5; i++) {
			System.out.println(i + "번째 별명: ");
			String alias = sc.next();
			aliasList.add(alias);
		}
		// 제일 긴 별명이 저장 될 변수를 선언하고 이 변수에는 
		// List 의 첫번째 데이터로 초기화 한다.
		// String maxAlias = aliasList.get(0);
		
		// 제일 긴 별명이 저장된 index 값이 저장될 변수를 선언하고
		// 0 으로 초기화 한다.
		int maxIndex = 0;
		
		for(int i = 1; i <aliasList.size();i++) {
//			if(maxAlias.length() < aliasList.get(i).length()){
//				maxAlias = aliasList.get(i);
//			}
		
		if(aliasList.get(maxIndex).length() < aliasList.get(i).length()) {
			maxIndex = i;
		}
		
		//System.out.println(" 제일 긴 별명 : " + maxAlias);
		System.out.println(aliasList.get(maxIndex));
		}
		
		// 문제 2) 선생님이 하신것
		
		
/*		for(int i = 1; i <= 5; i++) {
			System.out.println(i + "번째 별명을 입력해주세요.");
			String name = sc.nextLine();
			namelist.add(name);
			
			
		}
			
			System.out.println();
			System.out.println("별명 :" + namelist);
			for(int i =0; i<namelist.size()-1;i++) {
				for(int j = i+1; j<namelist.size(); j++) {*/
//				System.out.println(((String) namelist.get(i)).compareTo((String) namelist.get(j)));
				
/*
				}
			}*/
			
			
//			int cnt = namelist.size();
//			int a = Integer.parseInt();
			
//			System.out.println("cnt : " +cnt);
//			System.out.println("a : " + a);
		
		//문제2)	
	}

}
