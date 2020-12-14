package home.model.service;

import java.util.List;

import home.model.dto.BoardDTO;
import home.model.dto.ReplyDTO;

public interface BoardService {
	
	// 글작성
	public void insertArticle(BoardDTO article);
	
	// 답변글 처리
	public int notDeleteComment(int no) throws Exception;
	
	// 전체 게시글 수 확인
	public int getArticleCount() throws Exception;
	
	// 게시글 페이징
	public List getArticles(int start, int end) throws Exception;
	
	// 게시글 내용 확인
	public BoardDTO getArticle(int no);
	
	// 게시글 정보 불러오기
	public BoardDTO updateGetArticle(int no)throws Exception;
	
	// 게시글 내용 수정
	public int updateArticle(BoardDTO article, int memNo, int no)throws Exception;
	
	// 게시글 삭제
	public int deleteArticle(int no, int memberNo)throws Exception;
	
	// 삭제된 답변글 제목 수정
	public int deleteCommentArticle(int no, int memberNo)throws Exception;
	
	// 게시글 작성자 찾기
	public String selectMemId(int memNo)throws Exception;
	
	// 아이디에 맞는 회원번호 찾기
	public int selectNoCheck(String id)throws Exception;
	
}
