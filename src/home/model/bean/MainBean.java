package home.model.bean;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import home.model.dto.BoardDTO;
import home.model.service.BoardService;

@Controller
@RequestMapping("/")
public class MainBean {
	
	@Autowired
	private BoardService boardDAO = null;
	
	
	@RequestMapping("main.do")
	public String Main(Model model) throws Exception {
		List populerList = boardDAO.populerArticle();
		model.addAttribute("populerList", populerList);
		
		return "home/main";
	}
}
