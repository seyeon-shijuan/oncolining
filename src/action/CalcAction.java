package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	try {
		int num1= Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String op=request.getParameter("op");
		switch (op) {
		case"+":request.setAttribute("result", num1+num2);;break;
		case"-":request.setAttribute("result", num1-num2);;break;
		case"*":request.setAttribute("result", num1*num2);;break;
		case"/":request.setAttribute("result", num1/num2);;break;
		}
		} catch (NumberFormatException e) {
			request.setAttribute("result", 0);
		}
		return new ActionForward(false,"calc.jsp");
		}
	}
	


