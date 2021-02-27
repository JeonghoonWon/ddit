package PdfBox;

//PdfBoxCreateImage

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.graphics.image.LosslessFactory;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

public class PdfboxExample2 {

	public static void main(String[] args) throws IOException {
		// 1) 새로운 PDDocument 객체를 생성 합니다.
        try (PDDocument doc = new PDDocument()) {

        	// 2) 새로운 PDF 페이지 객체를 생성 합니다.
            PDPage myPage = new PDPage();
            // 3) 새로운 PDF페이지를 생성합니다.
            doc.addPage(myPage);

            // 4) 이미지 파일 위치를 저장하는 변수를 설정합니다.
            String imgFileName = "d:/d_other/Coca-Cola-logo.png";
            
            // 5) 가져온 이미지를 PDF에 쓰기 위해서 다음 과 같은 작업을 진행합니다.
            PDImageXObject pdImage = PDImageXObject.createFromFile(imgFileName, doc);
            
            // PDF 삽입 이미지 크기 지정합니다.
            int iw = 400;
            int ih = 250;
            
            // PDF 삽입 이미지 위치 지정합니다.
            float xOffset = 120f; 
            float yOffset = 450f; 

            // 6) PDF 파일에 글을 입력하기 위해선 PDPageContentStream 객체를 생성합니다.
            try (PDPageContentStream cont = new PDPageContentStream(doc, myPage)) {
                
            	// PDF 안에 이미지를 삽입합니다.
                cont.drawImage(pdImage, xOffset, yOffset, iw, ih);
            }
            
            // 7) PDF를 저장합니다.
            doc.save("PdfBoxCreateImage.pdf");
            System.out.println("PDF created!!");
            
            // 8) PDF 생성과 동시에 인터넷 창으로 띄웁니다.
            String chrome = "C:/Program Files/Google/Chrome/Application/chrome.exe";
    		try {
    			new ProcessBuilder(chrome,"PdfBoxCreateImage.pdf").start();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
        }
    }


}
