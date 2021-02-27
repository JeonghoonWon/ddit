package H_java_210121;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

	// 클라이언트가 보낸 파일을 받아서 'd:/d_other/data' 폴더에
	// 보낸 파일과 같은 이름으로 저장한다.


public class TcpFileServer {

	public static void main(String[] args) {
		
		// 서버 준비
		try {
			ServerSocket server = new ServerSocket(7777);
			System.out.println("서버가 접속을 기다립니다.");
			
			Socket socket = server.accept();
			
			System.out.println("파일클라이언트와 연결되었습니다.");
			System.out.println();
			
			System.out.println("접속 클라이언트 정보");
			System.out.println("IP 주소 : " + socket.getInetAddress().getHostAddress()); 
			System.out.println("------------------------------------------");
			
			TcpFileSender sender = new TcpFileSender(socket);
			TcpFileReceiver receiver = new TcpFileReceiver(socket);
			
			sender.start();
			receiver.start();
			
		
		} catch (IOException e) {
			// TODO: handle exception
		}

	}

}
