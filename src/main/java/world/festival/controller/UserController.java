package world.festival.controller;



import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import world.festival.VO.UserVO;
import world.festival.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service ;
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
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
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	@RequestMapping(value = "/signupForm", method = RequestMethod.GET)
	public String signupForm() {
		return "member/register";
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String check(String id, Model model) {
		UserVO result = service.check(id);
		if(result != null) {
			model.addAttribute("check", false);
		}
		return "redirect:/";
	}
	
	
}
