package world.festival.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.ListVO;
import world.festival.VO.MapVO;
import world.festival.VO.UserVO;
@Repository
public class MapDAO {

	@Autowired
	SqlSession sqlSession;

	public int writeFestival(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.writeFestival(vo);
	}

	public ArrayList<MapVO> selectMap() {
		MapMapper mapper = sqlSession.getMapper(MapMapper.class);
		ArrayList<MapVO> list =mapper.selectMap();
		return list;
	}

}
