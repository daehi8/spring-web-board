package home.model.service;

import java.util.List;

import home.model.dto.ReplyDTO;

public interface ReplyService {

	// 댓글 리스트
	public List getReply(int boardNo)throws Exception;

	// 댓글 추가
	public void insertReply(ReplyDTO replyDTO)throws Exception;
	
	// 댓글 삭제
	public int deleteReply()throws Exception;
	
	// 댓글 수정
	public int updateReply()throws Exception;
}
