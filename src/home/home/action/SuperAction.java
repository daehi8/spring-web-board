package home.home.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SuperAction {
	public String requestAction(HttpServletRequest request, HttpServletResponse response);
}
