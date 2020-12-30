package home.main.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {
	
    @RequestMapping("test")
    public String test() throws Exception {
        return "/test/test";
    }

    @RequestMapping("main")
    public String main() throws Exception {
        return "/test/main";
    }
}
