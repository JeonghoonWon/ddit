package PdfBox;

import java.io.IOException;

import org.apache.pdfbox.pdmodel.PDDocument;

public class PdfBoxTest {

	public static void main(String[] args) throws IOException {
		
		PDDocument document = new PDDocument();

		document.save("d:/test.pdf");
		System.out.println("PDF 파일 생성됨");

		document.close();

	}

}
