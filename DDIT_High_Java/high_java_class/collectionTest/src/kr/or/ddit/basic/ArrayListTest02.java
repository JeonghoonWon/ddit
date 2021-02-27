package kr.or.ddit.basic;

import java.util.ArrayList;
/*
  	문제) 5명의 사람 이름을 입력 받아서 ArrayList 에 저장한 후에 이들 중 '김' 씨 성을 가진 사람ㅇ르 모두 출력하시오.
  		(입력은 Scanner 객체를 이용한다.)
 	
 */
import java.util.Scanner;



public class ArrayListTest02 {

	public static void main(String[] args) {
		// 선생님 하신것
		Scanner Scan = new Scanner(System.in);
		ArrayList<String> nameList = new ArrayList<>();
		
		// 5명 이름 입력 받기
		for(int i = 1; i<=5; i++) {
			System.out.println(i + "번째 사람의 이름을 입력하세요.");
			String name = Scan.nextLine();
			nameList.add(name);
		}
		System.out.println();
		System.out.println("김씨 성을 가진 사람들...");
		for(int i = 0; i<nameList.size(); i++) {
		/*	if(nameList.get(i).charAt(0) == '김') { // 사람 이름에서 0변째 글자를 꺼내와라
				System.out.println(nameList.get(i));
		}*/
			/*if(nameList.get(i).substring(0,1).equals("김")) { 
				System.out.println(nameList.get(i));
			}
			if(nameList.get(i).indexOf("김")==0) { 
				System.out.println(nameList.get(i));
			}*/
			if(nameList.get(i).startsWith("김")){
				System.out.println(nameList.get(i));
			}
		
		//================================================================//
		// 내가 한 것
		
/*		// 이름 받을  ArrayList 만들기
		ArrayList arr = new ArrayList();
		Scanner sc = new Scanner(System.in);
		// 이름 입력
		System.out.println("이름을 입력하세요>");
		String input = sc.nextLine();
		arr.add(input);
		System.out.println("이름을 입력하세요>");
		String input2 = sc.nextLine();
		arr.add(input2);
		System.out.println("이름을 입력하세요>");
		String input3 = sc.nextLine();
		arr.add(input3);
		System.out.println("이름을 입력하세요>");
		String input4 = sc.nextLine();
		arr.add(input4);
		System.out.println("이름을 입력하세요>");
		String input5 = sc.nextLine();
		arr.add(input5);
		
		System.out.println();
		System.out.println("=======================================");
		System.out.println();

		
		System.out.println("5명 이름 : " + arr);
		
		System.out.println();
		System.out.println("=======================================");
		System.out.println();
		
		
		// 김씨성을 가진 사람 출력
		
		System.out.println("'김' 씨 성을 가진 사람 :" + arr.indexOf("김%"));
		
		// for 구문으로 한번에 5개 이름 받기

		
			
			*/
		}


	}

}
