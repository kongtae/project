package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;


import world.festival.VO.ListVO;

public interface ListMapper {

	public int writeFestival(ListVO vo);

	public ArrayList<ListVO> printAll();

	public ListVO listDetail(ListVO vo);

	public ArrayList<ListVO> selectOne(HashMap<String, String> map);

	public ArrayList<ListVO> selectOne2(HashMap<String, String> map);

	public int deleteFestival(ListVO vo);

	public ListVO readFestival(String mainBoardNum);
	
}
