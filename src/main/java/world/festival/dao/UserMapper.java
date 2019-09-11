package world.festival.dao;

import world.festival.VO.UserVO;

public interface UserMapper {

	public int registermember(UserVO vo);
	public int idcheck(String userid);
	public UserVO selectOne(UserVO vo);
	
}
