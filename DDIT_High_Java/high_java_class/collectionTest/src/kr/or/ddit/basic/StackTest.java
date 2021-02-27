package kr.or.ddit.basic;

import java.util.LinkedList;

public class StackTest {

	public static void main(String[] args) {
		Browser b = new Browser();
		
		b.goURL("1. 네이버");
		b.history();
		
		b.goURL("2. 야후");
		b.history();
		
		b.goURL("3. 구글");
		b.history();
		
		b.goURL("4. 다음");
		b.history();
		
		System.out.println("뒤로가기 후 ...");
		b.goback();
		b.history();
		
		System.out.println("뒤로가기 후 ...");
		b.goback();
		b.history();
		
		System.out.println("앞으로 가기 후 ...");
		b.goForward();
		b.history();
		
		System.out.println("새로운 사이트 접속 후...");
		b.goURL("5.네이트");
	}

}



// 웹 브라우저의 앞으로 가기, 뒤로가기 기능 구현해보기 (스택 이용)

class Browser{
	private LinkedList<String> back; // 이전 방문 내역이 저장될 스택
	private LinkedList<String> forward; // 다음 방문 내역이 저장될 스택
	private String currentURL; // 현재 페이지
	
	
	// 생성자
	public Browser() {
		back = new LinkedList<>();
		forward = new LinkedList<>();
		currentURL = "";
	}
	
	
	// 사이트를 방문하는 메서드 ==> 매개변수에 방문할 URL 이 저장된다.
	public void goURL(String url) {
		System.out.println(url + "사이트로 접속합니다.");
		if(currentURL != null && !"".equals(currentURL)) {			// currentURL 이 null 값이고 
		back.push(currentURL);
		
		}
		currentURL = url;
	}
		// 뒤로가기
		public void goback(){
			//isEmpty() ==> List 가 비어있으면 true, 그렇지 않으면 false
			if(!back.isEmpty()){
				// 현재 URL 을 forward 스택에 추가하고
				forward.push(currentURL);
				// back 스택에서 꺼내온 값을 현재 URL 로 한다.
				currentURL = back.pop();
			
		}
		
	}	
	
		// 앞으로 가기
		public void goForward(){
			if(!forward.isEmpty()) {
				back.push(currentURL);		//현재 URL 을 back 에 추가
				currentURL = forward.pop(); // forward에서 꺼내온 값을 현재 URL 로 한다.
			}
		}
	
		// 방문 기록 확인하기
		public void history() {
			System.out.println();
			System.out.println("----------------------------------------");
			System.out.println("\t 방 문 기 록");
			System.out.println("----------------------------------------");
			System.out.println("back	==> " + back);
			System.out.println("current	==> " + currentURL);
			System.out.println("forward ==> " + forward);
			System.out.println();
		
		}
		
}