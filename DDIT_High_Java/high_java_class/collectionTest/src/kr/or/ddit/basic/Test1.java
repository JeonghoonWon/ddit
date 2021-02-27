package kr.or.ddit.basic;

import java.util.Scanner;

public class Test1 {

	public static void main(String[] args) {
		
/*
 문제1 
변수 num의 값에 따라 양수, 음수, 0을 출력하는 코드를 작성하세요,
삼항연산자를  이용 
int num = 10
*/
		int num = 10;
				
		String result = (num>0)? "양수" : (num<0)? "음수" : "0";
		
		System.out.println("result : " + result);
/*
문제2 
문자형 변수 ch가 영문(대문자 또는 소문자)자이거나 숫자일때만 
변수 b의 값이  true가 되도록 하는 코드를 작성하세요
삼항연산자이용 
char ch='z' 		
 */
		char ch = '9';
		boolean b = ('a' <= ch || ch<= 'z')? true:('A'<= ch || ch <= 'Z')? true:( '0'<= ch || ch <='9' )? true : false;
		System.out.println("b : " + b);

/*
문제3
문자형변수 ch의 값을 소문자로 변경하는 코드를 작성하세요
char ch='A' 
*/
		char ch1 = 'A';
		
		char result1 = Character.toLowerCase(ch1);
		System.out.println("result :" + result1);
/*
4장 조건문과 반복문 (if, for, while, do~while)	

문제 4
Math.random() 을 이용하여 1~6 사이의 임의의 정수를 변수 value 에 
저장하는 코드를 작성하세요 	
*/
		int value = (int)(Math.random()*6)+1;
		System.out.println("value : " + value);
/*
문제 5
1~100 까지의 합을 구하는 코드를 작성하세요 
 */
		
		int sum = 0;
		for (int i = 1; i<100; i ++) {
			sum = sum + i;
			
			
		}System.out.println("1~100 까지의 합 : " + sum);
		
/*
문제6 
1~100사이의 랜덤수를 발생시켜 저장한다
 임의의 값을 입력받아 랜덤값을  맞추는 코드 작성하세요
 맞출때가지 계속 입력받고 맞추면 종료한다.
*/
	
		int random = (int)(Math.random()*100)+1;
		int input = 0;
		Scanner sc = new Scanner(System.in);
		System.out.println(random);
		while(true) {
			System.out.println("입력값 >");
			input = sc.nextInt();
			if(random == input) {
				System.out.println("정답입니다! 종료");
				break;
			}else {
				System.out.println("다시 시도 해주세요.");
				
			}
			
		}
	
	
	}

}
