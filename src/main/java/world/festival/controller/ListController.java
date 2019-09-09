package world.festival.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ListController {
	
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm() {
		
		return "list/List";
	}
	
	@RequestMapping(value = "/listDetailForm", method = RequestMethod.GET)
	public String listDetailForm() {
		
		return "list/ListDetail";
	}
	
}
