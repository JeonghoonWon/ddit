package PdfBox;

//PdfBoxWriteText

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

public class PdfboxExample1 {	// PDFBOX를 이용해 PDF파일을 만드는 예제입니다.

   public static void main(String[] args) throws IOException {
         // 1) 새로운 PDDocument 객체를 생성 합니다
      try (PDDocument doc = new PDDocument()) {	
         
         // 2) 새로운 PDF 페이지 객체를 생성 합니다.
         PDPage myPage = new PDPage(); 
         
        
         // 3) 새로운 PDF페이지를 생성합니다.
         doc.addPage(myPage);         
         InputStream fontStream = new FileInputStream("D:/D_Other/gulim.ttc");
         PDType0Font fontGulim = PDType0Font.load(doc, fontStream);
        
         
         // 4) PDF 파일에 글을 입력하기 위해선 PDPageContentStream 객체를 생성합니다.
         try(PDPageContentStream cont = new PDPageContentStream(doc, myPage)) {
            // 5) 글쓰기 내용 시작점 입니다.
            cont.beginText();      
            cont.setFont(fontGulim,12);
            // 6) 글씨 폰트 설정합니다.
            cont.setFont(PDType1Font.TIMES_ROMAN, 12);            
            // 7) 글의 줄 간격을 정해줍니다.
            cont.setLeading(50.5f);            
            // 8) 기준점이 왼쪽 하단 모서리를 기점으로(X,Y) 만큼 시작 위치가 변경됩니다.
            cont.newLineAtOffset(25, 700);	// 라인 위치                        
            // 9) 문서의 내용을 첨부합니다.
            String line1 = "헬로자바";
            		            
            // 10) 문서 내용을 보여줍니다.
            cont.showText(line1);
            
            // 11) 줄을 변경합니다.
            cont.newLine();
            
            String line2 = "Hello PDFBox!!";
            cont.showText(line2);
            
            cont.newLine();
            
            System.out.println("PDF 파일 생성 완료");
            cont.endText();	// 11) 문서를 닫습니다.        	 
         }      
         //12) PDF 파일명을 지정합니다.
         doc.save("PdfBoxWriteText.pdf");
      }
      
      	// 13) Chrome 으로 방금 생성한 pdf 파일을 바로 실행해서 확인 합니다.
      	String fileName = URLEncoder.encode("PdfBoxWriteText.PDF", "UTF-8"); 
      	
   		String chrome = "C:/Program Files/Google/Chrome/Application/chrome.exe";
   		try {
   			new ProcessBuilder(chrome,fileName).start();
   		} catch (IOException e) {
   			e.printStackTrace();
   		}

   }

}


