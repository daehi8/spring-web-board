package home.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.model.dto.ReplyDTO;

@Service("ReplyDAO")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public int insertReply(ReplyDTO replyDTO) throws Exception {
		
		return dao.insert("reply.insertReply", replyDTO);
	}

	@Override
	public int updateReply(ReplyDTO replyDTO) throws Exception {
		return dao.update("reply.updateReply", replyDTO);
	}

	@Override
	public List getReply(int boardNo) throws Exception {
		return dao.selectList("reply.selectReplyList", boardNo);
	}

	@Override
	public int maxNoreply() throws Exception {
		return dao.selectOne("reply.maxNoReply");
	}

	@Override
	public int deleteCheck(int no) throws Exception {
		return dao.selectOne("reply.deleteCheck", no);
	}

	@Override
	public int delteCheckRe(int no) throws Exception {	
		return dao.update("reply.deleteCheckRe", no);
	}

	@Override
	public int deleteReplyAll(int no) throws Exception {
		return dao.delete("reply.deleteReplyAll", no);
	}

}
