package home.model.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberBean {

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
}
