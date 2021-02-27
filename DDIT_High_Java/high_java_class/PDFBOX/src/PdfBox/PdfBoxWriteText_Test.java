package PdfBox;

import java.io.IOException;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

public class PdfBoxWriteText_Test {

	public static void main(String[] args) throws IOException {
			// 새로운 document 생성
		try (PDDocument doc = new PDDocument()) {
			
			// 생성한 document 사용
			PDPage myPage = new PDPage();
			doc.addPage(myPage);
			
			try (PDPageContentStream cont = new PDPageContentStream(doc, myPage)) {
				// 글쓰기 내용 시작
				cont.beginText();
				
				// 글씨 폰트 설정
				cont.setFont(PDType1Font.TIMES_ROMAN, 12);
				
				// ????
				cont.setLeading(14.5f);
				// We start a new line of text with newLineAtOffset() method.
				// The origin of a page is at the bottom-left corner.
				cont.newLineAtOffset(25, 700);
				String line1 = "Hello JAVA!!";
				
				// 입력 보여주기
				cont.showText(line1);
				
				// 줄 변경
				cont.newLine();
				
				String line2 = "Hello PDFBox!!";
				cont.showText(line2);
                cont.newLine();
                
                cont.endText();
			}
			
			doc.save("PdfBoxWriteText.pdf");
		}

	}

}
