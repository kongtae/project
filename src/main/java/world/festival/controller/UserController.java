package world.festival.controller;



import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.UserVO;
import world.festival.dao.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao ;

	//회원가입 화면 이동
	@RequestMapping(value = "/registermember", method = RequestMethod.GET)
	public String register() {
		return "member/register";
	}

	//회원가입
	@RequestMapping(value = "/registermember", method = RequestMethod.POST)
	public String registermember(UserVO vo, Model model) {
		System.out.println(vo);
		dao.registermember(vo);
		model.addAttribute("UserVO", vo);
		return "member/loginForm";
	}
	
	//중복체크
	@ResponseBody
	@RequestMapping(value="/idcheck")
	public int idcheck(String userid) {
		System.out.println(userid);
		return dao.idcheck(userid);
	}

	/*@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginFrom(Locale locale, Model model) {
		
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {
		UserVO result = service.login(vo, session);
		System.out.println(result);
		if(result == null) {
			model.addAttribute("wrong", false);
			return "loginForm";
		}
		model.addAttribute("result", result);
		return "main";
	}*/
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	/*@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String check(String id, Model model) {
		UserVO result = service.check(id);
		if(result != null) {
			model.addAttribute("check", false);
		}
		return "redirect:/";
	}*/
	
	
}
