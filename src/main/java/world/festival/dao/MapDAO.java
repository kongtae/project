package world.festival.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.CountryNameVO;
import world.festival.VO.ListVO;
import world.festival.VO.MapVO;
@Repository
public class MapDAO {

	@Autowired
	SqlSession sqlSession;

	public int writeFestival(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.writeFestival(vo);
	}
	
	public ArrayList<MapVO> selectMap1() {
		MapMapper mapper = sqlSession.getMapper(MapMapper.class);
		return mapper.selectMap1();
	}
	
	public ArrayList<ListVO> countryList(String country) {
		MapMapper mapper = sqlSession.getMapper(MapMapper.class);
		return mapper.countryList(country);
	}

	public ArrayList<CountryNameVO> selectCountry() {
		MapMapper mapper = sqlSession.getMapper(MapMapper.class);
		return mapper.selectCountry();
	}

	public ArrayList<MapVO> selectMap() {
		MapMapper mapper = sqlSession.getMapper(MapMapper.class);
		return mapper.selectMap();
	}

}
