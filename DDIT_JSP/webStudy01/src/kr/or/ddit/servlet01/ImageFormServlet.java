package kr.or.ddit.servlet01;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class ImageFormServlet extends HttpServlet{

	protected void doGet(HttpServletRequest req,
                     HttpServletResponse resp)
              throws ServletException,
                     IOException{
       
        resp.setContentType("text/html;charset=UTF-8");
        
		String folder = "d:/contents";
		File contents = new File(folder);
        String[] children = contents.list();	
        
       
     
        StringBuffer html = new StringBuffer( "<html><body>");
        
        html.append("<form action='image.do'><select name ='image'>");
        for(String child : children){
    		String mime =  getServletContext().getMimeType(child);
    		if(mime!=null && mime.startsWith("image/")) {
    			
    			 html.append(String.format("<option>%s</option>",child));
    			
    		}
           

        }
        html.append("</select><input type='submit' value='전송'/></form></body></html>");
        PrintWriter out = null;
        try {
        	out = resp.getWriter();
        	out.println(html);
        }finally {
        	if(out!=null)
        		out.close();
        }
	}
	
}        
	// 1. 이미지 아닌 코드 걸러낸다
	// 2. 개발환경 구축 
