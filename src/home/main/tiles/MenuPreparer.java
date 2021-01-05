package home.main.tiles;

import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.springframework.beans.factory.annotation.Autowired;

import home.model.dto.BoardDTO;
import home.model.dto.FileDTO;
import home.model.service.BoardService;
import home.model.service.FileService;

public class MenuPreparer implements ViewPreparer{

	@Autowired
	private BoardService boardDAO = null;
	
	@Autowired
	private BoardDTO boardDto = null;
	
	@Autowired
	private FileService fileDAO = null;
	
	@Override
	public void execute(TilesRequestContext tilesContext, AttributeContext attributeContext){
		List populerList = null;
		List fileList = new ArrayList();
		int fileNo = 0;
		
		
		try {
			populerList = boardDAO.populerArticle();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i = 0; i < populerList.size(); i++ ) {
			FileDTO fileDTO = new FileDTO();
			fileNo = ((BoardDTO) populerList.get(i)).getFile_no();
			if(fileNo != 0) {
				try {
					fileDTO = fileDAO.selectFile(fileNo);
					String ext = fileDTO.getSavename().substring(fileDTO.getSavename().lastIndexOf(".")).toLowerCase();
					System.out.println(ext);
					fileDTO.setExt(ext);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				fileDTO.setSavename("nofile");
			}
			fileList.add(fileDTO);
		}
		
		attributeContext.putAttribute("fileList", new Attribute(fileList), true);
		attributeContext.putAttribute("populerList", new Attribute(populerList), true);
	}

}
