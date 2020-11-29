package home.action.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.action.action.SuperAction;

public class MainAction implements SuperAction{

	@Override
	public String requestAction(HttpServletRequest request, HttpServletResponse response) {
		
		return "/WEB-INF/view/home/main.jsp";
	}

}
