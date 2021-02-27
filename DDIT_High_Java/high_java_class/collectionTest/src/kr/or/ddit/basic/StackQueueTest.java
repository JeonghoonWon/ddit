package kr.or.ddit.basic;

import java.util.LinkedList;

public class StackQueueTest {
	
	public static void main(String[] args) {
		/*
		 * 
		 * Stack : 데이터를 넣고 꺼내올때 나중에 넣은 데이터가 먼저 나온다. 입구와 출국 한 곳. 꺼내온 데이터는 사라진다. => 후입선출(LIFO) 의 자료 구조
		 * 
		 * 
		 * Queue : 선입선출(FIFO) 의 자료 구조
		 * 
		 * 
		 *  - Stack 과 Queue 는 LinkedList를 이용하여 사용 할 수 있다. 
		 * 
		 */
				
		/*
		Stack 의 명령
		 1. 자료 입력 : push(입력값)
		 2. 자료 출력 : 
		 	- pop() ==> 자료를 꺼내온 후 꺼내온 자료를 Stack 에서 삭제한다.
			- peek() ==> 자료를 삭제하지 않고 꺼내온다.(주료 자료 확인용으로 사용)
		
		
		*/
		
		LinkedList<String> stack = new LinkedList<>();
		
		stack.push("홍길동");
		stack.push("일지매");
		stack.push("강감찬");
		stack.push("변학도");
		
		System.out.println("현재 stack 값 : " + stack);   // 가장 먼저 입력된 "홍길동"이 맨 아래로 
		
		String data = stack.pop();
		System.out.println("꺼내온 값 : " + data);			// 변학도
		System.out.println("꺼내온 값 : " + stack.pop());	// 강감찬
		
		System.out.println("stack 남아있는 값 : " + stack);	// 일지매 ,홍길동
		
		stack.push("성춘향");
		System.out.println("추가가 된 stack 값 : " + stack); // 성춘향, 일지매 , 홍길동
		
		System.out.println("꺼내온 값 :" + stack.pop());	// 성춘향
		System.out.println("stack 남아있는 값 : " + stack);	// 일지매, 홍길동
		
		System.out.println();
		System.out.println("삭제없이 꺼내온 값 : " + stack.peek()); //일지매
		System.out.println("stack 남아있는 값 : " + stack);		 // 일지매, 홍길동
		
		/*
		 Queue의 명령
		 1. 자료 입력 : offer(입력값)
		 2. 자료 출력 :
		 		- poll() ==> 자료를 꺼내온 후 Queue 에서 꺼내온 자료를 삭제한다.
		 		- peek() ==> 삭제없이 자료를 꺼내온다.
		 */
		
		LinkedList<String> queue = new LinkedList<>();
		
			queue.offer("홍길동");
			queue.offer("일지매");
			queue.offer("강감찬");
			queue.offer("변학도");
	
			System.out.println("현재 queue 값 : " + queue);      // [홍길동, 일지매, 강감찬, 변학도]   // 데이터의 뒤쪽으로 데이터가 쌓이는 것

			String temp = queue.poll();
			System.out.println("꺼내온 값 : " + temp);			 //홍길동
			System.out.println("꺼내온 값 : " + queue.poll());   //일지매
			System.out.println("현재 queue값 : " + queue);		 // [강감찬, 변학도]
			
			
			
			queue.offer("성춘향");
			System.out.println("현재 queue값 : " + queue);		  //[강감찬, 변학도, 성춘향]
			System.out.println();
			
			System.out.println("꺼내온 값 : " + queue.poll());				//강감찬
			System.out.println("현재 queue값 : " + queue);					//[변학도, 성춘향]
			System.out.println();
			
			System.out.println("삭제 없이 꺼내온 값 : " + queue.peek());		//변학도
			System.out.println("현재 queue값 : " + queue);					//[변학도, 성춘향]
			
	
	}

}
