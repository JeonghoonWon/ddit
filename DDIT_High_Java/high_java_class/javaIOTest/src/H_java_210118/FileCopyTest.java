package H_java_210118;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
	

	/*
	 문제)
		 'd:/d_other' 폴더에 있는 '코알라.jpg' 파일을
		 'd:/d_other/연습용' 폴더에 '복사본-코알라.jpg' 파일로 
		 복사하는 프로그램을 작성하시오.
		 
	 
	 */
public class FileCopyTest {

	public static void main(String[] args) {

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
			FileOutputStream fos = new FileOutputStream("d:/D_Other/연습용/복사본-Coca-Cola-logo.png");
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			System.out.println("복사 시작...");
			
			int data;	// 읽어온 데이터가 저장될 변수
			
		/*	while((data=fin.read())!= -1) {
				fos.write(data);
			}
			// 사용한 스트림 닫기
			fos.close();
			fin.close();
		*/	
			// 버퍼 스트림 이용하기
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
		
		
		/*	
		try {
			FileInputStream fis = new FileInputStream("D:/D_Other/코알라.jpg");
			FileOutputStream fos = new FileOutputStream("d:/D_Other/연습용/복사본-코알라.jpg");
			
			int c;
			while ((c=fis.read())!= -1) {
				
				fos.write(c);
				
			}
			fis.close();
			
			fos.close();
			
			System.out.println("실행완료.");
		} catch (IOException e) {
			System.out.println("실행실패.");
		}
*/
	}

}
