package itext;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

// PDF 에 한글을 작성하는 예제입니다. iTextAsian.jar 파일이 꼭 필요합니다.
// 앞의 예제에서 한글이 입력이 되지 않은 것을 확인 할 수 있었습니다.

public class ItextExample2 {	
		
	public static void main(String[] args) {
		
		// 1) com.lowagie.text.Document 클래스 인스턴스를 생성합니다.
		Document document = new Document();	
		String fileName = Paths.get("").toAbsolutePath().toString()+"/ItextExample2.PDF";
		
		try {
			// 2) Writer와 Document 사이의 연관을 맺어줍니다.
			PdfWriter.getInstance(document, new FileOutputStream(fileName));	
			
			// 3)  문서를 오픈합니다.
			document.open();
			
			// 4) 한글 입력을 위해 폰트를 선택해줍니다. iTextAsian.jar에서는 다음 3개의 폰트를 사용할 수 있습니다.
			// HYGoThic-Medium, HYSMyeongJo-Medium, HYSMyeongJoStd-Medium
			String fontFace = "HYGoThic-Medium";
			String fontFace2 = "HYSMyeongJo-Medium";
			
			// 5) 글자 방향을 결정하는 CMap은 두가지가 있습니다. 
			// UniKS-UCS2-H : 가로, UniKS-UCS2-V : 세로
			String fontNameH = "UniKS-UCS2-H";
			String fontNameV = "UniKS-UCS2-V";

			// 6) 준비한 설정값들을 활용해 Font 객체를 생성해줍니다. 생성자에 들어가는 인자는 BaseFont 와 사이즈 입니다.
			BaseFont bf = BaseFont.createFont(fontFace, fontNameH, BaseFont.NOT_EMBEDDED);
			BaseFont bf2 = BaseFont.createFont(fontFace2, fontNameV, BaseFont.NOT_EMBEDDED);
			Font font = new Font(bf, 20);
			Font font2 = new Font(bf2, 15);
			
			// 7) 문서에 2개의 paragraph를 각기 다른 본트로 첨부해 보겠습니다.
			document.add(new Paragraph("안녕하세요", font));	
			document.add(new Paragraph("반갑습니다", font2));
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			document.close();	
		}
		
		// 8) Chrome 으로 방금 작성한 파일을 바로 열어서 확인해봅니다.
		String chrome = "C:/Program Files/Google/Chrome/Application/chrome.exe";
		try {
			new ProcessBuilder(chrome,fileName).start();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
