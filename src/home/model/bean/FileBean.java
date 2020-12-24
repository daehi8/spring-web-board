package home.model.bean;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import home.model.dto.FileDTO;
import home.model.service.FileService;

@Controller
@RequestMapping("/file/")
public class FileBean {
	
	@Autowired
	private FileService fileDAO = null;
	
	@Autowired
	private FileDTO fileDTO = null;
	
	// 최대 업로드 크기, 인코딩 크기는 컨트롤러에 설정
	// 파일이름 중복방지
	@RequestMapping("upload.do")
	public void upload(MultipartHttpServletRequest request, FileDTO dto) throws Exception {
		
		// 파일 객체 생성
		MultipartFile mf = request.getFile("save");	
		
		// 파일 원본 이름 객체 생성
		String fileName = mf.getOriginalFilename();		
		
		// DB에 저장
		dto.setOrgname(fileName);
		int no = fileDAO.fileInsert(dto);
		
		// 파일 확장자 찾기
		String ext = fileName.substring(fileName.lastIndexOf("."));	
		
		// 저장된 파일 이름 설정
		String saveName = "file_"+no+ext;
		
		// DB에 saveName 추가 / 글번호와 저장된 파일 이름을 DTO에 대입
		dto.setNo(no);
		dto.setSavename(saveName);
		fileDAO.fileUpdate(dto);
		
		// 저장경로
		//String savePath = "C:\\Users\\82107\\Desktop\\WORK\\SAVE\\";
		String savePath = request.getRealPath("save");
		System.out.println(savePath);
		
		// 파일 저장위치 객체 생성
		File saveFile = new File(savePath+"\\"+saveName); 	
		
		// 파일업로드 예외처리
		try {
			mf.transferTo(saveFile);
		}catch(Exception e){
			e.printStackTrace();
		}		
		
	}
	
	@RequestMapping("download.do")
	public void download(HttpServletResponse response, HttpServletRequest request, int no)throws Exception{
		FileDTO dto = fileDAO.selectFile(no);
		
		// 다운로드할 파일 위치
		String savePath = request.getRealPath("save");
		File file = new File(savePath + "\\" + dto.getSavename());
		
		// 다운로드 전 버퍼 생성
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		
		// 파일 형식을 모든 확장자로 저장 
		response.setContentType("application/octet-stream");
		
		// 리스폰스 헤더에 원본 파일이름을 다운로드이름으로 저장
		String fileName = java.net.URLEncoder.encode(dto.getOrgname(),"UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		// 다운로드
		FileCopyUtils.copy(in, response.getOutputStream());
		
		// 종료
	    in.close();
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	@RequestMapping("delete.do")
	public String delete(HttpServletResponse response, HttpServletRequest request, int no)throws Exception{
		FileDTO dto = fileDAO.selectFile(no);
		
		// 삭제할 파일 위치
		String savePath = request.getRealPath("save");
		File file = new File(savePath + "\\" + dto.getSavename());
		
		// 파일 삭제 및 데이터베이스 삭제
		if(file.exists() == true){
			file.delete();
			fileDAO.fileDelete(no);
		}
		return "redirect:/file/list.do";	
	}
}







