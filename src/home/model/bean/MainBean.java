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
import home.model.dto.FileDTO;
import home.model.service.BoardService;
import home.model.service.FileService;

@Controller
@RequestMapping("/")
public class MainBean {
	
	// 메인페이지
	@RequestMapping("main.do")
	public String Main() throws Exception {
		
		return "home/main";
	}
	
	// 에러페이지
	@RequestMapping("/accessdenied")
	public String accessDeniedPage() throws Exception {
	    return "error/accessDenied";
	}
}