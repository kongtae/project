package world.festival.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.ListVO;
import world.festival.VO.SearchFestivalVO;

@Repository
public class SearchFestivalDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public Integer CheckSearch(String key) {
		SearchFestivalMapper mapper = sqlSession.getMapper(SearchFestivalMapper.class); 
		return mapper.CheckSearch(key);
	}

	public ArrayList<ListVO>  result() {
		SearchFestivalMapper mapper = sqlSession.getMapper(SearchFestivalMapper.class); 
		return mapper.result();
	}

	public Integer reset() {
		SearchFestivalMapper mapper = sqlSession.getMapper(SearchFestivalMapper.class); 
		return mapper.reset();
	}

	public ArrayList<SearchFestivalVO> pushImage() {
		SearchFestivalMapper mapper = sqlSession.getMapper(SearchFestivalMapper.class); 
		return mapper.pushImage();
	}
	
	

}
