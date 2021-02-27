package kr.or.ddit.basic;

import java.util.Arrays;
import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) {
	
/*
 문제1.
arr배열의 모든값을 더하는 프로그램을 작성하세요
int[] arr ={10,20,30,40,50}
*/
		int[] arr = {10,20,30,40,50};
		int sum = 0;
		
		for(int i = 0; i<arr.length; i++) {
			sum += arr[i];
		}
		
		System.out.println("sum : " + sum);
		
/*
문제2 

5명의 이름을 입력받아 배열에 저장하는 프로그램을 작성하세요.

*/
		Scanner sc = new Scanner(System.in);
		String[] name = new String[5];
		for(int i = 0 ; i <5; i++) {
		System.out.println("5명 이름을 입력 하세요 >");
		
		name[i] = sc.nextLine();
		}
		for(int i = 0; i < name.length; i++) {
		System.out.print(name[i]+ " ");
		}
		
/* 
      문제3

      int[] score = { 79, 88.91,33,100,55,95}
      score배열의 최대값, 최소값구하기 
*/
		
		int[] score = { 79, 88, 91, 33, 100, 55, 95};
		int max = score[0];
		int min = score[0];
		
		for(int a : score){
			if(max < a){
				max = a;
			}else if(a < min){
				min = a;
			}
		}
		
		System.out.println("최대값 : " + max + " 최소값 : " + min);
		

		
		
    
/*
      문제4

      2차원 배열 arr2에 담긴 모든값의 총합과 평균을 구하는 프로그램을 작성하세요

      int[][] arr2 = {
          {5,5,5,5,5},
          {10,10,10,10,10},
          {20,20,20,20,20},
          {30,30,30,30,30}
       };

*/
      int[][] arr2 = {
                  {5,5,5,5,5},
                  {10,10,10,10,10},
                  {20,20,20,20,20},
                  {30,30,30,30,30}};
      
      int[] sum1 = new int[arr2.length];
      double[] avg = new double[arr2.length];
      
      for(int i = 0; i < arr2.length;i++) {
         for(int j = 0; j< arr2[i].length; j++) {
         
            //합계
            sum1[i] += arr2[i][j];
         }
            avg[i] = (double) sum1[i] / arr2.length;
      
            System.out.println("합계 : " + sum1[i] + "\t" + "/평균:" + avg[i]);
      }   
      /*
      문제5

      int[] answer= {};
      int[] counter = new int[4];

      answer 배열의 각 숫자의 갯수를 세어 count배열에 넣고 
      count배열의 각숫자만큼씩 *를 출력한다 
*/
      int[] answer= new int[20];
		int[] counter = new int[4];
		for(int i = 0; i < 20; i++){
			int ran = (int)(Math.random() * 4 + 1);
			answer[i] = ran;
		}
		
		System.out.println("answer : " + Arrays.toString(answer));
		
		for(int i = 0; i < counter.length; i++){
			int count = 0;
			for(int j = 0; j < answer.length; j++){
				if(i+1 == answer[j]){
					count++;
				}
				counter[i] = count;
			}
		}
		System.out.println("counter : " + Arrays.toString(counter));
		for(int i = 0; i < counter.length; i++){
			for(int j = 0; j < counter[i]; j++){
				System.out.print("*");
			}
			System.out.println();
		}
         
      /*

      문제6

      String menu[] ={ "아메리카노 3000원", "카푸치노 4000원", "카페라떼 3500원"}
      menu배열에서 메뉴이름과 가격중 메뉴이름을 추출하는 프로그램을 작성하세요.
*/
      String menu[] ={ "아메리카노 3000원", "카푸치노 4000원", "카페라떼 3500원"};
         
      for(int i = 0; i < menu.length; i++){
         String name1 = menu[i].substring(0,menu[i].indexOf(" "));
         System.out.println(name1);
      }
      
      /*

      문제7.
       
      String str="i Love Java";
      str변수에서 Java의 위치를 찾아 출력하는 프로그램을 작성하세요,

*/      String str="i Love Java";
         int index = str.indexOf("Java");
         System.out.println("Java위치  : " + index);
      
      
      /*
       


      문제8

      String  s="java.lang.Object"
      s변수에서 lang문자열을 추출하는 프로그램을 작성하세요 
*/
		String  s ="java.lang.Object";
		int a = s.indexOf("lang");
		System.out.println(s + " 중의 " + s.substring(a, a+4));
		System.out.println();

		/*
      문제9

      String animals = "dog,cat,bear";
      animals변수에서 ,를 기준으로  문자열을  분리해서  3개의 단어로 각각 출력하는
       프로그램을 작성하세요
*/
      String animals = "dog,cat,bear";   
      String[] split = animals.split(",");
      System.out.println(Arrays.toString(split));
      
         
         
         /*

       문제 10
      String str="java,lang,Object"
      str문자열에서 ,를 .으로 바꾸어 출력하는 프로그램을 작성하세요.

*/            
      String str1="java,lang,Object";
		String str2 = "";
		for(int i = 0; i < str1.length(); i++){
			String temp = "";
			temp += str1.charAt(i);
			if(temp.equals(",")){
				str2 += ".";
			}else{
				str2 += temp;
			}
		}
		System.out.println(str2);
   }

}