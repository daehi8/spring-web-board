package home.model.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SginBean {

	@RequestMapping("/signup.do")
	public String Signup() {
		return "/WEB-INF/view/home/signup.jsp";
	}
	
	@RequestMapping("/signuppro.do")
	public String SignupPro() {
		return "/WEB-INF/view/home/signupPro.jsp";
	}
	
	
}
