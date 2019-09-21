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
import world.festival.VO.WishVO;
import world.festival.dao.ListDAO;
import world.festival.dao.WishDAO;
import world.festival.service.ListService;
import world.festival.service.WishService;
//import world.festival.dao.ReplyService;


@Controller
public class ListController {
	
	@Autowired
	private ListDAO dao;
	
	@Autowired
	private WishDAO wishdao;
	
	@Autowired
	private ListService service;
	
	@Autowired
	private WishService wishsrvice;
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
	public String writeFestival(ListVO vo, HttpSession session, MultipartHttpServletRequest request) {
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
	
	
	@RequestMapping(value = "/listDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
	public String listDetail(ListVO vo,Model model, HttpSession hs,RedirectAttributes rttr) {
		ListVO vo1 = dao.listDetail(vo);
		String userid=(String)hs.getAttribute("loginid");
		vo.setUserid(userid);
		ArrayList<ReplyVO> replylist=service.replyList(Integer.parseInt(vo.getMainBoardNum()));
		System.out.println("댓글 리스트 "+replylist);
		System.out.println(vo1);
		model.addAttribute("vo", vo1);
		
		//댓글 갯수
		model.addAttribute("replycount", replylist.size());
		model.addAttribute("replylist", replylist);
		int wish=wishsrvice.selectWish(vo);
		System.out.println("위시리스트 여부판단"+wish);
		//좋아요 여부판단!
		String like=null;
		if(wishsrvice.selectWish(vo)>0)
		{
			like="like";
		}
		model.addAttribute("like", like);
		//좋아요 갯수 판단
		ArrayList<WishVO> wishlist=wishsrvice.wishList(Integer.parseInt(vo.getMainBoardNum()));
		model.addAttribute("wishlist", wishlist.size());
		return "list/ListDetail";
	}
	
	@RequestMapping(value = "/printAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<ListVO> printAll() {
		ArrayList<ListVO> list = dao.printAll();
		System.out.println("전체리스트 출력"+list);
		return list;
	}
	

	@RequestMapping(value = "/selectOne", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<ListVO> selectOne(String endEvent,Model model,
			@RequestParam(value="searchItem",defaultValue="title")String searchItem,
			@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
		System.out.println("item "+searchItem);
		System.out.println("keyword "+searchKeyword);
		System.out.println("end "+endEvent);
		ArrayList<ListVO> selectOne1 = new ArrayList<ListVO>();
		if(searchItem.equals("startEvent")){
		System.out.println("if문안으로 들어오나?");
		selectOne1 = service.selectOne(endEvent,searchItem,searchKeyword);	
		System.out.println("리스트 출력111"+selectOne1);
		return selectOne1;
		}
		ArrayList<ListVO> selectOne2 = service.selectOne2(searchItem,searchKeyword);
		model.addAttribute("searchItem",searchItem);
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("리스트 출력222"+selectOne2);
		return selectOne2;
		}
	
	@RequestMapping(value = "/printAll22", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<ListVO> printAll22(String endEvent,Model model,
			@RequestParam(value="searchItem",defaultValue="title")String searchItem,
			@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
		System.out.println("printAll22  item "+searchItem);
		System.out.println("printAll22  keyword "+searchKeyword);
		System.out.println("printAll22  end "+endEvent);
		ArrayList<ListVO> list = service.printAll22(endEvent,searchItem,searchKeyword);
		System.out.println("printAll22  전체리스트 출력"+list);
		// 여기 지울예정
		return list;
	}
	
	@RequestMapping(value = "/updateFestivalGO", method = RequestMethod.GET)
	public String updateFestival(String mainBoardNum,Model model) {
		System.out.println("메인보드넘 들어왔나? "+mainBoardNum);
		ListVO vo = dao.readFestival(mainBoardNum);
		System.out.println("수정할 페이지 찾았나? "+vo);
		model.addAttribute("vo", vo);
		return "list/UpdateFestival";
	}
	
	@RequestMapping(value = "/deleteFestival", method = RequestMethod.GET)
	public String deleteFestival(ListVO vo,RedirectAttributes rttr) {
		System.out.println("삭제할 vo "+vo);
		boolean result = service.deleteFestival(vo);
		System.out.println("삭제된VO "+result);
		return "redirect:/listForm"; 
	}
//	좋아요를 하고싶다!!!	
//	 ArrayList<ListVO>
	@RequestMapping(value = "insertwish", method = RequestMethod.GET)
	public @ResponseBody ListVO like(ListVO vo,RedirectAttributes rttr, HttpSession session, Model model) {
		String loginid=(String)session.getAttribute("loginid");
		vo.setUserid(loginid);
		vo.setMainBoardNum(vo.getMainBoardNum());
		wishsrvice.insertwish(vo);
		System.out.println("if가기전"+vo);
		if(vo.getOriginalFileName()==null || vo.getOriginalFileName().equals("null") || vo.getOriginalFileName().equals(""))
		{
			System.out.println("사진이 널일 때");
			vo.setOriginalFileName("like.png");
			model.addAttribute("like", vo.getOriginalFileName());
			System.out.println("if안에서의"+vo);
			return vo;
		}
		model.addAttribute("like", vo.getOriginalFileName());
//		boolean result = service.deleteFestival(vo);
		System.out.println("like눌렀을시 올 vo"+vo);
//		rttr.addFlashAttribute("deleteResult"/*, result*/);
		return vo;
	}
	
	//좋아요 취소
	@RequestMapping(value = "/deletetwish", method = RequestMethod.GET)
	@ResponseBody
	public String updatetwish(ListVO vo,HttpSession session, RedirectAttributes rttr) {
		System.out.println("삭제할 vo "+vo);
		String userid=(String)session.getAttribute("loginid");
		vo.setUserid(userid);
		int result = wishsrvice.deletetwish(vo);
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
	
	@RequestMapping(value = "/selectHashtag", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ListVO> selectHashtag(String hashtag, Model model, ListVO vo) {
		System.out.println(hashtag);
		String[] hashtag1 = hashtag.split(",");
		ArrayList<ListVO> result = dao.selectHashtag(hashtag1);
		System.out.println("result : " + result);
		return result;
	}
}
