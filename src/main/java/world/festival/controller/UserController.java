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
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public int idcheck(String userid) {
		return dao.idcheck(userid);
	}

	//로그인 화면 이동
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginFrom() {
		return "member/loginForm";
	}

	//로그인
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {
		UserVO result = dao.selectOne(vo);
		if(result != null) {
			session.setAttribute("loginid", result.getUserid());
			return "redirect:/";
		}
		return "redirect:/loginForm";
	}

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	//유저페이지 이동
	@RequestMapping(value = "/memberPage", method = RequestMethod.GET)
	public String memberPage() {
		return "member/memberPage";
	}

	//회원 수정 이동
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberUpdate() {
		return "member/memberUpdate";
	}

	//회원 탈퇴 이동
	@RequestMapping(value = "/WithdrawForm", method = RequestMethod.GET)
	public String WithdrawForm() {
		return "member/withdrawForm";
	}

	//회원 탈퇴
	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	@ResponseBody
	public int withdraw(HttpSession session) {
		String id = (String)session.getAttribute("loginid");
		int result = dao.withdraw(id);
		session.invalidate();
		return result;
	}

}
