package home.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainBean {
	
	@RequestMapping("main.do")
	public String Main() {
		return "home/main";
	}

	@RequestMapping("top.do")
	public String Top() {
		return "home/top";
	}

	@RequestMapping("bottom.do")
	public String Bottom() {
		return "home/bottom";
	}

}
