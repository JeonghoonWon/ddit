package H_java_210121;

import java.io.IOException;
import java.net.Socket;

public class TcpFileClient {

	public static void main(String[] args) {
		
		try {
			Socket socket = new Socket("localhost",7777);
			System.out.println("서버에 연결되었습니다.");
			
			TcpFileSender sender = new TcpFileSender(socket);
			TcpFileReceiver receiver = new TcpFileReceiver(socket);
			
			
		} catch (IOException e) {
			// TODO: handle exception
		}

	}

}
