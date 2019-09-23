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

import world.festival.VO.AdminVO;
import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.VO.WishVO;
import world.festival.dao.AdminDAO;
import world.festival.dao.UserDAO;
import world.festival.service.AdminService;
import world.festival.service.UserService;
//import world.festival.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao ;
	
	@Autowired
	private UserService service;
	
	@Autowired
	private AdminDAO admindao ;
	
	@Autowired
	private AdminService adminservice;

	//회원가입 페이지로 이동
	@RequestMapping(value = "/registermember", method = RequestMethod.GET)
	public String register() {
		return "member/register";
	}

	//회원가입 로직
	@RequestMapping(value = "/registermember", method = RequestMethod.POST)
	public String registermember(UserVO vo, Model model) {
		System.out.println(vo);
		dao.registermember(vo);
		model.addAttribute("UserVO", vo);
		return "member/loginForm2";
	}

	//ID중복체크
	@ResponseBody
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public int idcheck(String userid) {
		return dao.idcheck(userid);
	}

	//로그인폼으로 이동
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginFrom() {
		return "member/loginForm";
	}

	//로그인  어드민도 포함
	@RequestMapping(value = "/loginForm1", method = RequestMethod.POST)
	@ResponseBody
	public String login(UserVO vo,AdminVO adminvo, HttpSession session) {
		//어드민로그인시
		System.out.println("uservo"+vo);
		System.out.println("로그인폼 어드민"+adminvo);
		if(adminvo.getUserid().length()==2 )
		{
			admindao.selectadmin(adminvo,session);
			return "admin";
		}
		UserVO result = dao.selectOne(vo, session);
		System.out.println("로그인 vo값 " + vo);
		System.out.println("로그인 result값 " + result);
		return "success";
	}
	

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/loginForm";
	}

	//맴버페이지  서비스==> DAO
	@RequestMapping(value = "/memberPage", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberPage(HttpSession session,ListVO listvo,Model model) {
		String userid=(String)session.getAttribute("loginid");
		System.out.println(userid);
		UserVO us=new UserVO();
		us.setUserid(userid);
		ArrayList<ListVO> result=service.selectlistAll(userid);
		System.out.println("내가원하는대로 값 가져오는지 확인:"+result);
		model.addAttribute("list", result);
		model.addAttribute("listsize", result.size());
		return "member/memberPage";
	}
	
	//어드민 페이지!
	@RequestMapping(value = "/adminPage", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminPage(HttpSession session,ListVO listvo,Model model) {
		String adminid=(String)session.getAttribute("adminid");
		System.out.println(adminid);
		return "admin/adminPage";
	}
	//회원정보 수정 창으로 이동
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberUpdate() {
		return "member/memberUpdate";
	}

	//축제 등록 페이지로 이동
	@RequestMapping(value = "/WithdrawForm", method = RequestMethod.GET)
	public String WithdrawForm() {
		return "member/withdrawForm";
	}

	//축제내용 등록
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

	//맴버 업데이트(사진경로 중요)
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
