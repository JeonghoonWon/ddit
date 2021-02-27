package H_java_210118;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileIOTest02 {

	public static void main(String[] args) {
		// 파일에 데이터를 출력하는 연습
		try {
				// 파일 출력용 스트림 객체 생성
				FileOutputStream fos = new FileOutputStream("d:/D_Other/text.txt");
				
				for(char ch='A'; ch <='Z'; ch++) {
					// ch변수의 값을 파일로 출력한다.
					fos.write(ch);
				}
				
				System.out.println("작업 완료!!");
				fos.close();		// 쓰기 작업 완료 후 스트림 닫기
				
				
				//================================================
				// 위에 저장한 데이터를 읽어와 화면에 출력하시오.
		
				FileInputStream fin = new FileInputStream(("d:/D_Other/text.txt"));
				int c;
				while((c=fin.read())!= -1) {

					System.out.println((char)c);
					
				}
				fin.close();
											
		} catch (IOException e) {
			System.out.println("파일 입출력 오류 입니다.");
		}

	}

}
