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
	public int deleteReply(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete("reply.deleteReply", no);
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

}
