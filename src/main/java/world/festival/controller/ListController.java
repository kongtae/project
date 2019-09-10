package world.festival.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/writeFestival", method = RequestMethod.GET)
	public String writeFestival() {
		int result = dao.writeFestival();
		return "success";
	}
}
