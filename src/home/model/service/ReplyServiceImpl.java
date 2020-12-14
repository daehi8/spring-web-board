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
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		dao.insert("reply.insertReply", replyDTO);
	}

	@Override
	public int deleteReply() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List getReply(int boardNo) throws Exception {
		return dao.selectList("reply.selectReplyList", boardNo);
	}

}
