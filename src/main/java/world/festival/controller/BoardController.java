package world.festival.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import world.festival.VO.BoardVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.BoardDAO;
import world.festival.service.BoardService;


@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private BoardDAO dao;

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
		return "success";
	}
	
	@RequestMapping(value = "/BoardWrite", method = RequestMethod.POST)
	@ResponseBody
	public String BoardWrite(BoardVO vo, HttpSession session, MultipartHttpServletRequest request) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("보드라이트의 vo : "+vo);
		boolean result = service.BoardWrite(vo,request);
		System.out.println("보드 인설트 result:"+result);
		return "success";
	}
	@RequestMapping(value = "/boardPrintAll", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody ArrayList<BoardVO> boardPrintAll() {
		ArrayList<BoardVO> list = dao.boardPrintAll();
		System.out.println("자유게시판 전체출력" + list);
		return list;
	}

	@RequestMapping(value = "/BoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
	public String BoardDetailGO(BoardVO vo1 , ReplyVO vo,Model model,HttpSession hs) {
		String userid=(String)hs.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("bul_boardnum 의  값 : " + vo.getBul_boardnum());
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

	@RequestMapping(value = "/BoardDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String BoardDelete(BoardVO vo, HttpSession hs) {
		String userid=(String)hs.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("삭제할 vo "+vo);
		int result = dao.BoardDelete(vo);
		System.out.println("삭제결과 :  "+result);
		return "board/BoardList";
	}
}



