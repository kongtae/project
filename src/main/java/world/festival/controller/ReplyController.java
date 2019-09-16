package world.festival.controller;


import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.ListDAO;
import world.festival.dao.ListService;
import world.festival.dao.ReplyDAO;
import world.festival.dao.ReplyService;


@Controller
public class ReplyController {
	
	@Autowired
	private ReplyDAO dao;
	
	@Autowired
	private ReplyService service;
	
	
//	return "redirect:/board/boardRead?boardnum="+vo.getBoardnum();
	//댓글 달기
		@RequestMapping(value = "/replywrite", method = RequestMethod.POST)
		public String replywrite(ReplyVO vo,RedirectAttributes rttr, HttpSession session) {
			vo.setUserid((String)session.getAttribute("loginid"));
			System.out.println("로그인 아이디가 아니야?"+(String)session.getAttribute("loginid"));
			System.out.println("아이디 잘 들어갔는지 확인:"+vo);
			boolean result = service.replywrite(vo);
			rttr.addFlashAttribute("replywrite", result);
			return "redirect:/listDetailGO?mainBoardNum="+vo.getMainboardnum(); 
		}
		//댓글 삭제
		@RequestMapping(value = "replyDelete", method = RequestMethod.GET)	
		public String replyDelete(ReplyVO vo, HttpSession session,RedirectAttributes rttr ) {
			vo.setUserid((String)session.getAttribute("loginid"));
			System.out.println(vo+"vo찍기");
			
			boolean resuldelete=service.replyDelete(vo,session);
			rttr.addFlashAttribute("resuldelete", resuldelete);
			return "redirect:/listDetailGO?mainBoardNum="+vo.getMainboardnum(); 
		}
		//댓글 수정
		@RequestMapping(value = "replyUpdate", method = RequestMethod.GET)	
		public String replyUpdate(ReplyVO vo, HttpSession session) {
			vo.setUserid((String)session.getAttribute("loginid"));
			System.out.println("수정 vo찍기"+vo);
			service.replyUpdate(vo,session);
			return "redirect:/listDetailGO?mainBoardNum="+vo.getMainboardnum(); 
		}
		
		
//		ListDetail로 와줘야 함
	//댓글 삭제
//	@RequestMapping(value = "/deleteFestival", method = RequestMethod.GET)
//	public String deleteFestival(ListVO vo,RedirectAttributes rttr) {
//		System.out.println("삭제할 vo "+vo);
//		boolean result = service.deleteFestival(vo);
//		System.out.println("삭제된VO "+result);
//		rttr.addFlashAttribute("deleteResult", result);
//		return "redirect:/listForm"; 
//	}
	
	
	
	
}
