package world.festival.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import world.festival.VO.CountryNameVO;
import world.festival.VO.ListVO;
import world.festival.VO.MapVO;
import world.festival.dao.MapDAO;

@Service
public class MapService {

	@Autowired
	private MapDAO dao;
	
	public ArrayList<ListVO> selectMap1(ArrayList<CountryNameVO> cList) {
		ArrayList<ListVO> list = dao.selectMap();
		System.out.println(list.size());
		for (ListVO vo : list) {
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

	public ArrayList<MapVO> countList(ArrayList<ListVO> mList, ArrayList<CountryNameVO> cList) {
		ArrayList<MapVO> list = new ArrayList<MapVO>(); 
		for (CountryNameVO cvo : cList) {
			int count = 0;
			MapVO vo = new MapVO();
			for (ListVO lvo : mList) {
				if(lvo.getCountry().equals(cvo.getCountrycode())) {
					count++;
				}
			}
			vo.setCountry(cvo.getCountrycode());
			vo.setFestivalCount(count);
			list.add(vo);
		}
		return list;
	}

	public ArrayList<ListVO> printCountryList(String country) {
		System.out.println("country1 : "+country);
		ArrayList<ListVO> list = dao.selectMap();
		ArrayList<ListVO> result = new ArrayList<ListVO>();
		ArrayList<CountryNameVO> cList = dao.selectCountry();
		CountryNameVO cvo = new CountryNameVO();
		for (CountryNameVO countryNameVO : cList) {
			if(country.equals(countryNameVO.getCountryJP())) {
				cvo.setCountrycode(countryNameVO.getCountrycode());
				cvo.setCountryEng(countryNameVO.getCountryEng());
				cvo.setCountryJP(countryNameVO.getCountryJP());
				cvo.setCountryKR(countryNameVO.getCountryKR());
			}				
		}
		System.out.println("country11 : "+country);
		for (ListVO vo : list) {
			if(vo.getCountry().equals(cvo.getCountrycode())) {
				vo.setCountry(cvo.getCountryJP());
				result.add(vo);
			}else if(vo.getCountry().equals(cvo.getCountryEng())) {
				vo.setCountry(cvo.getCountryJP());
				result.add(vo);
			}else if(vo.getCountry().equals(cvo.getCountryJP())) {
				vo.setCountry(cvo.getCountryJP());
				result.add(vo);
			}else if(vo.getCountry().equals(cvo.getCountryKR())) {
				vo.setCountry(cvo.getCountryJP());
				result.add(vo);
			}
			System.out.println("result개수 : "+result.size());
		}

		//ArrayList<ListVO> result = dao.countryList(country);
	
	return result;
	}

	public String countryList(String country) {
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
		return country;
	}
}