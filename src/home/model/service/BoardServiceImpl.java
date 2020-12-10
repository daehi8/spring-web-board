package home.model.service;

import java.util.List;

import home.model.dto.BoardDTO;

public class BoardServiceImpl implements BoardService{

	@Override
	public void insertArticle(BoardDTO article) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getMemberNo(String sessionId) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notDeleteComment(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getArticleCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List getArticles(int start, int end) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO getArticle(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO updateGetArticle(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateArticle(BoardDTO article, int memNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(int no, int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommentArticle(int no, int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
