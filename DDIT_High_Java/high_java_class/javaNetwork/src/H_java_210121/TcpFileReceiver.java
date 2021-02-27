package H_java_210121;

import java.io.DataInputStream;
import java.net.Socket;

public class TcpFileReceiver extends Thread {
	private Socket socket;
	private DataInputStream dis;
	
	// 생성자
	public TcpFileReceiver(Socket socket) {
		this.socket = socket;
		
		try {
			dis = new DataInputStream(socket.getInputStream());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@Override
	public void run() {
	while(dis != null) {
		try {
			System.out.println(dis.readUTF());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	}
	
}

	