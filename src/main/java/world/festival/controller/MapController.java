package world.festival.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.ListVO;
import world.festival.VO.MapVO;
import world.festival.dao.MapDAO;

@Controller
public class MapController {
	
	@Autowired
	private MapDAO dao;
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "map/mapTest3";
	}
	
	@RequestMapping(value = "/selectMap1", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Integer> selectMap1() {
		ArrayList<MapVO> list = dao.selectMap1();
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		for (MapVO vo : list) {
			result.put(vo.getCountry(), vo.getFestivalCount());			
		}
		return result;
	}
	
	@RequestMapping(value = "/countryList", method = RequestMethod.GET)
	public String countryList(String country, Model model) {
		model.addAttribute("country", country);
		 return "map/countryList";
	}
	
	@RequestMapping(value = "/printCountryList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<ListVO> printCountryList(String country) {
		ArrayList<ListVO> list = dao.countryList(country);
		 return list;
	}
	
}
