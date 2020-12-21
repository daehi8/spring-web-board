package home.model.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
    @RequestMapping("listreply.do") //댓글 리스트

    public @ResponseBody List getReplyList(int boardNo) throws Exception{
        return replyDAO.getReply(boardNo);
    }

    @RequestMapping("insertreply.do") //댓글 작성 
    public @ResponseBody int insertReply(ReplyDTO replyDTO, HttpSession session, HttpServletRequest request) throws Exception{

    	String sessionId = (String) session.getAttribute("sessionId");
        int member_no = boardDAO.selectNoCheck(sessionId);
        
        String content = replyDTO.getContent().replace("\r\n","<br>");
        
        replyDTO.setContent(content);
        replyDTO.setWriter(sessionId);
        replyDTO.setIp(request.getRemoteAddr());
        replyDTO.setMember_no(member_no);
        
        return replyDAO.insertReply(replyDTO);
    }
    
    @RequestMapping("updatereply.do") //댓글 수정  
    public @ResponseBody int updateReply(ReplyDTO replyDTO) throws Exception{
        
        return replyDAO.updateReply(replyDTO);
    }

    
    @RequestMapping("deletereply/{no}.do") //댓글 삭제  
    public @ResponseBody int deleteReply(@PathVariable int no) throws Exception{
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
