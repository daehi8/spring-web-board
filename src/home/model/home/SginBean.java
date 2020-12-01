package home.model.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SginBean {
	
	@RequestMapping("/signup.do")
	public String Signup() {
		return "/WEB-INF/view/home/signup.jsp";
	}
	
	@RequestMapping("/signuppro.do")
	public String SignupPro(MemberDTO signUp, Model model) {

		MemberDAO dao = MemberDAO.getInstance();
		boolean result = dao.selectId(signUp.getId());
		if(result = false) {
			dao.insert(signUp);
		}
		
		model.addAttribute("result", result);
		System.out.println(result);
		System.out.println(signUp.getId());
		System.out.println(signUp.getPw());
		System.out.println(signUp.getName());
		return "/WEB-INF/view/home/signupPro.jsp";
	}
	
}
