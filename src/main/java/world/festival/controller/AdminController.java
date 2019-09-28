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
import world.festival.dao.ListDAO;
import world.festival.service.AdminService;
import world.festival.service.BoardService;
import world.festival.service.ListService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	@Autowired
	private ListService listserivce;
	
	@Autowired
	private ListDAO listdao;
	
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
			AdminBoardVO vo2 = admindao.readAdminBoard(vo1);
			model.addAttribute("vo", vo2);
			System.out.println("보드디테일단의 BoardVO 의 값 :" + vo2);

			return "admin/adminBoardDetail";
		}
		
		
		
		@RequestMapping(value = "/AdminlistDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
		public String AdminlistDetailGO(AdminListVO vo1,Model model, HttpSession hs,RedirectAttributes rttr) {
			AdminListVO vo2 = admindao.readAdminList(vo1);
			model.addAttribute("vo", vo2);
			System.out.println("보드디테일단의 BoardVO 의 값 :" + vo2);

				
			return "admin/adminListDetail";
		}
//		ListRecovery
		@RequestMapping(value = "/ListRecovery", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String ListRecovery(ListVO vo, AdminListVO adminvo, Model model, HttpSession hs,RedirectAttributes rttr) {
			ListVO vo1 = adminservice.RecoveryRead(vo);
			AdminListVO adminvo1 = admindao.readAdminList(adminvo);
			if(adminvo.getDatacheck().equals("fedelete"))
			{
				listserivce.RewriteFestival(vo1);
				adminvo1.setDatacheck("delRecovery");
				adminservice.AdminwriteFestival(adminvo1);
				return "list/List";
			}
			else if(adminvo.getDatacheck().equals("feupdate"))
			{
				listserivce.ReupdateFestival(vo1);
				adminvo1.setDatacheck("upRecovery");
				adminservice.AdminwriteFestival(adminvo1);
				return "list/List";
			}
			

			return "list/List";
		}
		
		@RequestMapping(value = "/AdminDeleteList", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String AdminDeleteList(ListVO vo, AdminListVO adminvo, Model model, HttpSession hs,RedirectAttributes rttr) {
			ListVO vo1 = adminservice.RecoveryRead(vo);
			
			adminservice.AdminDeleteList(vo1);
			return "list/List";
		}
		
}
