package home.model.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import home.model.dao.BoardDAO;
import home.model.dto.BoardDTO;
import home.model.dto.PaginationDTO;

@Controller
@RequestMapping("/")
public class BoardBean {
	
	@Autowired
	private BoardDAO boardDao = null;
	
	@Autowired
	private BoardDTO boardDto = null;
	
	@Autowired
	private PaginationDTO page = null;
	
	@RequestMapping("contents.do")
	public String Contents() {
		return "board/contents";
	}
	
	@RequestMapping("list.do")
	public String List(PaginationDTO page,
			HttpSession session,
			Model model) throws Exception {
		
		String sessionId = (String)session.getAttribute("sessionId");
		String pageNum = page.getPageNum();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		List articleList = null;
		int count = boardDao.getArticleCount();
		
		int wid = 0;
		
		if(pageNum == null) pageNum = "1";
		page.setCount(count);
		if(count > 0) articleList = boardDao.getArticles(page.getStartRow(), page.getEndRow());
		
		model.addAttribute("sdf", sdf);
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("wid", wid);
		model.addAttribute("page", page);
		model.addAttribute("articleList", articleList);
		
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
	public String WriteForm(HttpSession session, BoardDTO boardDto, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		int no=0,ref=1,re_step=1,re_level=0;
		if(boardDto.getNo() != 0) {
			no = boardDto.getNo();
			ref = boardDto.getRef();
			re_step = boardDto.getRe_step();
			re_level = boardDto.getRe_level();
		}
		model.addAttribute("no", no);
		model.addAttribute("ref", ref);
		model.addAttribute("re_step", re_step);
		model.addAttribute("re_level", re_level);
		model.addAttribute("sessionId", sessionId);
		return "board/writeForm";
	}

	@RequestMapping("writepro.do")
	public String WritePro(BoardDTO boardDto, HttpServletRequest request) {
		boardDto.setReg_date(new Timestamp(System.currentTimeMillis()));
		boardDto.setIp(request.getRemoteAddr());
		boardDao.insertArticle(boardDto);
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
