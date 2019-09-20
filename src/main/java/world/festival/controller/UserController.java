package world.festival.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.VO.WishVO;
import world.festival.dao.UserDAO;
import world.festival.service.UserService;
//import world.festival.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao ;
	
	@Autowired
	private UserService service;

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
		System.out.println("로그인 vo값 " + vo);
		System.out.println("로그인 result값 " + result);
		if(result!=null){
		session.setAttribute("loginid", result.getUserid());
		//session.setAttribute("username", result.getUsername());
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

	//맴버페이지  서비스==> DAO
	@RequestMapping(value = "/memberPage", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberPage(HttpSession session,WishVO wishvo, UserVO uservo, ListVO listvo) {
		String userid=(String)session.getAttribute("loginid");
		uservo.setUserid(userid);
		wishvo.setUserid(userid);
		listvo.setUserid(userid);
		
		ArrayList<WishVO> wvo=service.selectwish(userid);
		System.out.println("wishList" + wvo);
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

	//수정창에 출력
	@RequestMapping(value = "/select", method = RequestMethod.POST)
	@ResponseBody
	public UserVO select(HttpSession session) {
		String id = (String)session.getAttribute("loginid");
		UserVO vo = dao.select(id);
		return vo;
	}

	//업데이트
	@RequestMapping(value = "/updateMember", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody void updateMember(UserVO vo, String new_userpwd, MultipartFile uploadFileName) {
		try {
			System.out.println("업데이트 시작한다." +vo);
			
			System.out.println("업로드 파일 : " + uploadFileName);
			if(vo.getUserpwd().isEmpty()) {
				new_userpwd = null;

			}
			vo.setUserpwd(new_userpwd);
			
			UserVO result = dao.select(vo.getUserid());
			vo.setOriginalFileName(result.getOriginalFileName());
			vo.setSavedFileName(result.getSavedFileName());
			
			System.out.println(uploadFileName.getOriginalFilename());
			
			System.out.println("vo : " + vo);
			boolean res = service.updateMember(vo, uploadFileName);
			boolean replyres=service.updateReply(vo, uploadFileName);
			System.out.println(res);
			System.out.println("replyres::"+replyres);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	//수정창에 출력
		@RequestMapping(value = "/memberSelect", method = RequestMethod.POST)
		@ResponseBody
		public UserVO memberSelect(HttpSession session) {
			String id = (String)session.getAttribute("loginid");
			UserVO vo = dao.memberSelect(id);
			return vo;
		}
	
}
