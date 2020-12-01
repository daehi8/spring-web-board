package home.model.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginBean {
	
	@RequestMapping("/loginform.do")
	public String LoginForm() {
		return "/WEB-INF/view/home/loginForm.jsp";
	}
	
	@RequestMapping("/loginpro.do")
	public String LoginPro() {
		return "/WEB-INF/view/home/loginPro.jsp";
	}
	
	@RequestMapping("/logout.do")
	public String Logout() {
		return "/WEB-INF/view/home/logout.jsp";
	}
	
	@RequestMapping("/cookiepro.do")
	public String CookiePro() {
		return "/WEB-INF/view/home/cookiePro.jsp";
	}
}
