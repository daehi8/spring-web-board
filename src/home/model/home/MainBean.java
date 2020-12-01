package home.model.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBean {
	
	@RequestMapping("/main.do")
	public String Main() {
		return "/WEB-INF/view/home/main.jsp";
	}

	@RequestMapping("/top.do")
	public String Top() {
		return "/WEB-INF/view/home/top.jsp";
	}

	@RequestMapping("/bottom.do")
	public String Bottom() {
		return "/WEB-INF/view/home/bottom.jsp";
	}

}
