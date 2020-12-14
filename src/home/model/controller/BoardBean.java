package home.model.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import home.model.dto.ReplyDTO;
import home.model.service.BoardService;
import home.model.service.ReplyService;

@Controller
@RequestMapping("/board/")
public class BoardBean {
	
	@Autowired
	private ReplyService replyDAO = null;
	
	@Autowired
	private BoardService boardDAO = null;
	
	@Autowired
	private BoardDTO boardDto = null;
	
	@Autowired
	private ReplyDTO replyDTO = null;
	
	@Autowired
	private PageDTO page = null;
	
	@RequestMapping("insertReply.do")
	public void insertReply(ReplyDTO replyDTO, HttpServletResponse response) throws Exception {
		replyDAO.insertReply(replyDTO);
		response.setContentType("text/html;charset=euc-kr");
        PrintWriter out = response.getWriter();
        out.println("1");
        out.close();
	} 
	
	
	@RequestMapping("contents.do")
	public String Contents(@RequestParam(defaultValue ="1") int pageNum,
			int number,
			BoardDTO boardDto,
			Model model) throws Exception {
		boardDto = boardDAO.getArticle(boardDto.getNo());
		
		model.addAttribute("id", boardDAO.selectMemId(boardDto.getMember_no()));
		model.addAttribute("dto", boardDto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("replyList", replyDAO.getReply(boardDto.getNo()));
		return "board/contents";
	}
	
	@RequestMapping("list.do")
	public String List(@ModelAttribute PageDTO page,
			@RequestParam(defaultValue ="1") int pageNum,
			Model model) throws Exception {
		if(pageNum == 0) {
			page.setPageNum("1");
		}else {
			page.setPageNum(Integer.toString(pageNum));
		}		
		int count = boardDAO.getArticleCount();
		page.setCount(count);
		page.paging(page.getPageNum(), count);
			
		List articleList = null;
		List memIdList = new ArrayList();
		int memNo = 0;
		String id = "";
		if(count > 0) { 
			articleList = boardDAO.getArticles(page.getStartRow(), page.getEndRow());
			for(int i = 0; i < articleList.size(); i++ ) {
				memNo = ((BoardDTO) articleList.get(i)).getMember_no();
				id = boardDAO.selectMemId(memNo);
				((BoardDTO) articleList.get(i)).setWriter(id);
			}
		}
		model.addAttribute("page", page);
		model.addAttribute("articleList", articleList);
		
		return "board/list";
	}
	
	@RequestMapping("deleteform.do")
	public String WriteDeleteForm(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			Model model) {
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		
		return "board/deleteForm";
	}
	
	@RequestMapping("deletepro.do")
	public String WriteDeletePro(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			HttpSession session,
			Model model) throws Exception {
		String sessionId = (String)session.getAttribute("sessionId");
		int refNo = boardDAO.notDeleteComment(no);
		int memberNo = boardDAO.selectNoCheck(sessionId);
		int check = -1;
		if(refNo != 0) {
			check = boardDAO.deleteCommentArticle(no, memberNo);
		}else {
			check = boardDAO.deleteArticle(no, memberNo);
		}
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		
		return "board/deletePro";
	}

	@RequestMapping("writeform.do")
	public String WriteForm(BoardDTO boardDto, Model model) throws Exception {
		model.addAttribute("dto", boardDto);
		
		return "board/writeForm";
	}

	@RequestMapping("writepro.do")
	public String WritePro(BoardDTO boardDto, 
			HttpServletRequest request, 
			HttpSession session) throws Exception {
		String sessionId = (String)session.getAttribute("sessionId");
		int memNo = boardDAO.selectNoCheck(sessionId);
		boardDto.setMember_no(memNo);
		boardDto.setIp(request.getRemoteAddr());
		boardDAO.insertArticle(boardDto);
		
		return "board/writePro";
	}
	
	@RequestMapping("updateform.do")
	public String WriteUpdateForm(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			Model model) throws Exception {		
		boardDto = boardDAO.updateGetArticle(no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", boardDto);
		
		return "board/updateForm";
	}
	
	@RequestMapping("updatepro.do")
	public String WriteUpdatePro(@RequestParam(defaultValue ="1") int pageNum,
			HttpSession session,
			BoardDTO boardDto,
			Model model) throws Exception {
		String sessionId = (String)session.getAttribute("sessionId");
		int memNo = boardDAO.selectNoCheck(sessionId);
		int check = boardDAO.updateArticle(boardDto, memNo, boardDto.getNo());
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		
		return "board/updatePro";
	}
	

}
