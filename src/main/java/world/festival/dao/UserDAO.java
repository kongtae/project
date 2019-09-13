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

	public int idcheck(String userid) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = mapper.idcheck(userid);
		return result;
	}

	public UserVO selectOne(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO result = mapper.selectOne(vo);
		return result;
	}

	public int withdraw(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.withdraw(id);
	}

}
