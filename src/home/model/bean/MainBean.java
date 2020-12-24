package home.model.bean;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainBean {
	
	@RequestMapping("main.do")
	public String Main(String id, String pw, String auto, 
			HttpServletRequest request, 
			Model model, HttpSession session) {
		Cookie [] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("cid")) id = c.getValue();
				if(c.getName().equals("cpw")) pw = c.getValue();
				if(c.getName().equals("cauto")) auto = c.getValue();
			}
		}

		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("auto", auto);
		return "home/main";
	}
}
