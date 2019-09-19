package world.festival.dao;

import world.festival.VO.UserVO;

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
	
}
