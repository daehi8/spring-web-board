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
	
	// 회원탈퇴 폼페이지
	@RequestMapping("deleteform.do")
	public String DeleteForm(Model model) {
		
		return "home/deleteForm";
	}
	
	// 회원탈퇴 진행페이지
	@RequestMapping("deletepro.do")
	public String DeletePro(MemberDTO memberDto,
			HttpSession session,
			Model model) {
		// 회원정보 확인 및 암호화된 비밀번호 확인
		boolean result = memberDAO.loginCheck(memberDto);
		MemberDTO check = memberDAO.myInfo(memberDto.getId());
		boolean passMatch = passEncoder.matches(memberDto.getPw(), check.getPw());
		
		// 회원정보 삭제, 세션 삭제, 자동로그인 취소
		if(result && passMatch) {
			memberDAO.deleteMember(memberDto);
			session.invalidate();
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		
		// 비밀번호 확인 결과 저장
		model.addAttribute("result", passMatch);
		return "home/deletePro";
	}
	
	// 회원정보 수정페이지
	@RequestMapping("myinfo.do")
	public String MyInfo(String id, Model model) {
		// 아이디에 맞는 회원정보 불러오기
		memberDto = memberDAO.myInfo(id);
		// 회원 정보 저장
		model.addAttribute("dto", memberDto);
		
		return "home/myInfo";
	}
	
	// 회원정보 수정 진행페이지
	@RequestMapping("updatepro.do")
	public String UpdatePro(MemberDTO memberDto) {
//		비밀번호 변경기능 삭제
//		String inputPw = memberDto.getPw();
//		String pw = passEncoder.encode(inputPw);
//		memberDto.setPw(pw);
		memberDAO.updateMember(memberDto);
		
		return "home/updatePro";
	}
	
	// 회원가입 폼페이지
	@RequestMapping("signup.do")
	public String Signup() {
		return "home/signup";
	}
	
	// 회원가입 진행페이지
	@RequestMapping("signuppro.do")
	public String SignupPro(MemberDTO memberDto, 
			Model model) {
		
		// 비밀번호 암호화
		String inputPw = memberDto.getPw();
		String pw = passEncoder.encode(inputPw);
		memberDto.setPw(pw);
		
		// 중복아이디 확인
		boolean result = memberDAO.selectId(memberDto);
		if(result == false) {
			memberDAO.insertMember(memberDto);
		}
		
		// 중복아이디 확인 결과 저장
		model.addAttribute("result", result);
		
		return "home/signupPro";
	}
	
	// 로그인 폼페이지
	@RequestMapping("loginform.do")
	public String LoginForm() {		
		return "home/loginForm";
	}
	/*
	 *  로그인 진행은 스프링 시큐리티로 대체
	 * 
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
}
