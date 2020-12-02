package home.model.dao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardBean {
	
	@RequestMapping("/contents.do")
	public String Contents() {
		return "/WEB-INF/view/board/contents.jsp";
	}
	
	@RequestMapping("/list.do")
	public String List() {
		return "/WEB-INF/view/board/list.jsp";
	}
	
	@RequestMapping("/mylist.do")
	public String MyList() {
		return "/WEB-INF/view/board/mylist.jsp";
	}
	
	@RequestMapping("/writedeleteform.do")
	public String WriteDeleteForm() {
		return "/WEB-INF/view/board/writeDeleteForm.jsp";
	}
	
	@RequestMapping("/writedeletepro.do")
	public String WriteDeletePro() {
		return "/WEB-INF/view/board/writeDeletePro.jsp";
	}

	@RequestMapping("/writeform.do")
	public String WriteForm() {
		return "/WEB-INF/view/board/writeForm.jsp";
	}

	@RequestMapping("/writepro.do")
	public String WritePro() {
		return "/WEB-INF/view/board/writePro.jsp";
	}
	
	@RequestMapping("/writeupdateform.do")
	public String WriteUpdateForm() {
		return "/WEB-INF/view/board/writeUpdateForm.jsp";
	}
	
	@RequestMapping("/writeupdatepro.do")
	public String WriteUpdatePro() {
		return "/WEB-INF/view/board/writeUpdatePro.jsp";
	}
}
