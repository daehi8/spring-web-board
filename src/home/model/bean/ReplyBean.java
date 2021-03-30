package home.model.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import home.model.dto.ReplyDTO;
import home.model.service.BoardService;
import home.model.service.ReplyService;

@Controller
@RequestMapping("/board/")
public class ReplyBean {
	
	@Autowired
	private BoardService boardDAO = null;
	
	@Autowired
	private ReplyService replyDAO = null;
	
	@Autowired
	private ReplyDTO replyDTO = null;
	
	//댓글 리스트
    @RequestMapping("listreply.do")
    public @ResponseBody List getReplyList(int boardNo) throws Exception{
        return replyDAO.getReply(boardNo);
    }

    //댓글 작성 
    @RequestMapping("insertreply.do")
    public @ResponseBody int insertReply(ReplyDTO replyDTO, HttpServletRequest request) throws Exception{

    	String sessionId = replyDTO.getWriter();
        int member_no = boardDAO.selectNoCheck(sessionId);
        
        // 줄바꿈을 코드로 변경해서 DB에 저장
        String content = replyDTO.getContent().replace("\r\n","<br>");
        
        // 댓글 내용, 작성자, IP, 회원고유번호를 DTO에 저장
        replyDTO.setContent(content);
        replyDTO.setWriter(sessionId);
        replyDTO.setIp(request.getRemoteAddr());
        replyDTO.setMember_no(member_no);
        
        return replyDAO.insertReply(replyDTO);
    }
    
    //댓글 수정 
    @RequestMapping("updatereply.do")
    public @ResponseBody int updateReply(ReplyDTO replyDTO) throws Exception{
        
        return replyDAO.updateReply(replyDTO);
    }

    //댓글 삭제  
    @RequestMapping("deletereply/{no}.do")
    public @ResponseBody int deleteReply(@PathVariable int no) throws Exception{
    	
    	// 댓글 삭제처리
    	// 댓글에 답글이 있을경우 내용만 지우기
    	// 마지막 댓글 삭제시 모두 삭제 
        int check = replyDAO.deleteCheck(no);
        int result = -1;
        if(check == 1) {
        	replyDAO.deleteReplyAll(no);
        	result = 1;
        }else if(check > 1){
        	replyDAO.delteCheckRe(no);
        	result = 1;
        }
		return result;      
    }

}
