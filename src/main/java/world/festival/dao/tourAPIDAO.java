package world.festival.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.ListVO;
@Repository
public class tourAPIDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int mainBoardNumSelect() {
		tourAPIMapper mapper = sqlSession.getMapper(tourAPIMapper.class);
		return mapper.mainBoardNumSelect();
	}

	public int tourAPIinsert(ArrayList<ListVO> list) {
		tourAPIMapper mapper = sqlSession.getMapper(tourAPIMapper.class);
		return mapper.tourAPIinsert(list);
	}

	public void set(int mainBoardNum) {
		tourAPIMapper mapper = sqlSession.getMapper(tourAPIMapper.class);
		mapper.set(mainBoardNum);
		
	}

}
