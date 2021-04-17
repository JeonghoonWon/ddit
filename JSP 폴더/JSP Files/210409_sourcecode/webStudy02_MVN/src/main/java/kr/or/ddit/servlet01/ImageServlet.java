package kr.or.ddit.servlet01;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import java.io.*;
import java.net.URLEncoder;

@WebServlet("/01/image.do")
public class ImageServlet extends HttpServlet{

	protected void doGet(HttpServletRequest req,
                     HttpServletResponse resp)
              throws ServletException,
                     IOException{
		String imageFilename = req.getParameter("image");
		if(imageFilename==null || imageFilename.isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;	
		}
		String folder = "d:/contents";			 
		File imageFile = new File(folder, imageFilename);
		if(!imageFile.exists()) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		String mime = getServletContext().getMimeType(imageFilename);
		if(mime==null || !mime.startsWith("image/")) {
			resp.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
			return;
		}
		
		resp.setContentType(mime);		
		try(
			FileInputStream fis = new FileInputStream(imageFile);
			OutputStream os = resp.getOutputStream();
		){		
			byte[] buffer = new byte[1024];
			int pointer = -1;
			while((pointer = fis.read(buffer))!=-1){
				os.write(buffer, 0, pointer);
			}
		}
	}

}



















