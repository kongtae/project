package world.festival.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.ListVO;
import world.festival.VO.SearchFestivalVO;
import world.festival.dao.SearchFestivalDAO;


@Controller
public class SearchFestivalController {

	@Autowired
	private SearchFestivalDAO dao;
	
	@RequestMapping(value = "/searchFestival", method = RequestMethod.GET)
	public String searchFestival() {

		return "festival/searchFestival";
	}
	
	@RequestMapping(value = "/CheckSearch", method = RequestMethod.POST)
	@ResponseBody
	public Integer CheckSearch(String key) {
		System.out.println("key : "+key);
		//String key1 = dao.keySearch(key);
		Integer result = dao.CheckSearch(key);
		System.out.println("result : "+result);
		return result;
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ListVO> result() {
		ArrayList<ListVO> list = dao.result();
		return list;
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	@ResponseBody
	public Integer reset() {
		System.out.println("reset");
		Integer result = dao.reset();
		System.out.println("result : "+result);
		return result;
	}
	
	@RequestMapping(value = "/pushImage", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SearchFestivalVO> pushImage() {
		ArrayList<SearchFestivalVO> list = dao.pushImage();
		return list;
	}
}
