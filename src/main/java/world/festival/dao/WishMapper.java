package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.VO.WishVO;

public interface WishMapper {

	public void insertwish(ListVO vo);

	public int deletetwish(ListVO vo);

	public int selectWish(ListVO vo);

	public ArrayList<WishVO> wishList(int parseInt);
	
}
