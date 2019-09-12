package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.ListVO;
import world.festival.VO.SearchVO;
@Repository
public class ListDAO {

	@Autowired
	SqlSession sqlSession;

	public int writeFestival(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.writeFestival(vo);
		
	}

	public ArrayList<ListVO> printAll() {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.printAll();
	}

	public ListVO listDetail(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.listDetail(vo);
	}

	public ArrayList<SearchVO> selectOne(SearchVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		/*HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		map.put("endEvent", vo.getEndEvent());
		System.out.println("map¿∫"+map);*/
		return mapper.selectOne(vo);
	}

	public ArrayList<SearchVO> selectOne2(String searchItem, String searchKeyword) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		return mapper.selectOne2(map);
	}


}
