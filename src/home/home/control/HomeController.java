package home.home.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.action.action.SuperAction;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
       
	private Map action = new HashMap();
	public void init(ServletConfig config) throws ServletException {
		String uri = config.getInitParameter("action");
		try{
			Properties pro = new Properties();
			InputStream in = new FileInputStream(uri);
			pro.load(in);
			
			Enumeration enu = pro.keys();
			while(enu.hasMoreElements()) {
				String key = (String)enu.nextElement();
				String value = pro.getProperty(key);
				Class cla = Class.forName(value);
				Object obj = cla.newInstance();
				action.put(key, obj);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getRequestURI();
		String view = "";
		if(key != null) {
			Object obj = action.get(key);
			if(obj != null) {
				SuperAction action = (SuperAction)obj;
				view = action.requestAction(request, response);
			}
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

}
