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

import world.festival.VO.AdminBoardVO;
import world.festival.VO.AdminListVO;
import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.BoardDAO;
import world.festival.service.AdminService;
import world.festival.service.BoardService;


@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private AdminService adminservice;
	

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList() {

		return "board/BoardList";
	}

	@RequestMapping(value = "/insertBoard", method = RequestMethod.GET)
	public String insertBoard() {

		return "board/BoardWrite";
	}
	
	@RequestMapping(value = "/boardUpdateGO", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardUpdate(BoardVO vo1,Model model) {
		System.out.println("boardUpdateGO �뾽�뜲�씠�듃�븷 蹂대뱶 遺��씠�삤"+vo1);
		BoardVO vo2 = dao.readBoard(vo1);
		System.out.println("boardUpdateGO �떎 李얠� 釉뚯씠�삤" + vo2);
		model.addAttribute("vo", vo2);
		return "board/BoardUpdate";
	}
	
	@RequestMapping(value = "/boardUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String boardUpdate(BoardVO vo, HttpSession session, MultipartHttpServletRequest request) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("boardUpdate 吏꾩쭨 �떎�뻾 �븷 嫄곕떎! �뾽�뜲�씠�듃�븷 蹂대뱶 遺��씠�삤"+vo);
		boolean result = service.boardUpdate(vo,request);
		System.out.println("boardUpdate 吏꾩쭨 �떎�뻾�뻽�떎! 洹� 寃곌낵 媛믪�??" + result);
		
		AdminBoardVO adminlist= adminservice.selectupBoard(vo.getBul_boardnum());
		adminlist.setDatacheck("bulupdate");
		System.out.println("�뼱�뱶誘� �옒 李얠븘�솕�뒗吏� �솗�씤"+adminlist);
		adminservice.AdminBoardWrite(adminlist, request);
		
		return "success";
	}
	//admin�룄 媛숈씠 �벑濡� �릺寃� 異붽�
	@RequestMapping(value = "/BoardWrite", method = RequestMethod.POST)
	@ResponseBody
	public String BoardWrite(BoardVO vo, HttpSession session, MultipartHttpServletRequest request) {
		String userid = (String)session.getAttribute("loginid");
		if(userid != null){
			vo.setUserid(userid);
		}else{
			String adminid = (String)session.getAttribute("adminid");
			vo.setUserid(adminid);
		}
		System.out.println("蹂대뱶�씪�씠�듃�쓽 vo : "+vo);
		
		boolean result = service.BoardWrite(vo,request);
		System.out.println("蹂대뱶 �씤�꽕�듃 result:"+result);
		
		
		//�옄�쑀寃뚯떆�뙋�쓣 李얠븘���꽌 admin�뿉 異붽�
		AdminBoardVO adminvo = adminservice.selectBul();
		System.out.println("잘 찾아 오는거인가요?"+adminvo);
		adminvo.setDatacheck("bulinsert");
		adminservice.AdminBoardWrite(adminvo, request);
		return "success";
	}
	@RequestMapping(value = "/boardPrintAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<BoardVO> boardPrintAll() {
		ArrayList<BoardVO> list = dao.boardPrintAll();
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getUserid().equals("aa"))
			{
				list.get(i).setUserid("管理者");
			}
		}
		System.out.println("�옄�쑀寃뚯떆�뙋 �쟾泥댁텧�젰" + list);
		return list;
	}
	
	@RequestMapping(value = "/BoardSelectOne", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<BoardVO> selectOne(Model model,
			@RequestParam(value="searchItem",defaultValue="title")String searchItem,
			@RequestParam(value="searchKeyword",defaultValue="")String searchKeyword) {
		System.out.println("item "+searchItem);
		System.out.println("keyword "+searchKeyword);
		ArrayList<BoardVO> BoardSelectOne1 = new ArrayList<BoardVO>();
		if(searchItem.equals("inputdate")){
		System.out.println("if臾몄븞�쑝濡� �뱾�뼱�삤�굹?");
		BoardSelectOne1 = service.BoardSelectOne1(searchItem,searchKeyword);	
		System.out.println("BoardSelectOne由ъ뒪�듃 異쒕젰111"+BoardSelectOne1);
		return BoardSelectOne1;
		}
		ArrayList<BoardVO> BoardSelectOne2 = service.BoardSelectOne2(searchItem,searchKeyword);
		model.addAttribute("searchItem",searchItem);
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("BoardSelectOne由ъ뒪�듃 異쒕젰222"+BoardSelectOne2);
		return BoardSelectOne2;
		}
	

	@RequestMapping(value = "/BoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
	public String BoardDetailGO(BoardVO vo1 , ReplyVO vo,Model model,HttpSession hs) {
		String userid=(String)hs.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("bul_boardnum �쓽  媛�111 : " + vo1.getBul_boardnum());
		System.out.println("bul �쁽�옱 �엳�듃 �닔 " +  vo1.getHit());
		BoardVO vo2 = dao.readBoard(vo1);
		model.addAttribute("vo", vo2);
		System.out.println("蹂대뱶�뵒�뀒�씪�떒�쓽 BoardVO �쓽 媛� :" + vo2);
		ArrayList<ReplyVO> replylist=service.replyList(vo);
		System.out.println("�뙎湲� 由ъ뒪�듃 "+replylist);
		//�뙎湲� 媛��닔
		model.addAttribute("replycount", replylist.size());
		model.addAttribute("replylist", replylist);
		return "board/BoardDetail";
	}

	@RequestMapping(value = "/BoardDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public String BoardDelete(BoardVO vo, HttpSession hs) {
		String userid=(String)hs.getAttribute("loginid");
		vo.setUserid(userid);
		AdminBoardVO adminlist = adminservice.selectupBoard(vo.getBul_boardnum());
		adminlist.setDatacheck("buldelete");
		adminservice.AdminBoardWrite(adminlist);
		
		
		System.out.println("�궘�젣�븷 vo "+vo);
		int result = dao.BoardDelete(vo);
		System.out.println("�궘�젣寃곌낵 :  "+result);
		return "board/BoardList";
	}
	
	@RequestMapping(value = "/imagePrintBoard", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ArrayList<String> imagePrintBoard(BoardVO vo) {
		System.out.println("�씠誘몄��봽由고듃 諛쏆� 遺덈낫�뱶�꽆 : "+vo.getBul_boardnum());
		BoardVO lvo = dao.imagePrintBoard(vo);
		System.out.println("lvo : " + lvo);
		ArrayList<String> ilist = new ArrayList<>();
		String a[] = lvo.getOriginalFileName().split(",");
		for (int i = 0; i < a.length; i++) {
			ilist.add(a[i]);
			System.out.println("Board�룷臾몄븞�뿉 �븘�씠由ъ뒪�듃"+ilist);
			
		}
		System.out.println("a�뒗? "+ a);
		System.out.println("Board�룷臾몃컰�쓽 �븘�씠由ъ뒪�듃" + ilist);
		System.out.println("�븘�씠由ъ뒪�듃 [0] :" + ilist.get(0));

		return ilist; 
	}
	
}



