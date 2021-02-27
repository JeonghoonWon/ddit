package itext;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

// iText 에서 이미지를 처리해주는 예제입니다. 클래스는 com.lowagie.text.Image 입니다.

public class ItextExample4 {	
		
	public static void main(String[] args) {
		
		// 1) com.lowagie.text.Document 클래스 인스턴스를 생성합니다.
		Document document = new Document();	
		String fileName = Paths.get("").toAbsolutePath().toString()+"/ItextExample4.PDF";
		try {
			// 2) Writer와 Document 사이의 연관을 맺어줍니다.
			PdfWriter.getInstance(document, new FileOutputStream(fileName));	
			
			// 3)  문서를 오픈합니다.
			document.open();
			
			// 4) 한글을 사용하기 위해 폰트를 설정해줍니다. 앞에서 충분히 다루었기 때문에 압축해서 한번에 표현했습니다.
			Font font = new Font(BaseFont.createFont("HYGoThic-Medium", "UniKS-UCS2-H", BaseFont.NOT_EMBEDDED), 20);
			
			// 5) 사용할 이미지 객체를 생성해줍니다. 
			//Image jpeg = Image.getInstance("ddit.jpg");
			
			// 6) 제가 선택한 이미지가 너무 커서 사이즈를 50%로 줄였습니다.
			//jpeg.scalePercent(50);
			
			// 7) document에 텍스트와 이미지를 추가해줍니다.
			document.add(new Paragraph("대덕인재개발원 상담실\n원장님과의 상담은 필수입니다.\n\n", font));
			//document.add(jpeg);
			
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
