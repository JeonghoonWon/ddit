package H_java_210122;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class TcpMultiChatClient {
	
	//클라이언트 시작 메서드
   public void clientStart() {
	   Socket socket = null;
	   try {
		String serverIp = "localhost";
		socket = new Socket(serverIp,7777);
		System.out.println("서버에 연결되었습니다.");
		System.out.println();
		
		// 메시지 전송용 쓰레드 생성
		ClientSender sender = new ClientSender(socket);
		
		// 메시지 수신용 쓰레드 생성
		ClientReceiver receiver = new ClientReceiver(socket);
		
		sender.start();
		receiver.start();
		
	   } catch (Exception e) {
		// TODO: handle exception
	
	   } /*finally {
		   if(socket != null) 
			   try{socket.close();
			   }catch(IOException e){
				   
			   }
		   
	   }*/
	   
      
      
   }

   // ------------------------------------------------
   // 메시지 전송용 쓰레드
   class ClientSender extends Thread {
      private Socket socket;
      private DataInputStream dis;
      private DataOutputStream dos;
      private String name;
      private Scanner scan;

      public ClientSender(Socket socket) {
         this.socket = socket;
         scan = new Scanner(System.in);
         try {
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
            if (dos != null) {
               // 처음 클라이언트 프로그램이 시작하면 자신의 대화명을 입력해야하함
               // 서버로 전송하고, 대화명의 중복 여부를 feedback으로 받아서 확인 한다.
               System.out.print("대화명 : ");
               String name = scan.nextLine();

               while (true) {
                  dos.writeUTF(name); // 대화명 전송
                  // 대화명의 중복 여부를 받는다.
                  String feedBack = dis.readUTF();
                  if ("이름중복".equals(feedBack)) {
                     System.out.println(name + "중복된 이름입니다!!!!");
                     System.out.print("다른 대화명을 입력하세요");
                     name = scan.nextLine();

                  } else {
                     this.name = name + "이름으로 대화방에 참여했습니다.";
                     break;
                  }
               }
            }
         } catch (Exception e) {

         }

      }//생성자 끝

      @Override
      public void run() {
         try {
            while (dos!=null) {
               //키보드로 입력한 메시지를 서버로 전송한다.
               dos.writeUTF("["+name+"] 이름으로 대화를 전송합니다.");;
               
               
               
            }
            
            
         } catch (Exception e) {
            // TODO: handle exception
         }
      
      
      }
      
   }

   // 메시지 수신용 쓰레드
   class ClientReceiver extends Thread {
      private Socket socket;
      private DataInputStream dis;
      
      //생성자
      public ClientReceiver(Socket socket){
         this.socket = socket;
         try {
            
            dis = new DataInputStream(socket.getInputStream());

            
         } catch (Exception e) {
            // TODO: handle exception
         }
         
         
         
      }
      
      
      @Override
      public void run() {
         try {
            while (dis!=null) {
               //키보드로 입력한 메시지를 서버로 전송한다.
               System.out.println(dis.readUTF());
         
               
               
            }
            
            
         } catch (Exception e) {
            // TODO: handle exception
         }
      
      
      
      }
      
      
      
   }

   public static void main(String[] args) {
         new TcpMultiChatClient().clientStart();      
      
      
      
   }
   
   
   
   
   
}