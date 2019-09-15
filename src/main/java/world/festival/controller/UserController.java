package world.festival.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.UserVO;
import world.festival.dao.UserDAO;
import world.festival.dao.UserService;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao ;
	
	@Autowired
	private UserService service;

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
		model.addAttribute("result", false);
		return "member/loginForm";
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

	//수정창에 출력
	@RequestMapping(value = "/select", method = RequestMethod.POST)
	@ResponseBody
	public UserVO select(HttpSession session) {
		String id = (String)session.getAttribute("loginid");
		UserVO vo = dao.select(id);
		return vo;
	}

	//업데이트
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(UserVO vo, String new_userpwd, MultipartFile uploadFile) {
		System.out.println("업로드 파일 : " + uploadFile);
		if(vo.getUserpwd().isEmpty()) {
			new_userpwd = null;
		}
		vo.setUserpwd(new_userpwd);
		
		UserVO result = dao.select(vo.getUserid());
		vo.setOriginalFileName(result.getOriginalFileName());
		vo.setSavedFileName(result.getSavedFileName());
		
		System.out.println(uploadFile.getOriginalFilename());
		
		System.out.println("vo : " + vo);
		service.updateMember(vo, uploadFile);
		return "member/memberPage";
	}
}
