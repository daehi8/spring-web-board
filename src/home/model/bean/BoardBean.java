package home.model.bean;

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
import org.springframework.security.core.Authentication;
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
	
	// 상세페이지
	@RequestMapping("contents.do")
	public String Contents(@RequestParam(defaultValue ="1") int pageNum,
			BoardDTO boardDto,
			Model model) throws Exception {
		// 게시글 정보 저장
		// 파일 정보 저장
		boardDto = boardDAO.getArticle(boardDto.getNo());
		fileDTO = fileDAO.selectFile(boardDto.getFile_no());
		
		// 파일정보
		// 아이디
		// 게시글정보
		// 리스트페이지번호
		// 댓글정보
		model.addAttribute("fileDTO", fileDTO);
		model.addAttribute("id", boardDAO.selectMemId(boardDto.getMember_no()));
		model.addAttribute("dto", boardDto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("replyList", replyDAO.getReply(boardDto.getNo()));
		return "board/contents";
	}
	
	// 게시판 리스트
	@RequestMapping("list.do")
	public String List(@ModelAttribute PageDTO page,
			@RequestParam(defaultValue ="1") int pageNum,
			Model model) throws Exception {
		// 페이지번호 불러오기
		if(pageNum == 0) {
			page.setPageNum("1");
		}else {
			page.setPageNum(Integer.toString(pageNum));
		}
		
		// 총 게시글 수  & 페이징처리
		int count = boardDAO.getArticleCount();
		page.setCount(count);
		page.paging(page.getPageNum(), count);
		
		// 게시글 정보 저장
		List articleList = null;
		List memIdList = new ArrayList();
		
		// 작성자 정보 저장
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
		
		// 페이징처리
		// 게시글정보
		model.addAttribute("page", page);
		model.addAttribute("articleList", articleList);
		return "board/list";
	}
	
	// 삭제확인페이지
	@RequestMapping("deleteform.do")
	public String WriteDeleteForm(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			Model model) {
		// 게시글리스트 번호 불러오기
		// 게시글 고유번호
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		
		return "board/deleteForm";
	}
	
	// 게시글 삭제진행페이지
	@RequestMapping("deletepro.do")
	public String WriteDeletePro(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			BoardDTO boardDto,
			HttpServletRequest request,
			Model model) throws Exception {
		
		// 파일삭제
		int fileNo = fileDAO.fileNo(no);
		String savePath = "";
		String saveName = "";
		if(fileNo != 0) {
			fileDTO = fileDAO.selectFile(fileNo);
			savePath = request.getRealPath("save");
			saveName = fileDTO.getSavename();
		}
		File file = new File(savePath + "\\" + saveName);
		
		String sessionId = boardDto.getWriter();

		int deleteCheck = boardDAO.deleteCheck(no);
		int memberNo = boardDAO.selectNoCheck(sessionId);
		int check = -1;
		
		// 답변글 유무에 따른 삭제 처리
		// 답변글이 있을경우 게시글 정보만 변경
		// 답변글이 없을경우 게시글에서 삭제
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
		
		// 답변글유무 정보 저장
		// 게시글리스트 페이지번호 저장
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		
		return "board/deletePro";
	}

	// 글쓰기 폼페이지
	@RequestMapping("writeform.do")
	public String WriteForm(BoardDTO boardDto, Model model) throws Exception {		
		model.addAttribute("dto", boardDto);
		
		return "board/writeForm";
	}

	// 글쓰기 진행페이지
	@RequestMapping("writepro.do")
	public String WritePro(BoardDTO boardDto,
			FileDTO fileDTO,
			MultipartHttpServletRequest request) throws Exception {
		
		// 회원 고유번호 확인
		String sessionId = boardDto.getWriter();
		int memNo = boardDAO.selectNoCheck(sessionId);
		
		// 파일 저장
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
		
		// 회원 고유번호 저장
		// 회원 IP 저장
		// DB insert
		boardDto.setMember_no(memNo);
		boardDto.setIp(request.getRemoteAddr());
		boardDAO.insertArticle(boardDto);
		
		return "board/writePro";
	}
	
	// 게시글수정 폼페이지
	@RequestMapping("updateform.do")
	public String WriteUpdateForm(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="1") int no,
			Model model) throws Exception {		
		// 게시글 고유번호로 게시글 상세정보 불러오기
		// 파일 고유번호로 파일 정보 불러오기
		boardDto = boardDAO.updateGetArticle(no);
		fileDTO = fileDAO.selectFile(boardDto.getFile_no());
		
		// 파일정보 불러오기
		// 게시글리스트 페이지번호 불러오기
		// 게시글정보 불러오기
		model.addAttribute("fileDTO", fileDTO);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", boardDto);
		
		return "board/updateForm";
	}
	
	// 게시글수정 진행페이지
	@RequestMapping("updatepro.do")
	public String WriteUpdatePro(@RequestParam(defaultValue ="1") int pageNum,
			MultipartHttpServletRequest request, 
			BoardDTO boardDto,
			Model model, FileDTO fileDTO, int delFile) throws Exception {
		String sessionId = boardDto.getWriter();
		
		// 파일 수정
		// 기존 게시글에 파일이 없을경우 새로 업로드할 시
		// 기존 게시글에 파일이 있을경우 다른 파일로 변경할 시
		// 기존 게시글에 파일이 있을경우 파일을 삭제할 시
		MultipartFile mf = request.getFile("save");
		String savePath = "";
		String saveName = "";
		int fileNo = fileDAO.fileNo(boardDto.getNo());
		
		// 새로 업로드한 파일로 변경
		if(mf.isEmpty() == false) {
			// 파일이 업로드 되어있다면 삭제
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
			// 파일 업로드
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
		}
		// 업로드된 파일만 삭제
		if(mf.isEmpty() == true && delFile == 1 && fileNo != 0) {
			boardDto.setFile_no(fileNo);
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
		int memNo = boardDAO.selectNoCheck(sessionId);
		int check = boardDAO.updateArticle(boardDto, memNo, boardDto.getNo());
		
		// 작성자 확인
		// 게시글리스트 페이지번호 확인
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		return "board/updatePro";
	}
	

}
