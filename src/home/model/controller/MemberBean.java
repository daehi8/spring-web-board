package home.model.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import home.model.dao.MemberDAO;
import home.model.dto.MemberDTO;

@Controller
@RequestMapping("/")
public class MemberBean {
	
	@Autowired
	private MemberDAO memberDao = null;
	
	@Autowired
	private MemberDTO memberDto = null;
	
	@RequestMapping("deleteform.do")
	public String DeleteForm(HttpSession session,
			Model model) {
		String sessionId = (String)session.getAttribute("id");
		model.addAttribute("sessionId", sessionId);
		
		return "home/deleteForm";
	}
	
	@RequestMapping("deletepro.do")
	public String DeletePro(MemberDTO memberDto,
			HttpSession session,
			Model model) {
		String sessionId = (String)session.getAttribute("id");
		boolean result = memberDao.loginCheck(memberDto);
		if(result) {
			memberDao.delete(memberDto);
			session.invalidate();
		}
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("result", result);
		
		return "home/deletePro";
	}
	
	@RequestMapping("myinfo.do")
	public String MyInfo(HttpSession session, Model model) {
		String sessionId = (String)session.getAttribute("sessionId");
		memberDto = memberDao.myInfo(sessionId);
		model.addAttribute("dto", memberDto);
		
		return "home/myInfo";
	}
	
	@RequestMapping("updatepro.do")
	public String UpdatePro(MemberDTO memberDto,
			HttpSession session,
			Model model) {
		String sessionId = (String)session.getAttribute("sessionId");
		memberDao.update(memberDto);
		model.addAttribute("sessionId",sessionId);
		
		return "home/updatePro";
	}
	
	@RequestMapping("signup.do")
	public String Signup() {
		return "home/signup";
	}
	
	@RequestMapping("signuppro.do")
	public String SignupPro(MemberDTO memberDto, 
			Model model) {
		boolean result = memberDao.selectId(memberDto.getId());
		if(result == false) {
			memberDao.insert(memberDto);
		}		
		model.addAttribute("result", result);
		
		return "home/signupPro";
	}
	
	@RequestMapping("loginform.do")
	public String LoginForm(HttpServletRequest request,
			Model model) {
		String id = null, pw = null, auto = null;
		Cookie [] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("cid")) id = c.getValue();
				if(c.getName().equals("cpw")) pw = c.getValue();
				if(c.getName().equals("cauto")) auto = c.getValue();
			}
		}
		model.addAttribute("auto", auto);
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		
		return "home/loginForm";
	}
	
	@RequestMapping(value="loginpro.do", method=RequestMethod.POST)
	public String LoginPro(MemberDTO memberDto, 
			Model model, 
			HttpSession session) {		
		String id = memberDto.getId();
		boolean result = memberDao.loginCheck(memberDto);
		if(result == true) {
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
		boolean result = memberDao.loginCheck(memberDto);
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
}
