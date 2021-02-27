package H_java_210118;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileIOTest05 {

	public static void main(String[] args) {
		// 한글이 저장된 파일 읽어오기
		
		try {
			//FileReader fr = new FileReader("d:/D_Other/test_ansi.txt");
			// ansi 파일은 출력시 글자가 깨진다.
			
			// ansi 파일 출력시 글자가 깨지지않게 하는 방법
			 FileInputStream fis = new FileInputStream("d:/D_Other/test_ansi.txt");
			
			// 기존 인코딩 방식으로 읽어온다.
			// 인코딩 방식 예시
			// - MS949 ==> 윈도우의 기본 한글 인코딩 방식(ANSI방식과 같다.)
			// - UTF-8 ==> 유니코드 UTF-8 인코딩 방식
			// - US-ASCII ==> 영문 전용 인코딩 방식
			
			//InputStreamReader isr = new InputStreamReader(fis,"ms949");
			//InputStreamReader isr = new InputStreamReader(fis,"UTF-8");
			InputStreamReader isr = new InputStreamReader(fis,"US-ASCII");
			int c;	
			System.out.println("[ansi]");
			//while((c=fr.read())!= -1) {
				while((c=isr.read())!= -1){
				System.out.print((char)c);
								
			}
			//fr.close();
			// 보조 스트림을 닫으면 보조 스트림에서
			// 사용한 기반이 되는 스트림도 자동으로 닫힌다.
			
		} catch (IOException e) {
			// TODO: handle exception
		}

		System.out.println("-------------------------------------");
		System.out.println("[utf-8]");	// 기본적으로 utf-8 형식의 파일을 받아온다.
		try {
			FileReader fr = new FileReader("d:/D_Other/test_utf8.txt");
			
			int c;
			while((c=fr.read())!= -1) {
				System.out.print((char)c);
								
			}
			fr.close();
			
		} catch (IOException e) {
			// TODO: handle exception
		}

	}

}
