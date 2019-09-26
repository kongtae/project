package world.festival.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import world.festival.VO.AdminBoardVO;
import world.festival.VO.AdminListVO;
import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.VO.WishVO;
import world.festival.dao.AdminDAO;
import world.festival.dao.BoardDAO;
import world.festival.service.AdminService;
import world.festival.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	@Autowired
	private BoardService service;

	@Autowired
	private BoardDAO dao;
	
	
	@Autowired
	private AdminService adminservice;
	@Autowired
	private AdminDAO admindao;
	
	//어드민 페이지!
		@RequestMapping(value = "/adminListPage", method = {RequestMethod.GET, RequestMethod.POST})
		public String adminPage(HttpSession session, Model model) {
	
			return "admin/adminListPage";
		}
		@RequestMapping(value = "/printAlladminListVO", method = {RequestMethod.GET, RequestMethod.GET})
		@ResponseBody
		public ArrayList<AdminListVO> printAlladminListVO(HttpSession session, Model model) {
			String adminid=(String)session.getAttribute("adminid");
			System.out.println(adminid);
			ArrayList<AdminListVO> adminlistvo = adminservice.selectListAll();
			System.out.println("축제 게시판 추가 수정 삭제 내용을 보여주는 친구 " +adminlistvo);
			model.addAttribute("adminlistvo", adminlistvo); 
			
	
			return adminlistvo;
		}
		
//		/어드민 페이지!
		@RequestMapping(value = "/adminBulPage", method = {RequestMethod.GET, RequestMethod.POST})
		public String adminBulPage(HttpSession session, Model model) {
	
			return "admin/adminBulPage";
		}
		
		@RequestMapping(value = "/printAlladminBulVO", method = {RequestMethod.GET, RequestMethod.GET})
		@ResponseBody
		public ArrayList<AdminBoardVO> printAlladminBulVO(HttpSession session, Model model) {
			String adminid=(String)session.getAttribute("adminid");
			System.out.println(adminid);
			ArrayList<AdminBoardVO> adminbulvo = adminservice.selectBulAll();
			model.addAttribute("adminbulvo", adminbulvo); 
			System.out.println("축제 게시판 추가 수정 삭제 내용을 보여주는 친구 " +adminbulvo);
	
			return adminbulvo;
		}
		
		//bulpage 검색 요청
		@RequestMapping(value = "/AdminBoardSelectOne", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody ArrayList<AdminBoardVO> AdminBoardSelectOne(Model model,
				@RequestParam(value="searchItem",defaultValue="title")String searchItem,
				@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
			System.out.println("item "+searchItem);
			System.out.println("keyword "+searchKeyword);
			ArrayList<AdminBoardVO> BoardSelectOne1 = new ArrayList<AdminBoardVO>();
			if(searchItem.equals("inputdate")){
			System.out.println("if문안으로 들어오나?");
			BoardSelectOne1 = adminservice.AdminBoardSelectOne1(searchItem,searchKeyword);	
			System.out.println("BoardSelectOne리스트 출력111"+BoardSelectOne1);
			return BoardSelectOne1;
			}
			ArrayList<AdminBoardVO> BoardSelectOne2 = adminservice.AdminBoardSelectOne2(searchItem,searchKeyword);
			model.addAttribute("searchItem",searchItem);
			model.addAttribute("searchKeyword",searchKeyword);
			System.out.println("BoardSelectOne리스트 출력222"+BoardSelectOne2);
			return BoardSelectOne2;
			}
		//adminList 검색 요청
		
		@RequestMapping(value = "/AdminListSelectOne", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody ArrayList<AdminListVO> AdminListSelectOne(String endEvent,Model model,
				@RequestParam(value="searchItem",defaultValue="title")String searchItem,
				@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
			System.out.println("item "+searchItem);
			System.out.println("keyword "+searchKeyword);
			System.out.println("end "+endEvent);
			ArrayList<AdminListVO> selectOne1 = new ArrayList<AdminListVO>();
			if(searchItem.equals("startEvent")){
			System.out.println("if문안으로 들어오나?");
			selectOne1 = adminservice.AdminListSelectOne1(endEvent,searchItem,searchKeyword);	
			System.out.println("리스트 출력111"+selectOne1);
			return selectOne1;
			}
			ArrayList<AdminListVO> selectOne2 = adminservice.AdminListSelectOne2(searchItem,searchKeyword);
			model.addAttribute("searchItem",searchItem);
			model.addAttribute("searchKeyword",searchKeyword);
			System.out.println("리스트 출력222"+selectOne2);
			return selectOne2;
			}
		
		//어드민 보드(자유게시판) 디테일
		@RequestMapping(value = "/AdminBoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
		public String AdminBoardDetailGO(AdminBoardVO vo1 , ReplyVO vo,Model model,HttpSession hs) {
			String userid=(String)hs.getAttribute("loginid");
			vo.setUserid(userid);
			System.out.println("bul_boardnum 의  값111 : " + vo1.getBul_boardnum());
			System.out.println("bul 현재 히트 수 " +  vo1.getHit());
			AdminBoardVO vo2 = admindao.readAdminBoard(vo1);
			model.addAttribute("vo", vo2);
			System.out.println("보드디테일단의 BoardVO 의 값 :" + vo2);
//			ArrayList<ReplyVO> replylist=service.replyList(vo);
//			System.out.println("댓글 리스트 "+replylist);
			//댓글 갯수
//			model.addAttribute("replycount", replylist.size());
//			model.addAttribute("replylist", replylist);
			return "admin/adminBoardDetail";
		}
		
		
		
		@RequestMapping(value = "/AdminlistDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
		public String AdminlistDetailGO(AdminListVO vo,Model model, HttpSession hs,RedirectAttributes rttr) {
			AdminListVO vo1 = admindao.readAdminList(vo);
			String userid=(String)hs.getAttribute("loginid");
			vo.setUserid(userid);
//			ArrayList<ReplyVO> replylist=service.replyList(vo.getMainBoardNum());
//			System.out.println("댓글 리스트 "+replylist);
			System.out.println(vo1);
			model.addAttribute("vo", vo1);
			
			//댓글 갯수
//			model.addAttribute("replycount", replylist.size());
//			model.addAttribute("replylist", replylist);
//			int wish=wishsrvice.selectWish(vo);
//			System.out.println("위시리스트 여부판단"+wish);
			//좋아요 여부판단!
//			String like=null;
//			if(wishsrvice.selectWish(vo)>0)
//			{
//				like="like";
//			}
//			model.addAttribute("like", like);
			//좋아요 갯수 판단
//			ArrayList<WishVO> wishlist=wishsrvice.wishList(vo.getMainBoardNum());
//			model.addAttribute("wishlist", wishlist.size());
			return "admin/adminListDetail";
		}
		
}
