package home.main.tiles;

import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.springframework.beans.factory.annotation.Autowired;
import home.model.service.BoardService;

public class MenuPreparer implements ViewPreparer{

	@Autowired
	private BoardService boardDAO = null;
	
	@Override
	public void execute(TilesRequestContext tilesContext, AttributeContext attributeContext) {
		List populerList = null;
		try {
			populerList = boardDAO.populerArticle();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 attributeContext.putAttribute("populerList", new Attribute(populerList), true);
	}

}
