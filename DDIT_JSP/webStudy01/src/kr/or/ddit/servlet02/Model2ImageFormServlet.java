package kr.or.ddit.servlet02;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/02/imageForm.do")
// 현재 라는 시점 자체가 존재하지않기 때문에 상대주소를 쓸 수 없다.
public class Model2ImageFormServlet extends HttpServlet{
   private ServletContext application;   // 초기화 라이플 콜백이 돌았을 때 
   
   @Override
   public void init(ServletConfig config) throws ServletException {
      super.init(config);
      application = config.getServletContext();
   }
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // Service 와 doGet 방식
      
      String folder = "D:\\contents\\images";
      File contents = new File(folder);
      String[] children = contents.list(new FilenameFilter() {
         
         @Override
         public boolean accept(File dir, String name) {
            String mime = application.getMimeType(name);
            return mime != null && mime.startsWith("image/");
         }
      });
      
      req.setAttribute("children", children);
      String view = "/WEB-INF/views/imageForm.jsp";
      req.getRequestDispatcher(view).forward(req, resp);
   }
}