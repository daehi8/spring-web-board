package home.model.service;

import java.util.List;

import home.model.dto.ReplyDTO;

public interface ReplyService {

	// 댓글 리스트
	public List getReply(int boardNo)throws Exception;

	// 댓글 추가
	public int insertReply(ReplyDTO replyDTO)throws Exception;
	
	// 댓글 수정
	public int updateReply(ReplyDTO replyDTO)throws Exception;
	
	// 댓글갯수
	public int maxNoreply()throws Exception;
	
	// 댓글 삭제 체크
	public int deleteCheck(int no)throws Exception;
	
	// 대댓글 삭제
	public int delteCheckRe(int no)throws Exception;
	
	// 댓글 삭제
	public int deleteReplyAll(int no)throws Exception;
	
}
