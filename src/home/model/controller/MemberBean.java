package home.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import home.model.dao.MemberDAO;
import home.model.dto.MemberDTO;

@Controller
@RequestMapping("/member/")
public class MemberBean {
	
	@Autowired
	private MemberDAO memberDao = null;
	
	@Autowired
	private MemberDAO memberDto = null;
	
	@RequestMapping("deleteform.do")
	public String DeleteForm() {
		return "home/deleteForm";
	}
	
	@RequestMapping("deletePro.do")
	public String DeletePro() {
		return "home/deletePro";
	}
	
	@RequestMapping("myinfo.do")
	public String MyInfo() {
		return "home/myInfo";
	}
	
	@RequestMapping("updatePro.do")
	public String UpdatePro() {
		return "home/updatePro";
	}
	
	@RequestMapping("signup.do")
	public String Signup() {
		return "home/signup";
	}
	
	@RequestMapping("signuppro.do")
	public String SignupPro(MemberDTO memberDto, Model model) {

		boolean result = memberDao.selectId(memberDto.getId());
		if(result = false) {
			memberDao.insert(memberDto);
		}
		
		model.addAttribute("result", result);
		return "home/signupPro";
	}
	
	@RequestMapping("loginform.do")
	public String LoginForm() {
		return "home/loginForm";
	}
	
	@RequestMapping(value="loginpro.do", method=RequestMethod.POST)
	public String LoginPro(MemberDTO memberDto, Model model) {
		
		boolean result = memberDao.loginCheck(memberDto);
		model.addAttribute("result", result);
		
		memberDto.getId();
		return "home/loginPro";
	}
	
	@RequestMapping("logout.do")
	public String Logout() {
		return "home/logout";
	}
	
	@RequestMapping("cookiepro.do")
	public String CookiePro() {
		return "home/cookiePro";
	}
}
