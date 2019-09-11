package world.festival.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/selectMap", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MapVO> selectMap() {
		ArrayList<MapVO> list = dao.selectMap();
		System.out.println(list);
		return list;
	}
	
}
