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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import world.festival.VO.ListVO;
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
	public String listDetail(ListVO vo,Model model) {
		ListVO vo1 = dao.listDetail(vo);
		System.out.println(vo1);
		model.addAttribute("vo", vo1);
		return "list/ListDetail";
	}
}
