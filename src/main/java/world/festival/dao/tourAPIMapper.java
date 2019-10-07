package world.festival.dao;

import java.util.ArrayList;

import world.festival.VO.ListVO;

public interface tourAPIMapper {

	public int mainBoardNumSelect();
	
	public int tourAPIinsert(ArrayList<ListVO> list);

	public void set(int mainBoardNum);

}
