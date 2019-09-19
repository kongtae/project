package world.festival.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.ListDAO;
import world.festival.service.ListService;

@Controller
public class BoardController {
	
	@Autowired
	private ListDAO dao;
	
	
	@Autowired
	private ListService service;
	
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList() {
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/insertBoard", method = RequestMethod.GET)
	public String insertBoard() {
		
		return "board/BoardWrite";
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
