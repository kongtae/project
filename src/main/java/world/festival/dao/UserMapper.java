package world.festival.dao;

import java.util.ArrayList;

import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.VO.WishVO;

public interface UserMapper {

	public int registermember(UserVO vo);
	public int idcheck(String userid);
	public UserVO selectOne(UserVO vo);
	public int withdraw(String id);
	public UserVO select(String id);
	public int updateMember(UserVO vo);
	public UserVO selectpot(String loginid);
	public UserVO memberSelect(String id);
	public int updateReply(UserVO vo);
	//맴버페이지 위시 리스트 데이터 가져오기
	public ArrayList<WishVO> selectwish(String userid);
	//맴버페이지 리스트 데이터 가져오기
	public ArrayList<ListVO> selectlist(String userid);
	//조인 리스트 가져오기
	public ArrayList<ListVO> selectlistAll(String userid);
	
}
