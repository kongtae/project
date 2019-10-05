package world.festival.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import world.festival.VO.CountryNameVO;
import world.festival.VO.MapVO;
import world.festival.dao.MapDAO;

@Service
public class MapService {

	@Autowired
	private MapDAO dao;
	
	public ArrayList<MapVO> selectMap1(ArrayList<CountryNameVO> cList) {
		ArrayList<MapVO> list = dao.selectMap();
		System.out.println(list.size());
		for (MapVO vo : list) {
			for (CountryNameVO countryNameVO : cList) {
				if(vo.getCountry().equals(countryNameVO.getCountrycode())) {
					vo.setCountry(countryNameVO.getCountrycode());
				}else if(vo.getCountry().equals(countryNameVO.getCountryEng())) {
					vo.setCountry(countryNameVO.getCountrycode());
				}else if(vo.getCountry().equals(countryNameVO.getCountryJP())) {
					vo.setCountry(countryNameVO.getCountrycode());
				}else if(vo.getCountry().equals(countryNameVO.getCountryKR())) {
					vo.setCountry(countryNameVO.getCountrycode());
				}				
			}
			System.out.println("나라이름 : "+vo.getCountry());
		}
		return list;
	}

	
	
}
