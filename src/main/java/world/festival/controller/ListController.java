package world.festival.controller;


import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import world.festival.VO.ListVO;
import world.festival.VO.SearchVO;
import world.festival.dao.ListDAO;
import world.festival.dao.ListService;


@Controller
public class ListController {
	
	@Autowired
	private ListDAO dao;
	
	@Autowired
	private ListService service;
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm() {
		
		return "list/List";
	}
	@RequestMapping(value = "/listDetailForm", method = RequestMethod.GET)
	public String listDetailForm() {
		
		return "list/ListDetail";
	}
	@RequestMapping(value = "/insertFestival", method = RequestMethod.GET)
	public String insertFestival() {
		
		return "list/writeFestival";
	}
	@RequestMapping(value = "/writeFestival", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String writeFestival(ListVO vo, HttpSession session, MultipartFile uploadFileName, RedirectAttributes rttr) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("vo:"+vo);
	//	System.out.println("uploadfile"+uploadfile.getOriginalFilename());
		boolean result = service.writeFestival(vo,uploadFileName);
		System.out.println("result:"+result);
		rttr.addFlashAttribute("insertresult", result);
		return "list/writeFestival";
	}
	
	@RequestMapping(value = "/printAll", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ListVO> printAll(ListVO vo, HttpSession session) {
		//String userid = (String)session.getAttribute("userid");
		//vo.setId(userid);
		ArrayList<ListVO> list = dao.printAll();
		System.out.println("리스트 출력"+list);
		 return list;
	}
	@RequestMapping(value = "/listDetailGO", method = RequestMethod.GET)
	public String listDetail(ListVO vo,Model model, HttpSession hs,RedirectAttributes rttr) {
		ListVO vo1 = dao.listDetail(vo);
		System.out.println(vo1);
		model.addAttribute("vo", vo1);
		return "list/ListDetail";
	}
	@RequestMapping(value = "/selectOne", method = RequestMethod.GET)
	public @ResponseBody ArrayList<SearchVO> selectOne(/*SearchVO vo,*/ HttpSession session,Model model,
			@RequestParam(value="searchItem",defaultValue="title")String searchItem,
			@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
		System.out.println("item "+searchItem);
		System.out.println("keyword "+searchKeyword);
/*		System.out.println("end "+vo.getEndEvent());
		ArrayList<SearchVO> selectOne1 =new ArrayList<SearchVO>();
		vo.setSearchItem(searchItem);
		vo.setSearchKeyword(searchKeyword);
		System.out.println("vo11 "+vo);
		if(searchItem.equals("startEvent")){
		System.out.println("if문안으로 들어오나?");
		selectOne1 = dao.selectOne(vo);	
		System.out.println("리스트 출력111"+selectOne1);
		return selectOne1;
		}*/
		ArrayList<SearchVO> selectOne2 = dao.selectOne2(searchItem,searchKeyword);
		/*model.addAttribute("selectOne",selectOne);*/
		model.addAttribute("searchItem",searchItem);
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("리스트 출력222"+selectOne2);
		return selectOne2;
		}
	
}
