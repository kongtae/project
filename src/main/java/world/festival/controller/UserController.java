package world.festival.controller;

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

	//�쉶�썝媛��엯 �솕硫� �씠�룞
	@RequestMapping(value = "/registermember", method = RequestMethod.GET)
	public String register() {
		return "member/register";
	}

	//�쉶�썝媛��엯
	@RequestMapping(value = "/registermember", method = RequestMethod.POST)
	public String registermember(UserVO vo, Model model) {
		System.out.println(vo);
		dao.registermember(vo);
		model.addAttribute("UserVO", vo);
		return "member/loginForm";
	}

	//以묐났泥댄겕
	@ResponseBody
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public int idcheck(String userid) {
		return dao.idcheck(userid);
	}

	//濡쒓렇�씤 �솕硫� �씠�룞
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginFrom() {
		return "member/loginForm";
	}

	//濡쒓렇�씤
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {
		UserVO result = dao.selectOne(vo);
		if(result != null) {
			session.setAttribute("loginid", result.getUserid());
			
			return "redirect:/";
		}
		model.addAttribute("result", false);
		return "member/loginForm";
	}

	//濡쒓렇�븘�썐
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	//�쑀���럹�씠吏� �씠�룞
	@RequestMapping(value = "/memberPage", method = RequestMethod.GET)
	public String memberPage() {
		return "member/memberPage";
	}

	//�쉶�썝 �닔�젙 �씠�룞
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberUpdate() {
		return "member/memberUpdate";
	}

	//�쉶�썝 �깉�눜 �씠�룞
	@RequestMapping(value = "/WithdrawForm", method = RequestMethod.GET)
	public String WithdrawForm() {
		return "member/withdrawForm";
	}

	//�쉶�썝 �깉�눜
	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	@ResponseBody
	public int withdraw(HttpSession session) {
		String id = (String)session.getAttribute("loginid");
		int result = dao.withdraw(id);
		session.invalidate();
		return result;
	}

	//�닔�젙李쎌뿉 異쒕젰
		@RequestMapping(value = "/select", method = RequestMethod.POST)
		@ResponseBody
		public UserVO select(HttpSession session) {
			String id = (String)session.getAttribute("loginid");
			UserVO vo = dao.select(id);
			System.out.println(vo);
			return vo;
		}
}
