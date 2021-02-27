package H_java_210122;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;

public class UdpClient {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		// 수신용, 송신용 패킷 객체변수 선언
		DatagramPacket inpacket, outpacket;
		
		// 수신받은 데이터가 저장될 byte형 배열 선언
		byte[] bMsg = new byte[512];
		
		try {
			// 포트번호를 지정하지 않고 Socket 객체 생성 (클라이언트용)
			DatagramSocket socket = new DatagramSocket();
			
			// 접속할 곳(서버) 의 주소 생성
			//InetAddress address =InetAddress.getByName("192.168.0.81");
			InetAddress address =InetAddress.getByName("localhost");
			//InetAddress address =InetAddress.getByName("127.0.0.1"); 위와 동일
			
			while(true){
				// 전송할 메시지 입력
				System.out.println("보낼 메시지 입력 : ");
				String msg = scan.nextLine();
				
				if("/end".equals(msg)){	// 메시지 중지 여부 검사
					break;
				}
				byte[] sendMsg = msg.getBytes();
				// 전송할 패킷 객체 생성
				outpacket = new DatagramPacket(sendMsg,sendMsg.length,address,8888);
				
				// 전송하기
				socket.send(outpacket);
				
				//------------------------------------------------------
				// 서버에서 온 데이터를 받아서 출력하기
				
				// 수신용 패킷객체 생성
				inpacket = new DatagramPacket(bMsg, bMsg.length);
				
				// 수신하기
				socket.receive(inpacket);
				
				System.out.println("서버의 응답 데이터 : " + new String(bMsg, 0, inpacket.getLength()));
				
				System.out.println();
			}// while 문
			
			System.out.println("통신 끝...");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		

	}

}
