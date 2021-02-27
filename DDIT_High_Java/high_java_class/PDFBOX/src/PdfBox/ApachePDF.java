package PdfBox;

import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.pdmodel.*;


public class ApachePDF {

	public static void main(String[] args) {
		createEmptyDocument();
	}
	
	private static void createEmptyDocument() {
		try (final PDDocument doc = new PDDocument()) {
			final PDPage emptyPage = new PDPage();
			doc.addPage(emptyPage);
			
			doc.save("testEmptyPage.pdf");
			System.out.println("Created successfully!");
		} catch (IOException e) {
			System.out.println("Fail to create PDF while trying to create blank document - " + e);
		}

	}
}
