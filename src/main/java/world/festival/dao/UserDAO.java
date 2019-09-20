package world.festival.dao;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.UserVO;
import world.festival.VO.WishVO;
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

	public UserVO selectOne(UserVO vo,HttpSession session) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO result = mapper.selectOne(vo);
		session.setAttribute("loginid", result.getUserid());
		return result;
	}

	public int withdraw(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.withdraw(id);
	}

	public UserVO select(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.select(id);
	}

	public int updateMember(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = mapper.updateMember(vo);
		System.out.println("result : " + result);
		return result;
	}

	public UserVO selectpot(String loginid) {
		// TODO Auto-generated method stub
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.selectpot(loginid);
	}
	public UserVO memberSelect(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.memberSelect(id);
	}
	
	public int updateReply(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = mapper.updateReply(vo);
		System.out.println("result : " + result);
		return result;
	}

	public ArrayList<WishVO> selectwish(String userid) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.selectwish(userid);
	}

}
