package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.ListVO;

public interface ListMapper {

	public int writeFestival(ListVO vo);

	public ArrayList<ListVO> printAll();

	public ListVO listDetail(ListVO vo);

<<<<<<< HEAD
	public ArrayList<ListVO> selectOne(HashMap<String, String> map);

	public ArrayList<ListVO> selectOne2(HashMap<String, String> map);
	
	public ArrayList<ListVO> countryList(String country);
=======
	public ArrayList<SearchVO> selectOne(SearchVO vo);

	public ArrayList<SearchVO> selectOne2(HashMap<String, String> map);
>>>>>>> 659866ab54ee2ede57dee8b1f0e35c502fd2d4ce
	
}
