package home.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/")
public class BoardBean {
	
	@RequestMapping("contents.do")
	public String Contents() {
		return "board/contents";
	}
	
	@RequestMapping("list.do")
	public String List() {
		return "board/list";
	}
	
	@RequestMapping("mylist.do")
	public String MyList() {
		return "board/mylist";
	}
	
	@RequestMapping("writedeleteform.do")
	public String WriteDeleteForm() {
		return "board/writeDeleteForm";
	}
	
	@RequestMapping("writedeletepro.do")
	public String WriteDeletePro() {
		return "board/writeDeletePro";
	}

	@RequestMapping("writeform.do")
	public String WriteForm() {
		return "board/writeForm";
	}

	@RequestMapping("writepro.do")
	public String WritePro() {
		return "board/writePro";
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
