package itext;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

// ItextExample1.PDF 파일을 만드는 예제 입니다.

public class ItextExample1 {	

	public static void main(String[] args) {

		// 1) com.lowagie.text.Document 클래스 인스턴스를 생성합니다.
		Document document = new Document();	
		String fileName = Paths.get("").toAbsolutePath().toString()+"/ItextExample1.PDF";

		try {
			// 2) Writer와 Document 사이의 연관을 맺어줍니다.
			// Writer를 이용해 문서를 하드디스크에 생성할 수 있습니다. ItextExample1.PDF 파일을 작성해보겠습니다.
			PdfWriter.getInstance(document, new FileOutputStream(fileName));	

			// 3)  문서를 오픈합니다.
			document.open();
			// 4) 문서에 내용을 첨부합니다.
			document.add(new Paragraph("This is first Itext example?"));	
			System.out.println(fileName+" 파일을 성공적으로 생성하였습니다.");

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} finally {
			// 5) 문서를 닫습니다.
			document.close();	
		}

		// 6) Chrome 으로 방금 생성한 pdf 파일을 바로 실행해서 확인 합니다.
		String chrome = "C:/Program Files/Google/Chrome/Application/chrome.exe";
		try {
			new ProcessBuilder(chrome,fileName).start();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
