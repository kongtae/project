package world.festival.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {
	
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String calendar() {
		
		return "map/map";
	}
	
	
}
