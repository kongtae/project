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
	private BoardService boardserivce;
	@Autowired
	private ListDAO listdao;
	@Autowired
	private AdminService adminservice;
	@Autowired
	private AdminDAO admindao;
	
	//�뼱�뱶誘� �럹�씠吏�!
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
			System.out.println("異뺤젣 寃뚯떆�뙋 異붽� �닔�젙 �궘�젣 �궡�슜�쓣 蹂댁뿬二쇰뒗 移쒓뎄 " +adminlistvo);
			model.addAttribute("adminlistvo", adminlistvo); 
			
	
			return adminlistvo;
		}
		
//		/�뼱�뱶誘� �럹�씠吏�!
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
			for (int i = 0; i < adminbulvo.size(); i++) {
				if(adminbulvo.get(i).getUserid().equals("aa"))
				{
					adminbulvo.get(i).setUserid("管理者");
				}
					
			}
			model.addAttribute("adminbulvo", adminbulvo); 
			System.out.println("異뺤젣 寃뚯떆�뙋 異붽� �닔�젙 �궘�젣 �궡�슜�쓣 蹂댁뿬二쇰뒗 移쒓뎄 " +adminbulvo);
	
			return adminbulvo;
		}
		
		//bulpage 寃��깋 �슂泥�
		@RequestMapping(value = "/AdminBoardSelectOne", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody ArrayList<AdminBoardVO> AdminBoardSelectOne(Model model,
				@RequestParam(value="searchItem",defaultValue="title")String searchItem,
				@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
			System.out.println("item "+searchItem);
			System.out.println("keyword "+searchKeyword);
			ArrayList<AdminBoardVO> BoardSelectOne1 = new ArrayList<AdminBoardVO>();
			if(searchItem.equals("inputdate")){
			System.out.println("if臾몄븞�쑝濡� �뱾�뼱�삤�굹?");
			BoardSelectOne1 = adminservice.AdminBoardSelectOne1(searchItem,searchKeyword);	
			System.out.println("BoardSelectOne由ъ뒪�듃 異쒕젰111"+BoardSelectOne1);
			return BoardSelectOne1;
			}
			ArrayList<AdminBoardVO> BoardSelectOne2 = adminservice.AdminBoardSelectOne2(searchItem,searchKeyword);
			model.addAttribute("searchItem",searchItem);
			model.addAttribute("searchKeyword",searchKeyword);
			System.out.println("BoardSelectOne由ъ뒪�듃 異쒕젰222"+BoardSelectOne2);
			return BoardSelectOne2;
			}
		//adminList 寃��깋 �슂泥�
		
		@RequestMapping(value = "/AdminListSelectOne", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody ArrayList<AdminListVO> AdminListSelectOne(String endEvent,Model model,
				@RequestParam(value="searchItem",defaultValue="title")String searchItem,
				@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
			System.out.println("item "+searchItem);
			System.out.println("keyword "+searchKeyword);
			System.out.println("end "+endEvent);
			ArrayList<AdminListVO> selectOne1 = new ArrayList<AdminListVO>();
			if(searchItem.equals("startEvent")){
			System.out.println("if臾몄븞�쑝濡� �뱾�뼱�삤�굹?");
			selectOne1 = adminservice.AdminListSelectOne1(endEvent,searchItem,searchKeyword);	
			System.out.println("由ъ뒪�듃 異쒕젰111"+selectOne1);
			return selectOne1;
			}
			ArrayList<AdminListVO> selectOne2 = adminservice.AdminListSelectOne2(searchItem,searchKeyword);
			model.addAttribute("searchItem",searchItem);
			model.addAttribute("searchKeyword",searchKeyword);
			System.out.println("由ъ뒪�듃 異쒕젰222"+selectOne2);
			return selectOne2;
			}
		
		//�뼱�뱶誘� 蹂대뱶(�옄�쑀寃뚯떆�뙋) �뵒�뀒�씪
		@RequestMapping(value = "/AdminBoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
		public String AdminBoardDetailGO(AdminBoardVO vo1 , ReplyVO vo,Model model,HttpSession hs) {
			AdminBoardVO vo2 = admindao.readAdminBoard(vo1);
			model.addAttribute("vo", vo2);
			System.out.println("蹂대뱶�뵒�뀒�씪�떒�쓽 BoardVO �쓽 媛� :" + vo2);

			return "admin/adminBoardDetail";
		}
		
		
		
		@RequestMapping(value = "/AdminlistDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
		public String AdminlistDetailGO(AdminListVO vo1,Model model, HttpSession hs,RedirectAttributes rttr) {
			AdminListVO vo2 = admindao.readAdminList(vo1);
			model.addAttribute("vo", vo2);
			return "admin/adminListDetail";
		}
//		ListRecovery
		@RequestMapping(value = "/ListRecovery", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String ListRecovery(ListVO vo, AdminListVO adminvo, Model model, HttpSession hs,RedirectAttributes rttr) {
			ListVO vo1 = adminservice.RecoveryRead(vo);
			System.out.println("VO1 : "+vo1);
			AdminListVO adminvo1 = admindao.readAdminList(adminvo);
			if(adminvo.getDatacheck().equals("fedelete") || adminvo.getDatacheck().equals("adDelete"))
			{
				listserivce.RewriteFestival(vo1);
				adminvo1.setDatacheck("delRecovery");
				adminservice.AdminwriteFestival(adminvo1);
				return "list/List";
			}
			
			else if(adminvo.getDatacheck().equals("feupdateAft") || adminvo.getDatacheck().equals("feupdateBef")
					|| adminvo.getDatacheck().equals("upRecovery") || adminvo.getDatacheck().equals("feinsert") )
			{
				int result = listserivce.ReupdateFestival(vo1);
				if(result == 0){
					listserivce.RewriteFestival(vo1);
					adminvo1.setDatacheck("delRecovery");
					adminservice.AdminwriteFestival(adminvo1);
					return "list/List";
				}
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
			AdminListVO adminvo1 = admindao.readAdminList(adminvo);
			adminvo1.setDatacheck("adDelete");
			adminservice.AdminwriteFestival(adminvo1);
			
			adminservice.AdminDeleteList(vo1);
			adminservice.AdminwriteFestival(adminvo1);
			return "list/List";
		}
		
		
		@RequestMapping(value = "/BulRecovery", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String BulRecovery(BoardVO vo, AdminBoardVO adminvo, Model model, HttpSession hs,RedirectAttributes rttr) {
			BoardVO vo1 = adminservice.RecoveryReadBul(vo);
			AdminBoardVO adminvo1 = admindao.readAdminBoard(adminvo);
			System.out.println("遺� vo"+vo);
			if(adminvo.getDatacheck().equals("buldelete") || adminvo.getDatacheck().equals("adDelete"))
			{
				boardserivce.RewriteBoard(vo1);
				adminvo1.setDatacheck("delRecovery");
				adminservice.AdminBoardWrite(adminvo1);
				return "board/BoardList";
			}
			
			else if(adminvo.getDatacheck().equals("bulupdateBef") || adminvo.getDatacheck().equals("bulupdateAft")
					|| adminvo.getDatacheck().equals("upRecovery") || adminvo.getDatacheck().equals("bulinsert"))
			{
				int result = boardserivce.ReupdateBoard(vo1);
				if(result == 0)
				{
					boardserivce.RewriteBoard(vo1);
					adminvo1.setDatacheck("delRecovery");
					adminservice.AdminBoardWrite(adminvo1);
					return "board/BoardList";
				}
				adminvo1.setDatacheck("upRecovery");
				adminservice.AdminBoardWrite(adminvo1);
				return "board/BoardList";
			}

			return "board/BoardList";
		}
		
		@RequestMapping(value = "/AdminDeleteBul", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String AdminDeleteBul(BoardVO vo, AdminBoardVO adminvo, Model model, HttpSession hs,RedirectAttributes rttr) {
//			ListVO vo1 = adminservice.RecoveryRead(vo);
			BoardVO vo1 = adminservice.RecoveryReadBul(vo);
			AdminBoardVO adminvo1 = admindao.readAdminBoard(adminvo);
			adminvo1.setDatacheck("adDelete");
			
			adminservice.AdminDeleteBul(vo1);
			adminservice.AdminBoardWrite(adminvo1);
			return "board/BoardList";
		}
		
}
