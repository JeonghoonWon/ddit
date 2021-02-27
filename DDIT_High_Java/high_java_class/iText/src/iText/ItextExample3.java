package itext;

import java.awt.Color;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

// PDF에 테이블을 생성하는 예제입니다

public class ItextExample3 {	
		
	public static void main(String[] args) {
		
		// 1) com.lowagie.text.Document 클래스 인스턴스를 생성합니다.
		Document document = new Document();	
		String fileName = Paths.get("").toAbsolutePath().toString()+"/ItextExample3.PDF";
		
		try {
			// 2) Writer와 Document 사이의 연관을 맺어줍니다.
			PdfWriter.getInstance(document, new FileOutputStream(fileName));	
			
			// 3)  문서를 오픈합니다.
			document.open();
			
			// 4) 한글 입력을 위해 폰트를 선택해줍니다.
			String fontFace = "HYGoThic-Medium";
			
			// 5) 글자 방향을 선택해줍니다. (UniKS-UCS2-H : 가로, UniKS-UCS2-V : 세로)
			String fontNameH = "UniKS-UCS2-H";

			// 6) 준비한 설정값들을 활용해 Font 객체를 생성해줍니다. 생성자에 들어가는 인자는 BaseFont 와 사이즈 입니다.
			BaseFont bf = BaseFont.createFont(fontFace, fontNameH, BaseFont.NOT_EMBEDDED);
			Font font = new Font(bf, 20);
			
			// 7) 테이블을 생성해줍니다.
			// com.lowagie.text.Table 에는 세가지 생성자가 있습니다.
			// Table (int columns), Table(int columns, int rows), Table(Properties attributes)

			Table table = new Table(1, 1);	// 가로 세로 1개짜리 테이블 생성
			table.setBorderWidth(2);	// 테이블 테두리 두께 설정 : 2
			table.setBorderColor(new Color(0,0,255));	// 테두리 색상 파랑색으로 설정
			table.setPadding(5); // padding 설정
			table.setSpacing(5); // spacing 설정
			table.setBackgroundColor(new Color(222,222,222));	// 테이블 배경색 설정
			
			// 8) 테이블에 cell을 추가해 문장도 작성할 수 있습니다.
			Cell cell = new Cell(new Paragraph("테이블 생성 예제입니다.", font));
			table.addCell(cell);
			
			// 9) 문서에 작성해둔 테이블 객체를 추가해줍니다.
			document.add(table);
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			document.close();	
		}
		
		// 10) Chrome 으로 방금 작성한 파일을 바로 열어서 확인해봅니다.
		String chrome = "C:/Program Files/Google/Chrome/Application/chrome.exe";
		try {
			new ProcessBuilder(chrome,fileName).start();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
