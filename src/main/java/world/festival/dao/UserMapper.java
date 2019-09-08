package world.festival.dao;

import world.festival.VO.UserVO;

public interface UserMapper {

	public UserVO login(UserVO vo);

	public UserVO check(String id);
	
}
