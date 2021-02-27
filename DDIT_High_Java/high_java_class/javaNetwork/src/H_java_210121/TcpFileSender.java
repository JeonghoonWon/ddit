package H_java_210121;


	import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

	// 이 클래스는 소켓을 통해서 메시지를 보내는 역할을 담당하는 클래스이다.

	public class TcpFileSender extends Thread {

		private Socket socket;
		private DataOutputStream dos;
		private Scanner scan;
		private String name;	// 접속한 사람의 이름이 저장될 변수
		
		// 생성자
		public TcpFileSender(Socket socket) {
			this.socket = socket;
			scan = new Scanner(System.in);
			
			/*//접속한 사람의 이름 받아오기 
			System.out.println("이름 입력 >>");
			name = scan.nextLine();*/
			
			try {
				File file = new File("D:/D_Other/Coca-Cola-logo.png");
				if(!file.exists()){
					System.out.println(file.getPath() + "파일이 없습니다.");
					System.out.println("복사 작업을 중지합니다.");
					return;
				}
				try {
					// 복사할 파일 스트림 객체 생성
					FileInputStream fin = new FileInputStream(file);
					// Buffered 를 사용하면 기능이 향상 된다.
					BufferedInputStream bis = new BufferedInputStream(fin);
					
					// 저장될 파일 스트림 객체 생성
					FileOutputStream fos = new FileOutputStream("d:/D_Other/data/복사본-Coca-Cola-logo.png");
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					System.out.println("복사 시작...");
					
					int data;
					
					while((data=bis.read())!= -1) {
						bos.write(data);
					}
					bos.flush();
					
					// 스트림 완료 
					bis.close();
					bos.close();
					
					
					System.out.println("복사 완료...");
					
				}catch (IOException e) {
					System.out.println("복사 실패");
				}
					
			dos = new DataOutputStream(socket.getOutputStream());
			
			} catch (IOException e) {
				// TODO: handle exception
			}
			
		}
		@Override
		public void run() {
			while(dos!=null) {
				try{
					// 키보드로 입력한 메시지를 상대방에게 보낸다.
					dos.writeUTF(name + " : " + scan.nextLine());
					
				}catch (Exception e){
					
				}
			}
		}
		
	}


