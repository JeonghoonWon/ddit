package H_java_210115_1;

public class ThreadTest21 {

	public static void main(String[] args) {
		DataBox databox = new DataBox();
		
		ProducerThread pt = new ProducerThread(databox);
		ConsumerThread ct = new ConsumerThread(databox);
		
		pt.start();
		ct.start();
		
	}

}


// 데이터를 공통으로 사용하는 클래스
class DataBox{
	private String data;
	
	// data변수의 값이 null 이면 문자열이 채워질때까지 기다리고 
	// data변수에 값이 있으면 해당 문자열을 반환하는 메서드
	// 데이터를 반환 후에는 data 변수값을 null 로 만든다.
	public synchronized String getData() {
		if(data==null) {
			try {
				wait();
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
			
		}
		
		String returnData = data;
		System.out.println("쓰레드가 읽은 데이터 :" + data);
		data = null;
		
		notify();
		return returnData;
		
	}
	
	// data 변수의 값이 있으면  data 변수값이 null 이 될때까지 기다린다.
	// data 변수의 값이 null 이 되면 새로운 data 값을 저장한다.
	public synchronized void setData(String newData) {
		if(data !=null) {
			try {
				wait();
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
			
		}
		
		data = newData;
		System.out.println("Thread에서 새로 저장한 데이터 : " + data);
	
		notify();
	}
	
	
}

// 데이터를 넣어주는 쓰레드
class ProducerThread extends Thread {
	private DataBox databox;

	public ProducerThread(DataBox databox) {
		this.databox = databox;
	}
	
	
	@Override
	public void run() {
		for(int i = 1; i<=3; i++) {
			databox.setData(i +"번째 공급데이터 ");
		}
	}
	
	
}

// 데이터를 꺼내서 사용하는 쓰레드
class ConsumerThread extends Thread {
	private DataBox databox;

	//생성자
	public ConsumerThread(DataBox databox) {
		this.databox = databox;
	}
	
	@Override
	public void run() {
		for(int i = 1; i<=3; i++) {
			String data = databox.getData();
			// 꺼내온 데이터를 쓰임새에 맞게 사용하는 코드
			
			
		}
	}
	
}