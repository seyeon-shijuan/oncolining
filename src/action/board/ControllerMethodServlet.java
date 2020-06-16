package action.board;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.board.BoardAllAction;
import action.ActionForward;

//중복해서 쓰게하지 말것
@WebServlet(urlPatterns= {"*.do"}, //*.do 하면 이게 호출된다.
  initParams = {@WebInitParam(name="properties",
           value = "method.properties")})
public class ControllerMethodServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private Properties pr = new Properties();
   private BoardAllAction action = new BoardAllAction();
   private Class[] paramType = new Class[] {HttpServletRequest.class,HttpServletResponse.class};
   
   @Override
   public void init(ServletConfig config) throws ServletException{
	   String props = config.getInitParameter("properties");
	   FileInputStream f = null;
	   try {
		   f=new FileInputStream
				   (config.getServletContext().getRealPath("/") + "WEB-INF/"+props);
		   //pr : /model2/hello.do=hello
		   pr.load(f);
		   f.close();
	   } catch (IOException e) {
		e.printStackTrace();
	   }
	}
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   request.setCharacterEncoding("euc-kr");
		   Object[] paramObjs = new Object[] {request,response};
		   ActionForward forward = null;
		   String command=null;
		   try {
			   //command : /model2/hello.do
			   command = request.getRequestURI().substring(request.getContextPath().length());
			   //methodName : hello
			   String methodName = pr.getProperty(command);
			   //BoardAllAction.class : BoardAllAction의 클래스 정보
			   // method : BoardAllAction 클래스의 hello(request,response)인 method 선택
			   Method method = BoardAllAction.class.getMethod(methodName, paramType);
			   //invoke: method 실행
			   //forward: new ActionForward() redirect가 false로 view는 null로 기본값이 세팅되어있다.
			   
			   forward=(ActionForward)method.invoke(action, paramObjs);
		   } catch (NullPointerException e) {
			forward = new ActionForward();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		   if(forward != null) {
			   if(forward.isRedirect() ) {
				   response.sendRedirect(forward.getView());
			   }else {
				   if(forward.getView() == null) {
					   // /model2/hello.jsp
					   forward.setView(command.replace(".do",".jsp"));
				   }
				   RequestDispatcher disp = request.getRequestDispatcher(forward.getView() );
				   disp.forward(request, response);
				   //hello.jsp가 forward되고, hello라는 속성이 들어간다. hello 속성이 hello world 이기때문에
				   //hello world라는 내용은  ${hello}를 하면 출력된다.
			   }
		   }//if(forward!=null)
	   } //doGet()
	   
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   doGet(request, response);
	   }
   
  }
