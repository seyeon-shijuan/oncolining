package controller;

import java.io.FileInputStream;
import java.io.IOException;
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

import action.Action;
import action.ActionForward;

@WebServlet(urlPatterns= {"*.me"},
  initParams = {@WebInitParam(name="properties",
           value = "action.properties")})
public class ControllerServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private Map<String,Action> commandMap=new HashMap<String,Action>();
   public ControllerServlet() {
        super();
   }
   //서블릿이 객체화 될 때 호출되는 메서드
   //기능: action.properties 파일을 읽어서, 클래스의 이름에 해당하는 객체를 생성
   //commandMap 객체에 저장
   @Override
   public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("properties");
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			//f: action.properties 파일 선택
			f = new FileInputStream
	(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
			//action.properties파일의 내용을 Map(properties) 객체로 로드
			//key=value로 나눠서 저장 (/model2/hello.me=action.HelloAction)
			pr.load(f);
		} catch(IOException e) {
			throw new ServletException(e);
		} finally {
			try {  if(f != null) f.close();
			}catch(IOException e) {}
		}
		for(Object k : pr.keySet()) {
			//command: model2/hello.me
			String command = (String)k; 
			//className=action.HelloAction
			String className = pr.getProperty(command);
			try {
				//commandClass: action.HelloAction 클래스 정보
				Class commandClass = Class.forName(className.trim());
				//commandObj=action.HelloAction 클래스 객체
				Object commandObj = commandClass.newInstance();//객체화
				commandMap.put(command, (Action)commandObj);
			} catch(Exception e) {
				throw new ServletException(e);
			}
		}
	} //init method의 끝
   //get 방식 요청시 호출되는 메서드 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			//command: /model2/hello.me
			command = request.getRequestURI().substring
					(request.getContextPath().length());
			//action: action.HelloAction 객체 저장
			action = commandMap.get(command);
			forward = action.execute(request, response);
		}catch(NullPointerException e) {
			forward = new ActionForward();
		} catch(Exception e) {
			throw new ServletException(e);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			} else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".me", ".jsp"));
				}
				RequestDispatcher disp = 
					request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
			}
		}
	}
	//post방식으로 요청할 때 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
