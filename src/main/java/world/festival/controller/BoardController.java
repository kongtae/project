package world.festival.controller;


import java.util.ArrayList;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;

>>>>>>> 19d701f21516b7a3da50f5a1b3ef9cd2226d7ecf
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.dao.BoardDAO;
import world.festival.service.BoardService;
=======
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.ListDAO;
import world.festival.service.ListService;
>>>>>>> 19d701f21516b7a3da50f5a1b3ef9cd2226d7ecf

@Controller
public class BoardController {
	
	@Autowired
<<<<<<< HEAD
	private BoardService service;
	
	@Autowired
	private BoardDAO dao;
=======
	private ListDAO dao;
	
	
	@Autowired
	private ListService service;
>>>>>>> 19d701f21516b7a3da50f5a1b3ef9cd2226d7ecf
	
	
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
	
	@RequestMapping(value = "/BoardDetailGO", method = {RequestMethod.GET, RequestMethod.POST})
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

		return "board/BoardDetail";
	}
	
}
