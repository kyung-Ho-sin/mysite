package legecy.member.join;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/error/*")
public class ErrorController {
	
	//Main 페이지
	@RequestMapping(value = "error404", method=RequestMethod.GET)
	public String error404() {
		return "error404";
	}
	//Login 페이지
	@RequestMapping(value = "error500", method=RequestMethod.GET)
	public String error500() {
		return "error500";
	}	
//	@ResponseBody
	
	
	
}
