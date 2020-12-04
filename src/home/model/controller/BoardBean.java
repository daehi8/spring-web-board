package home.model.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import home.model.dao.BoardDAO;
import home.model.dto.BoardDTO;
import home.model.dto.PageDTO;

@Controller
@RequestMapping("/board/")
public class BoardBean {
	
	@Autowired
	private BoardDAO boardDao = null;
	
	@Autowired
	private BoardDTO boardDto = null;
	
	@Autowired
	private PageDTO page = null;
	
	@RequestMapping("contents.do")
	public String Contents(@RequestParam(defaultValue ="1") int pageNum,
			int number,
			BoardDTO boardDto,
			Model model) {
		boardDto = boardDao.getArticle(boardDto.getNo());
		model.addAttribute("dto", boardDto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
		return "board/contents";
	}
	
	@RequestMapping("list.do")
	public String List(@ModelAttribute PageDTO page,
			@RequestParam(defaultValue ="1") int pageNum,
			HttpSession session,
			Model model) throws Exception {
		if(pageNum == 0) {
			page.setPageNum("1");
		}else {
			page.setPageNum(Integer.toString(pageNum));
		}		
		int count = boardDao.getArticleCount();
		page.setCount(count);
		page.paging(page.getPageNum(), count);
		
		String sessionId = (String)session.getAttribute("sessionId");		
		List articleList = null;					
		if(count > 0) articleList = boardDao.getArticles(page.getStartRow(), page.getEndRow());
		
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("page", page);
		model.addAttribute("articleList", articleList);
		
		return "board/list";
	}
	
	@RequestMapping("deleteform.do")
	public String WriteDeleteForm(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			HttpSession session,
			Model model) {
		String sessionId = (String)session.getAttribute("sessionId");
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("sessionId", sessionId);
		return "board/deleteForm";
	}
	
	@RequestMapping("deletepro.do")
	public String WriteDeletePro(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			HttpSession session,
			Model model) throws Exception {
		String sessionId = (String)session.getAttribute("sessionId");
		int refNo = boardDao.notDeleteComment(no);
		int memberNo = boardDao.getMemberNo(sessionId);
		int check = -1;
		if(refNo != 0) {
			check = boardDao.deleteCommentArticle(no, memberNo);
		}else {
			check = boardDao.deleteArticle(no, memberNo);
		}
		model.addAttribute("check", check);
		model.addAttribute("sessionId", sessionId);
		
		return "board/deletePro";
	}

	@RequestMapping("writeform.do")
	public String WriteForm(HttpSession session, BoardDTO boardDto, Model model) {		
		String sessionId = (String)session.getAttribute("sessionId");
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("dto", boardDto);
		
		return "board/writeForm";
	}

	@RequestMapping("writepro.do")
	public String WritePro(BoardDTO boardDto, HttpServletRequest request) {
		boardDto.setIp(request.getRemoteAddr());
		boardDao.insertArticle(boardDto);
		
		return "board/writePro";
	}
	
	@RequestMapping("updateform.do")
	public String WriteUpdateForm(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			Model model) throws Exception {		
		boardDto = boardDao.updateGetArticle(no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", boardDto);
		
		return "board/updateForm";
	}
	
	@RequestMapping("updatepro.do")
	public String WriteUpdatePro(@RequestParam(defaultValue ="1") int pageNum,
			HttpSession session,
			Model model) throws Exception {
		String sessionId = (String)session.getAttribute("sessionId");
		int memNo = boardDao.getMemberNo(sessionId);
		int check = boardDao.updateArticle(boardDto, memNo);
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		
		return "board/updatePro";
	}
}
