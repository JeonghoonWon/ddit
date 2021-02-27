package H_java_210118;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class FileIOTest01 {

	public static void main(String[] args) {
		// FileInputStream 을 이용한 파일 내용 읽기
		
		try {
			// 읽어올 파일을 인수값으로 지정해서 FileInputStream 객체를 생성한다.
			// 방법1)
			// 	new FileInputStream("읽어올 파일의 경로 및 파일명"
			//FileInputStream fin = new FileInputStream("d:/D_Other/text.txt");
			
			// 방법2)
			// File f = new File("읽어올 파일의 경로 및 파일명")
			// new FileInputStream(파일객체변수);
			File file = new File("d:/D_Other/test.txt");
			FileInputStream fin= new FileInputStream(file);
			
			int c;	// 읽어온 데이터를 저장할 변수
			while( (c=fin.read())!= -1 ){
				// 읽어온 데이터르 화면에 출력하기
				System.out.print((char)c);
			}
			
			fin.close();	// 작업 완료 후 스트림 객체 닫기
			
		} catch (IOException e) {
			// e.printStackTrace();
			System.out.println("파일 입출력 오류 입니다.");
		}

	}

}
