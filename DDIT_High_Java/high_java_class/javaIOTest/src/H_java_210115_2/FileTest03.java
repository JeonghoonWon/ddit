package H_java_210115_2;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JFileChooser;
import javax.swing.JPanel;

public class FileTest03 {

	public static void main(String[] args) {
		FileTest03 test = new FileTest03();
		
		// File file = new File("d:/A_TeachingMaterial");
		File file = test.getDir();
		if(file!=null){
		test.displayFileList(file.getParentFile());
		}
	}
	
	// 디렉토리를 매개변수로 받아서 해당 디렉토리에 있는
	// 모든 파일과 디렉토리 목록을 출력하는 메서드
	
	
	public void displayFileList(File dir) {
		if(!dir.isDirectory()) {
			System.out.println("디렉토리(폴더)만 가능합니다.");
			return;
			
		}
		
		System.out.println("[" + dir.getAbsolutePath()+"] 디렉토리 내용");
		
		// 해당 디렉토리 안에 있는 모든 파일과 디렉토리 목록을 구한다.
		File[] files = dir.listFiles();
		//String[] files = dir.list();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm"); // a: 오전 오후
	
		// 가져온 파일과 디렉토리 목록 개수만큼 반복
		for(int i = 0; i<files.length; i++) {
			String fileName = files[i].getName();
			
			// 파일의 속성(읽기, 쓰기, 히든파일, 디렉토리 인지 구분)
			String attr = "";	
			String size = ""; //파일 크기
		
			if(files[i].isDirectory()){
				attr = "<DIR>";
			}else {
				size = files[i].length() + "";
				
				attr = files[i].canRead() ? "R" : "";
				attr = files[i].canWrite() ? "W" : "";
				attr = files[i].isHidden() ? "H" : "";
			}
			
			System.out.printf("%s %5s %12s %s\n", 
					sdf.format(new Date(files[i].lastModified())),attr, size, fileName);
		
		}
	
	}
	// 
	public File getDir() {
		JFileChooser filechooser = new JFileChooser();
		
		//File curr = new File(System.getProperty("user.dir"));
		File curr = new File("d:/");
		//filechooser.setCurrentDirectory(curr);	// 열기를 할 디렉토리 설정
		
		// 디렉토리만 선택하기
		filechooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		
		int result = filechooser.showOpenDialog(new JPanel());
		//int result = filechooser.showSaveDialog(new JPanel());
		
		File selectFile = null;
		if(result == JFileChooser.APPROVE_OPTION){
			selectFile = filechooser.getSelectedFile();
			
		}
		return selectFile;
		
		
	}
	
	
}
