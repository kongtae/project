package world.festival.dao;

import java.util.ArrayList;

import world.festival.VO.CountryNameVO;
import world.festival.VO.ListVO;
import world.festival.VO.MapVO;

public interface MapMapper {

	public ArrayList<MapVO> selectMap1();

	public ArrayList<ListVO> countryList(String country);

	public ArrayList<CountryNameVO> selectCountry();

	public ArrayList<ListVO> selectMap();
	
}
