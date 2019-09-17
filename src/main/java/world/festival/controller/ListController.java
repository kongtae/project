package world.festival.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.ListDAO;
import world.festival.service.ListService;
//import world.festival.dao.ReplyService;


@Controller
public class ListController {
	
	@Autowired
	private ListDAO dao;
	
	@Autowired
	private ListService service;
	
	@Autowired
//	private ReplyService service;
	
	
	@RequestMapping(value = "/listForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String listForm() {
		
		return "list/List";
	}
	@RequestMapping(value = "/listDetailForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String listDetailForm() {
		
		return "list/ListDetail";
	}
	@RequestMapping(value = "/insertFestival", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertFestival() {
		
		return "list/WriteFestival";
	}
	@RequestMapping(value = "/writeFestival", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String writeFestival(ListVO vo, HttpSession session,/* MultipartFile uploadFileName,*/ MultipartHttpServletRequest request , RedirectAttributes rttr) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("인설트VO: "+vo);
		System.out.println("리퀘스트 총 몇개? " +request.toString());
		boolean result = service.writeFestival(vo,request);
		System.out.println("result:"+result);
		return "success"; 
	}
	
	@RequestMapping(value = "/updateFestival", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String updateFestival(ListVO vo, HttpSession session, MultipartHttpServletRequest request , RedirectAttributes rttr) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("업데이트VO: "+vo);
		System.out.println("리퀘스트 총 몇개? " +request.toString());
		boolean result = service.updateFestival(vo,request);
		System.out.println("result:"+result);
		return "success"; 
	}
	
	
	@RequestMapping(value = "/printAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<ListVO> printAll() {
		ArrayList<ListVO> list = dao.printAll();

		System.out.println("리스트 출력"+list);
//		ArrayList<ListVO> list = service.printAll();
		System.out.println("전체리스트 출력"+list);
		 return list;
	}
	
	@RequestMapping(value = "/listDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
	public String listDetail(ListVO vo,Model model, HttpSession hs,RedirectAttributes rttr) {
		ListVO vo1 = dao.listDetail(vo);
		ArrayList<ReplyVO> replylist=service.replyList(Integer.parseInt(vo.getMainBoardNum()));
		System.out.println("댓글 리스트 "+replylist);
		System.out.println(vo1);
		model.addAttribute("vo", vo1);
		//댓글 갯수
		model.addAttribute("replycount", replylist.size());
		model.addAttribute("replylist", replylist);
		return "list/ListDetail";
	}
	@RequestMapping(value = "/selectOne", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ListVO> selectOne(ListVO vo,Model model,
			@RequestParam(value="searchItem",defaultValue="title")String searchItem,
			@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
		System.out.println("item "+searchItem);
		System.out.println("keyword "+searchKeyword);
		System.out.println("end "+vo.getEndEvent());
		ArrayList<ListVO> selectOne1 = new ArrayList<ListVO>();
		System.out.println("vo11 "+vo);
		if(searchItem.equals("startEvent")){
		System.out.println("if문안으로 들어오나?");
		selectOne1 = service.selectOne(vo,searchItem,searchKeyword);	
		System.out.println("리스트 출력111"+selectOne1);
		return selectOne1;
		}
		ArrayList<ListVO> selectOne2 = service.selectOne2(searchItem,searchKeyword);
		model.addAttribute("searchItem",searchItem);
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("리스트 출력222"+selectOne2);
		return selectOne2;
		}
	
	@RequestMapping(value = "/updateFestivalGO", method = RequestMethod.GET)
	public String updateFestival(String mainBoardNum,Model model) {
		System.out.println("메인보드넘 들어왔나? "+mainBoardNum);
		ListVO vo = dao.readFestival(mainBoardNum);
		String startEvent1 = vo.getStartEvent();
		System.out.println("수정할 페이지 찾았나? "+vo);
		model.addAttribute("vo", vo);
		model.addAttribute("startEvent1", startEvent1);
		return "list/UpdateFestival";
	}
	
	@RequestMapping(value = "/deleteFestival", method = RequestMethod.GET)
	public String deleteFestival(ListVO vo,RedirectAttributes rttr) {
		System.out.println("삭제할 vo "+vo);
		boolean result = service.deleteFestival(vo);
		System.out.println("삭제된VO "+result);
		rttr.addFlashAttribute("deleteResult", result);
		return "redirect:/listForm"; 
	}
	@RequestMapping(value = "/imagePrint", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ArrayList<String> imagePrint(ListVO vo) {
		System.out.println("이미지프린트 받은 보드넘 : "+vo.getMainBoardNum());
		ListVO lvo = dao.imagePrint(vo);
		System.out.println("lvo : " + lvo);
		ArrayList<String> ilist = new ArrayList<>();
		String a[] = lvo.getOriginalFileName().split(",");
		for (int i = 0; i < a.length; i++) {
			ilist.add(a[i]);
			System.out.println("포문안에 아이리스트"+ilist);
		}
		System.out.println("a는? "+ a);
		System.out.println("포문밖의 아이리스트" + ilist);
		
		return ilist; 
	}
	
}
