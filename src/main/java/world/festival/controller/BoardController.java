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
		System.out.println("boardUpdateGO 업데이트할 보드 부이오"+vo1);
		BoardVO vo2 = dao.readBoard(vo1);
		System.out.println("boardUpdateGO 다 찾은 브이오" + vo2);
		model.addAttribute("vo", vo2);
		return "board/BoardUpdate";
	}
	
	@RequestMapping(value = "/boardUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String boardUpdate(BoardVO vo, HttpSession session, MultipartHttpServletRequest request) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("boardUpdate 진짜 실행 할 거다! 업데이트할 보드 부이오"+vo);
		boolean result = service.boardUpdate(vo,request);
		System.out.println("boardUpdate 진짜 실행했다! 그 결과 값은??" + result);
		
		AdminBoardVO adminlist= adminservice.selectupBoard(vo.getBul_boardnum());
		adminlist.setDatacheck("bulupdate");
		System.out.println("어드민 잘 찾아왔는지 확인"+adminlist);
		adminservice.AdminBoardWrite(adminlist, request);
		
		return "success";
	}
	//admin도 같이 등록 되게 추가
	@RequestMapping(value = "/BoardWrite", method = RequestMethod.POST)
	@ResponseBody
	public String BoardWrite(BoardVO vo, HttpSession session, MultipartHttpServletRequest request) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("보드라이트의 vo : "+vo);
		boolean result = service.BoardWrite(vo,request);
		System.out.println("보드 인설트 result:"+result);
		
		
		//자유게시판을 찾아와서 admin에 추가
		AdminBoardVO adminvo = adminservice.selectBul();
		System.out.println("잘 찾아 왔는지 확인"+adminvo);
		adminvo.setDatacheck("bulinsert");
		adminservice.AdminBoardWrite(adminvo, request);
		return "success";
	}
	@RequestMapping(value = "/boardPrintAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<BoardVO> boardPrintAll() {
		ArrayList<BoardVO> list = dao.boardPrintAll();
		System.out.println("자유게시판 전체출력" + list);
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
		System.out.println("if문안으로 들어오나?");
		BoardSelectOne1 = service.BoardSelectOne1(searchItem,searchKeyword);	
		System.out.println("BoardSelectOne리스트 출력111"+BoardSelectOne1);
		return BoardSelectOne1;
		}
		ArrayList<BoardVO> BoardSelectOne2 = service.BoardSelectOne2(searchItem,searchKeyword);
		model.addAttribute("searchItem",searchItem);
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("BoardSelectOne리스트 출력222"+BoardSelectOne2);
		return BoardSelectOne2;
		}
	

	@RequestMapping(value = "/BoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
	public String BoardDetailGO(BoardVO vo1 , ReplyVO vo,Model model,HttpSession hs) {
		String userid=(String)hs.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("bul_boardnum 의  값111 : " + vo1.getBul_boardnum());
		System.out.println("bul 현재 히트 수 " +  vo1.getHit());
		BoardVO vo2 = dao.readBoard(vo1);
		model.addAttribute("vo", vo2);
		System.out.println("보드디테일단의 BoardVO 의 값 :" + vo2);
		ArrayList<ReplyVO> replylist=service.replyList(vo);
		System.out.println("댓글 리스트 "+replylist);
		//댓글 갯수
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
		
		
		System.out.println("삭제할 vo "+vo);
		int result = dao.BoardDelete(vo);
		System.out.println("삭제결과 :  "+result);
		return "board/BoardList";
	}
	
	@RequestMapping(value = "/imagePrintBoard", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ArrayList<String> imagePrintBoard(BoardVO vo) {
		System.out.println("이미지프린트 받은 불보드넘 : "+vo.getBul_boardnum());
		BoardVO lvo = dao.imagePrintBoard(vo);
		System.out.println("lvo : " + lvo);
		ArrayList<String> ilist = new ArrayList<>();
		String a[] = lvo.getOriginalFileName().split(",");
		for (int i = 0; i < a.length; i++) {
			ilist.add(a[i]);
			System.out.println("Board포문안에 아이리스트"+ilist);
			
		}
		System.out.println("a는? "+ a);
		System.out.println("Board포문밖의 아이리스트" + ilist);
		System.out.println("아이리스트 [0] :" + ilist.get(0));

		return ilist; 
	}
	
}



