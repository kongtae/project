package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.ListVO;
import world.festival.VO.SearchVO;

public interface ListMapper {

	public int writeFestival(ListVO vo);

	public ArrayList<ListVO> printAll();

	public ListVO listDetail(ListVO vo);

	public ArrayList<SearchVO> selectOne(SearchVO vo);
	public ArrayList<SearchVO> selectOne2(HashMap<String, String> map);
	public ArrayList<ListVO> countryList(String country);
	
}
