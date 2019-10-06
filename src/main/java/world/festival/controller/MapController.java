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

import world.festival.VO.CountryNameVO;
import world.festival.VO.ListVO;
import world.festival.VO.MapVO;
import world.festival.dao.MapDAO;
import world.festival.service.MapService;

@Controller
public class MapController {
	
	@Autowired
	private MapDAO dao;
	@Autowired
	private MapService service;
	
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "map/mapTest3";
	}
	
	@RequestMapping(value = "/selectMap1", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Integer> selectMap1() {
		ArrayList<CountryNameVO> cList = dao.selectCountry();
		ArrayList<MapVO> mList = service.selectMap1(cList);
		ArrayList<MapVO> list = dao.selectMap1();	//나라랑 개수출력
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		//System.out.println(list);
		//System.out.println(" 개수 : "+list.size());
		//System.out.println("이름 개수 : "+cList.size());
		for (MapVO vo : list) {
//			for (CountryNameVO countryNameVO : cList) {
//				if(vo.getCountry().equals(countryNameVO.getCountrycode())) {
//					vo.setCountry(countryNameVO.getCountrycode());
//				}else if(vo.getCountry().equals(countryNameVO.getCountryEng())) {
//					vo.setCountry(countryNameVO.getCountrycode());
//				}else if(vo.getCountry().equals(countryNameVO.getCountryJP())) {
//					vo.setCountry(countryNameVO.getCountrycode());
//				}else if(vo.getCountry().equals(countryNameVO.getCountryKR())) {
//					vo.setCountry(countryNameVO.getCountrycode());
//				}				
//			}
			//System.out.println("나라이름 : "+vo.getCountry());
			result.put(vo.getCountry(), vo.getFestivalCount());			
		}
		return result;
	}
	
	@RequestMapping(value = "/countryList", method = RequestMethod.GET)
	public String countryList(String country, Model model) {
		System.out.println("country : "+country);
		ArrayList<CountryNameVO> cList = dao.selectCountry();
		for (CountryNameVO countryNameVO : cList) {
			if(country.equals(countryNameVO.getCountrycode())) {
				country = countryNameVO.getCountryJP();
			}else if(country.equals(countryNameVO.getCountryEng())) {
				country = countryNameVO.getCountryJP();
			}else if(country.equals(countryNameVO.getCountryJP())) {
				country = countryNameVO.getCountryJP();
			}else if(country.equals(countryNameVO.getCountryKR())) {
				country = countryNameVO.getCountryJP();
			}				
		}
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
