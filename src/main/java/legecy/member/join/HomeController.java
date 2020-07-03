package legecy.member.join;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import legecy.member.dao.UserVO;
import legecy.member.email.Mailsend;
import legecy.member.email.mailVO;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private Mailsend mailsend;
	
	private UserVO vo;
	
	HttpSession session_check;
// -----------------------------------------------------------------------------------------	
	//Main 페이지
	@RequestMapping(value = "aca_FirstPage.p", method=RequestMethod.GET)
	public String academyFirstPage() {
		return "aca_FirstPage";
	}
// -----------------------------------------------------------------------------------------	
	//Login 페이지
	@RequestMapping(value = "aca_LoginPage.p", method=RequestMethod.GET)
	public String aca_LoginPage() {
		return "aca_LoginPage";
	}	
// -----------------------------------------------------------------------------------------------------------------------
	@ResponseBody //: @ResponseBody를 사용해주면 view를 생성해주는것이 아니라, JSON 혹은 Object 형태로 데이터를 넘겨준다. 
	@RequestMapping(value = "aca_LoginPage_form.p", method = RequestMethod.POST) //produces = "application/json; charset=utf8" 이걸뺴니까 된다. 이게 뭘까 
	public Object aca_LoginPage_form(HttpServletRequest req,@RequestBody Map<String, Object> vo2) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo = new UserVO();
		vo.setId((String)vo2.get("id"));
		vo.setPw((String)vo2.get("pw"));
		
		System.out.println(vo.getId() + "이게 아이디");
		
		System.out.println(vo.getPw() + "이게 비번");

		//결과값을 넣음
		String msg = "";
		
		if(vo2.get("id").equals("")) {
			msg = "아이디를 입력해주세요.";
			return msg;
		}else if(vo2.get("pw").equals("")){
				msg = "비밀번호를 입력하세요";
				return msg;
		}else {
			int id_chk = sqlSession.selectOne("legecy.member.dao.UserVO.useridchk", vo);
			if(id_chk == 0) {
				msg = "아이디가 맞지 않습니다.";
				return msg;
			}else {
				int idpw_chk = sqlSession.selectOne("legecy.member.dao.UserVO.useridpwchk", vo);
				if(idpw_chk == 0) {
					msg = "비밀번호가 맞지 않습니다.";
					return msg;
				}else {
					map.put("user_id", (String)vo2.get("id"));
					
					session_check = req.getSession();
					session_check.setAttribute("user_info", vo2.get("id"));
					
					System.out.println(session_check.getId());
					
//					System.out.println("세션 값 : "+session);
					
					map.put("success", "user_First.c");
					return map;
				}
			}
		}
	}
// -------------------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value = "aca_Logout.p", method = RequestMethod.GET) //produces = "application/json; charset=utf8" 이걸뺴니까 된다. 이게 뭘까 
	public String aca_Logout(HttpServletRequest req) throws Exception {
		
		String result = (String) session_check.getAttribute("user_info");
		//로그아웃 처리후 처음페이지로 가지만 F5를 누르면 페이지를 찾지 못한다.
		System.out.println(result);
		
		System.out.println("로그 아웃 페이지의 세션 : " +session_check.getId());
	    session_check.invalidate();
		
		return "aca_FirstPage";
	}
// -----------------------------------------------------------------------------------------	
	//결과화면 페이지
	@RequestMapping(value = "user_First.c", method=RequestMethod.GET)
	public String aca_LoginResultPage(HttpServletRequest req,Model model) {
		
		String result = (String)session_check.getAttribute("user_info");
		String user_id = vo.getId();
			
		model.addAttribute("user_name", user_id);
		model.addAttribute("conn_se", result);
			
		return "aca_FirstPage";
	}
// -----------------------------------------------------------------------------------------	
	//회원가입 페이지
	@RequestMapping(value = "aca_membershipJoinPage.p", method=RequestMethod.GET)
	public String aca_membershipJoinPage() {
		return "aca_membershipJoinPage";
	}
// -----------------------------------------------------------------------------------------
	//회원가입 페이지
	@ResponseBody
	@RequestMapping(value = "aca_Loginid_check.p", method=RequestMethod.POST)
	public int aca_Loginid_check(Model model, HttpServletRequest req, UserVO vo) {
		
		System.out.println(vo.toString());
		int check_id = sqlSession.selectOne("legecy.member.dao.UserVO.useridchk", vo);
		System.out.println(check_id);
		
		return check_id;
	}
// -----------------------------------------------------------------------------------------	
	@ResponseBody
	@RequestMapping(value = "aca_emailsend.p", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public void aca_emailsend(HttpSession session, @RequestBody String email, HttpServletRequest req) {
		int randomCode = new Random().nextInt(10000) + 1000;
		String joinCode = String.valueOf(randomCode);
		String subject = "KH 회원가입 승인 번호 입니다.";
		
		StringBuilder text = new StringBuilder();
		text.append("회원가입 승인번호는 ").append(joinCode).append(" 입니다.");
		
		session_check = req.getSession();
		
		session_check.setAttribute("joinCode", joinCode);
		System.out.println(joinCode);
		System.out.println(email);
		Map<String, Object> mail_map = new HashMap<String, Object>();
		mail_map.put("subject", subject);
		mail_map.put("text", text.toString());
		mail_map.put("from", "hostname021@gmail.com");
		mail_map.put("to", email);
		
		boolean email_check =  mailsend.send(mail_map);
		
		if(email_check) {
			System.out.println(email_check);
		}else {
			System.out.println(email_check);
		}
//		return msg;
	}
//----------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "aca_emailAuthentication.p", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public int aca_emailAuthentication(@RequestBody String email) {
		String number = (String)session_check.getAttribute("joinCode");
		System.out.println(number);
		System.out.println(email);
		
		if(number.equals(email)) {
			return 1;
		}else {
			return 0;
		}
		
	}
//----------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "boardAll.p", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public List<Map<String, Object>> boardSetting() {
		
		List<Map<String, Object>> boardList;
		
		boardList = sqlSession.selectList("legecy.member.dao.UserVO.SelectBaordAll");
		
		return boardList;
	}
	
// -----------------------------------------------------------------------------------------	
	//회원가입 정보를 DB에 적재 
	@RequestMapping(value = "aca_membershipJoinPage_form.p", method= RequestMethod.POST)
	public String aca_membershipJoinPage_form(HttpServletRequest request, Model model) {
		
		System.out.println("RequestMethod.POST");
		
		String id = request.getParameter("ac_id");
		String pw = request.getParameter("ac_pw");
		String email = request.getParameter("ac_emlist");
		
		System.out.println(id + pw);
		int result = sqlSession.selectOne("legecy.member.dao.UserVO.useridpwchk", vo);
				
		System.out.println("resultnum:" + result);
		
		System.out.println("sessionid :" + request.getSession().getId());
		
		if(result == 1) {
			System.out.println("회원가입 성공");
			System.out.println(result);
		}else {
			System.out.println("회원가입 실패");
			System.out.println(result);
		}
		
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		
		return "aca_membershipJoinresultPage";
	}
	
}
