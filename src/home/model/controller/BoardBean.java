package home.model.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import home.model.dto.BoardDTO;
import home.model.dto.FileDTO;
import home.model.dto.PageDTO;
import home.model.dto.ReplyDTO;
import home.model.service.BoardService;
import home.model.service.FileService;
import home.model.service.ReplyService;

@Controller
@RequestMapping("/board/")
public class BoardBean {
	
	@Autowired
	private FileDTO fileDTO = null;
	
	@Autowired
	private FileService fileDAO = null;
	
	@Autowired
	private ReplyService replyDAO = null;
	
	@Autowired
	private BoardService boardDAO = null;
	
	@Autowired
	private BoardDTO boardDto = null;
	
	@Autowired
	private PageDTO page = null;
	
	
	@RequestMapping("contents.do")
	public String Contents(@RequestParam(defaultValue ="1") int pageNum,
			int number,
			BoardDTO boardDto,
			Model model) throws Exception {
		boardDto = boardDAO.getArticle(boardDto.getNo());
		fileDTO = fileDAO.selectFile(boardDto.getFile_no());
		
		model.addAttribute("fileDTO", fileDTO);
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
			HttpSession session, HttpServletRequest request,
			Model model) throws Exception {
		int fileNo = fileDAO.fileNo(no);
		String savePath = "";
		String saveName = "";
		if(fileNo != 0) {
			fileDTO = fileDAO.selectFile(fileNo);
			savePath = request.getRealPath("save");
			saveName = fileDTO.getSavename();
		}
		File file = new File(savePath + "\\" + saveName);
		
		
		String sessionId = (String)session.getAttribute("sessionId");

		int deleteCheck = boardDAO.deleteCheck(no);
		int memberNo = boardDAO.selectNoCheck(sessionId);
		int check = -1;
		if(deleteCheck > 1) {
			check = boardDAO.deleteCommentArticle(no, memberNo);
			if(file.exists() == true){
				file.delete();
				fileDAO.fileDelete(fileNo);
			}			
		}else if(deleteCheck == 1){
			check = boardDAO.deleteArticle(no, memberNo);
			if(file.exists() == true){
				file.delete();
				fileDAO.fileDelete(fileNo);
			}
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
			FileDTO fileDTO,
			MultipartHttpServletRequest request, 
			HttpSession session) throws Exception {
		
		String sessionId = (String)session.getAttribute("sessionId");
		int memNo = boardDAO.selectNoCheck(sessionId);
		
		MultipartFile mf = request.getFile("save");			
		if(mf.isEmpty() == false) {
			String fileName = mf.getOriginalFilename();				
			fileDTO.setOrgname(fileName);
			int no = fileDAO.fileInsert(fileDTO);
			String ext = fileName.substring(fileName.lastIndexOf("."));			
			String saveName = "file_"+no+ext;
			fileDTO.setNo(no);
			fileDTO.setSavename(saveName);
			fileDAO.fileUpdate(fileDTO);
			
			String savePath = request.getRealPath("save");
			File saveFile = new File(savePath+"\\"+saveName); 	
			try {
				mf.transferTo(saveFile);
			}catch(Exception e){
				e.printStackTrace();
			}		
			boardDto.setFile_no(no);
		}
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
		fileDTO = fileDAO.selectFile(boardDto.getFile_no());
		
		model.addAttribute("fileDTO", fileDTO);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", boardDto);
		
		return "board/updateForm";
	}
	
	@RequestMapping("updatepro.do")
	public String WriteUpdatePro(@RequestParam(defaultValue ="1") int pageNum,
			MultipartHttpServletRequest request, 
			HttpSession session,
			BoardDTO boardDto,
			Model model, FileDTO fileDTO, int delFile) throws Exception {
		String sessionId = (String)session.getAttribute("sessionId");		
		MultipartFile mf = request.getFile("save");
		String savePath = "";
		String saveName = "";
		
		if(mf.isEmpty() == false) {
			int fileNo = fileDAO.fileNo(boardDto.getNo());
			if(fileNo != 0) {
				fileDTO = fileDAO.selectFile(fileNo);
				savePath = request.getRealPath("save");
				saveName = fileDTO.getSavename();
				File file = new File(savePath + "\\" + saveName);
				if(file.exists() == true){
					file.delete();
					fileDAO.fileDelete(fileNo);
				}
			}
			String fileName = mf.getOriginalFilename();
			fileDTO.setOrgname(fileName);
			int no = fileDAO.fileInsert(fileDTO);
			String ext = fileName.substring(fileName.lastIndexOf("."));			
			saveName = "file_"+no+ext;
			fileDTO.setNo(no);
			fileDTO.setSavename(saveName);
			fileDAO.fileUpdate(fileDTO);
			
			savePath = request.getRealPath("save");
			File saveFile = new File(savePath+"\\"+saveName); 	
			try {
				mf.transferTo(saveFile);
			}catch(Exception e){
				e.printStackTrace();
			}		
			boardDto.setFile_no(no);
		}else {		
			int fileNo = fileDAO.fileNo(boardDto.getNo());
			if(fileNo != 0) {
				boardDto.setFile_no(fileNo);
			}
		}
		if(mf.isEmpty() == true) {
			if(delFile == 1) {
				int fileNo = fileDAO.fileNo(boardDto.getNo());
				if(fileNo != 0) {
					fileDTO = fileDAO.selectFile(fileNo);
					savePath = request.getRealPath("save");
					saveName = fileDTO.getSavename();
					File file = new File(savePath + "\\" + saveName);
					if(file.exists() == true){
						file.delete();
						fileDAO.fileDelete(fileNo);
					}
					boardDto.setFile_no(0);
				}
			}
		}
		int memNo = boardDAO.selectNoCheck(sessionId);
		int check = boardDAO.updateArticle(boardDto, memNo, boardDto.getNo());
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		return "board/updatePro";
	}
	

}
