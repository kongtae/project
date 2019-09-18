package world.festival.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.ListVO;
@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<ListVO> selectCalendar() {
		CalendarMapper mapper = sqlSession.getMapper(CalendarMapper.class);
		return mapper.selectCalendar();
	}

}
