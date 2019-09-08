package world.festival.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.UserVO;
@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	public UserVO login(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.login(vo);
		
	}

	public UserVO check(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.check(id);
	}

}
