package H_java_210114;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Vector;

/*
 
 	Vector, Hashtable 등 예전부터 존재하던 Collection 객체들은
 	내부에 동기화 처리가 되어 있다.
 	
 	그런데, 새로 구성된 Collection 객체들은 동기와 처리가 되어 있지 않다.
 	그래서, 동기화가 필요한 프로그램에서 이런 Collection 객체를 사용하려면
 	동기화 처리를 한 후에 사용해야 한다.
 	
 
 
 */
public class ThreadTest19 {   // 쓰레드 안에서 데이터를 처리할땐 동기화 처리를 해주느게 좋다.
	private static Vector<Integer> vec = new Vector<>();
	
	// 동기화 처리가 되지 않은 List
	private static List<Integer> list = new ArrayList<>();
	
	// 동기화 처리를 한 List
	private static List<Integer> list2 = Collections.synchronizedList(new ArrayList<Integer>());
	
	
	public static void main(String[] args) {
		// 익명 구현체
		Runnable r = new Runnable() {
			
			@Override
			public void run() {
				for(int i = 0; i<10000; i++) {
					//vec.add(i);
					
					//list.add(i);
					list2.add(i);
					
				}
				
			}
		};
		//익명 구현체는 여기까지 ---------------------------------
	
		Thread[] ths = new Thread[]{
				new Thread(r), new Thread(r), new Thread(r),
				new Thread(r),new Thread(r)
		};
		
		for(Thread th : ths) {
			th.start();
		}
		
		for(Thread th : ths) {
			try {
				th.join();
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
			
		}
		
		//System.out.println("vec의 개수 : " + vec.size());		
		// 벡터는 동기화 처리가 되어잇어서 add로 100개의 데이터를 입력할 경우 기존 데이터 10개를 입력 받고 10개 데이터를 동기화 시키고, 새롭게 10개 백터를 만들고 다시 데이터를 받는다.
		//System.out.println("list의 개수 : " + list.size());
		System.out.println("list2의 개수 : " + list2.size());		
		// 리스트(배얄) 은 동기화 처리가 되어 있지가 않아 add가 많아지면 기존 자료를 동기화 하지 못하고 다른 데이터가 침범해서 오류가 생긴다. 
		// ex) add 로 100개 데이터 입력할 경우, 기존 데이터10 개를 입력 받고 10개 데이터를 동기화 시키지 못하며 데이터가 겹지거나 다른곳으로 넘어가게 된다.
	}

}
