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

	public ListVO readFestival(int mainBoardNum);

	public int updateFestival(ListVO vo);

	public ListVO imagePrint(ListVO vo);

	public ArrayList<ListVO> selectHashtag(String[] hashtag1);
	
	public ArrayList<ListVO> printCrawling(ListVO vo);
	//복구 파일로 쓰기!
	public void RewriteFestival(ListVO vo);
	//업데이트
	public void ReupdateFestival(ListVO vo1);

	public ArrayList<ListVO> selectMain();

	public int mainBoardNum();

}
