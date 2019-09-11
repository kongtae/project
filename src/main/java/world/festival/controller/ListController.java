package world.festival.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.ListVO;
import world.festival.dao.ListDAO;


@Controller
public class ListController {
	
	@Autowired
	private ListDAO dao;
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm() {
		
		return "list/List";
	}
	@RequestMapping(value = "/listDetailForm", method = RequestMethod.GET)
	public String listDetailForm() {
		
		return "list/ListDetail";
	}
	@RequestMapping(value = "/insertFestival", method = RequestMethod.GET)
	public String insertFestival() {
		
		return "list/writeFestival";
	}
	@RequestMapping(value = "/writeFestival", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String writeFestival(ListVO vo, HttpSession session, MultipartFile uploadfile) {
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		System.out.println("vo:"+vo);
	//	System.out.println("uploadfile"+uploadfile.getOriginalFilename());
		int result = dao.writeFestival(vo);
		System.out.println("result:"+result);
		if(result!=0){
			return "error";
		}
		return "success";
	}
}
