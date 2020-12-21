package home.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.model.dto.FileDTO;

@Service("fileDAO")
public class FileServiceImpl implements FileService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public int fileInsert(FileDTO dto) throws Exception {
		dao.insert("file.insertFile", dto);
		return dao.selectOne("file.selectCoint");
	}

	@Override
	public FileDTO selectFile(int no) throws Exception {
		return dao.selectOne("file.selectFileNo");
	}

	@Override
	public void fileUpdate(FileDTO dto) throws Exception {
		dao.update("file.updateFile");		
	}

	@Override
	public void fileDelete(int no) throws Exception {
		dao.delete("file.deleteFile");
	}

}
