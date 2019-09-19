package world.festival.controller;


import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.BoardVO;
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
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/insertBoard", method = RequestMethod.GET)
	public String insertBoard() {
		
		return "board/BoardWrite";
	}
	@RequestMapping(value = "/boardPrintAll", method = RequestMethod.GET)
	public @ResponseBody ArrayList<BoardVO> boardPrintAll() {
		ArrayList<BoardVO> list = dao.boardPrintAll();
		return list;
	}
	
	@RequestMapping(value = "/BoardDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String listDetailForm() {
		
		return "board/BoardDetail";
	}
	
/*	@RequestMapping(value = "/BoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
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

		return "board/BoardDetail";*/
	}
	
