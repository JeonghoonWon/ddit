package H_java_210118;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class BufferedIOTest02 {

	public static void main(String[] args) {
		// 문자 기반의 Buffered 스트림 사용하기
		try {
			FileReader fr = new FileReader("./src/H_java_210115_2/FileTest01.java");
			BufferedReader br = new BufferedReader(fr);
			
			String temp = "";
			//readLine(); ==> 한 줄 단위로 읽어온다.
			for(int i=1; (temp=br.readLine())!=null;i++) { 
				System.out.printf("%4d : %s\n", i , temp);
			}
			br.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
