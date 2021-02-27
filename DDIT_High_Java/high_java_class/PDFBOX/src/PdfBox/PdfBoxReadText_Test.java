package PdfBox;

import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

public class PdfBoxReadText_Test { // PDFBOX를 이용해 기존의 pdf 파일에서 콘텐츠를 출력하는 예제입니다.


		  public static void main(String[] args) throws IOException {
			  	// 1) 기존 pdf 파일을 적용할 객체를 생성합니다.
		        File myFile = new File("노트북.pdf");
		        
		        // 2) pdf 파일을 적용시킵니다.
		        try (PDDocument doc = PDDocument.load(myFile)) {
		        	
		        	// 3) pdf 파일에서 문자를 추출 합니다.
		            PDFTextStripper stripper = new PDFTextStripper();
		            String text = stripper.getText(doc);

		            //4) pdf 의 글자를 출력합니다.
		            System.out.println(text);
		        }
		    }
		}