package home.model.service;

import java.util.List;

import home.model.dto.FileDTO;

public interface FileService {

	// 파일 업로드
	public int fileInsert(FileDTO dto)throws Exception;
	
	// 고유번호에 맞는 파일정보 찾기
	public FileDTO selectFile(int no)throws Exception;
	
	// 수정
	public void fileUpdate(FileDTO dto)throws Exception;
	
	// 삭제
	public void fileDelete(int no)throws Exception;
	
	public int fileNo(int boardNo)throws Exception;
}
