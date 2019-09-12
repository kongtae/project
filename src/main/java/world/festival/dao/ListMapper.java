package world.festival.dao;

import java.util.ArrayList;

import world.festival.VO.ListVO;

public interface ListMapper {

	public int writeFestival(ListVO vo);

	public ArrayList<ListVO> printAll();

	public ListVO listDetail(ListVO vo);

	public ArrayList<ListVO> countryList(String country);
	
}
