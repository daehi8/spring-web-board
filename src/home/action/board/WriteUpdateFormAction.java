package home.action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.action.action.SuperAction;

public class WriteUpdateFormAction implements SuperAction{

	@Override
	public String requestAction(HttpServletRequest request, HttpServletResponse response) {

		return "/WEB-INF/view/board/writeUpdateForm.jsp";
	}

}
