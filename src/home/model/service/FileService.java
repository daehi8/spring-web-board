package home.model.service;

import java.util.List;

import home.model.dto.FileDTO;

public interface FileService {

	// 파일 업로드 후 글번호 리턴
	public int fileInsert(FileDTO dto)throws Exception;
	
	// 찾기
	public FileDTO selectNum(int num)throws Exception;
	
	// 사용자가 업로드한 파일 리스트
	public List selectId(String id)throws Exception;
	
	// 수정
	public void fileUpdate(FileDTO dto)throws Exception;
	
	// 삭제
	public void fileDelete(int num)throws Exception;
	
	// 파일 리스트 확인
	public List selectAll()throws Exception;
	
	// 아이디 찾기
	public String selectId(int num)throws Exception;
	
	
	public String selectFile(FileDTO dto)throws Exception;
	
	
	public int selectCount()throws Exception;
}
