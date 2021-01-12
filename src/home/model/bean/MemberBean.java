package home.model.bean;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import home.model.dto.MemberDTO;
import home.model.service.MemberService;

@Controller
@RequestMapping("/")
public class MemberBean {
	
	@Autowired
	private BCryptPasswordEncoder passEncoder = null;
	
	@Autowired
	private MemberService memberDAO = null;
	
	@Autowired
	private MemberDTO memberDto = null;
	
	@RequestMapping("deleteform.do")
	public String DeleteForm(Model model) {
		
		return "home/deleteForm";
	}
	
	@RequestMapping("deletepro.do")
	public String DeletePro(MemberDTO memberDto,
			HttpSession session,
			Model model) {
		boolean result = memberDAO.loginCheck(memberDto);
		MemberDTO check = memberDAO.myInfo(memberDto.getId());
		boolean passMatch = passEncoder.matches(memberDto.getPw(), check.getPw());
		if(result && passMatch) {
			memberDAO.deleteMember(memberDto);
			session.invalidate();
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		model.addAttribute("result", passMatch);
		System.out.println(passMatch);
		System.out.println(result);
		return "home/deletePro";
	}
	
	@RequestMapping("myinfo.do")
	public String MyInfo(String id, Model model) {
		memberDto = memberDAO.myInfo(id);
		model.addAttribute("dto", memberDto);
		
		return "home/myInfo";
	}
	
	@RequestMapping("updatepro.do")
	public String UpdatePro(MemberDTO memberDto) {
		String inputPw = memberDto.getPw();
		String pw = passEncoder.encode(inputPw);
		memberDto.setPw(pw);
		memberDAO.updateMember(memberDto);
		
		return "home/updatePro";
	}
	
	@RequestMapping("signup.do")
	public String Signup() {
		return "home/signup";
	}
	
	@RequestMapping("signuppro.do")
	public String SignupPro(MemberDTO memberDto, 
			Model model) {
		String inputPw = memberDto.getPw();
		String pw = passEncoder.encode(inputPw);
		memberDto.setPw(pw);
		
		boolean result = memberDAO.selectId(memberDto);
		if(result == false) {
			memberDAO.insertMember(memberDto);
		}		
		model.addAttribute("result", result);
		
		return "home/signupPro";
	}
	
	@RequestMapping("loginform.do")
	public String LoginForm() {		
		return "home/loginForm";
	}
	/*
	@RequestMapping(value="loginpro.do", method=RequestMethod.POST)
	public String LoginPro(MemberDTO memberDto, 
			Model model, 
			HttpSession session) {		
		String id = memberDto.getId();
		MemberDTO check = memberDAO.myInfo(id);
		
		boolean passMatch = passEncoder.matches(memberDto.getPw(), check.getPw());
		
		boolean result = memberDAO.loginCheck(memberDto);
		if(result == true && passMatch) {
			session.setAttribute("sessionId", id);
		}
		model.addAttribute("result", result);		
		
		return "home/loginPro";
	}
	
	@RequestMapping("logout.do")
	public String Logout(HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session) {
		session.invalidate(); 
		Cookie [] cookies = request.getCookies();	
		if(cookies != null){						
			for(Cookie c : cookies){				
				if(c.getName().equals("cid")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
				if(c.getName().equals("cpw")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
				if(c.getName().equals("cauto")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		
		return "home/logout";
	}
	
	@RequestMapping("cookiepro.do")
	public String CookiePro(HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session,
			Model model) {		
		String id = null, pw = null, auto = null;
		Cookie [] cookies = request.getCookies();
		if(cookies != null){							
			for(Cookie c : cookies){
				if(c.getName().equals("cid")) {id = c.getValue(); memberDto.setId(id);}
				if(c.getName().equals("cpw")) {pw = c.getValue(); memberDto.setPw(pw);}
				if(c.getName().equals("cauto")) {auto = c.getValue(); memberDto.setAuto(auto);}
			}
		}
		boolean result = memberDAO.loginCheck(memberDto);
		if(result){
			session.setAttribute("sessionId", memberDto.getId());	
			if(memberDto.getAuto() != null && memberDto.getAuto().equals("1")){		
				Cookie cid = new Cookie("cid", memberDto.getId());			
				Cookie cpw = new Cookie("cpw", memberDto.getPw());
				Cookie cauto = new Cookie("cauto", memberDto.getAuto());
				cid.setMaxAge(60*60*24);			
				cpw.setMaxAge(60*60*24);
				cauto.setMaxAge(60*60*24);
				response.addCookie(cid);			
				response.addCookie(cpw);
				response.addCookie(cauto);
			}
		}
		model.addAttribute("result", result);
		
		return "home/cookiePro";
	}
	*/
	@RequestMapping("mypage.do")
	public String MyPage() {
		return "home/myPage";
	}
	
}
