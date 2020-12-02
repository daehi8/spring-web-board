package home.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import home.model.dao.MemberDAO;
import home.model.dto.MemberDTO;

@Controller
public class MemberBean {
	
	@Autowired
	private MemberDAO memberDao = null;
	
	@RequestMapping("/deleteform.do")
	public String DeleteForm() {
		return "/WEB-INF/view/home/deleteForm.jsp";
	}
	
	@RequestMapping("/deletePro.do")
	public String DeletePro() {
		return "/WEB-INF/view/home/deletePro.jsp";
	}
	
	@RequestMapping("/myinfo.do")
	public String MyInfo() {
		return "/WEB-INF/view/home/myInfo.jsp";
	}
	
	@RequestMapping("/updatePro.do")
	public String UpdatePro() {
		return "/WEB-INF/view/home/updatePro.jsp";
	}
	
	@RequestMapping("/signup.do")
	public String Signup() {
		return "/WEB-INF/view/home/signup.jsp";
	}
	
	@RequestMapping("/signuppro.do")
	public String SignupPro(MemberDTO memberDto, Model model) {

		boolean result = memberDao.selectId(memberDto.getId());
		if(result = false) {
			memberDao.insert(memberDto);
		}
		
		model.addAttribute("result", result);
		System.out.println(result);
		System.out.println(memberDto.getId());
		System.out.println(memberDto.getPw());
		System.out.println(memberDto.getName());
		return "/WEB-INF/view/home/signupPro.jsp";
	}
	
	@RequestMapping("/loginform.do")
	public String LoginForm() {
		return "/WEB-INF/view/home/loginForm.jsp";
	}
	
	@RequestMapping(value="/loginpro.do", method=RequestMethod.POST)
	public String LoginPro(MemberDTO memberDto, Model model) {
		
		boolean result = memberDao.loginCheck(memberDto);
		model.addAttribute("result", result);
		
		memberDto.getId();
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
