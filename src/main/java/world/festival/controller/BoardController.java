package world.festival.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
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
	
}
