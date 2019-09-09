package world.festival.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.UserVO;
@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int registermember(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = mapper.registermember(vo);
		return result;
	}

}
