package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;

import world.festival.VO.ListVO;

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

	public ArrayList<ListVO> selectOne(HashMap<String, String> map) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.selectOne(map);
	}

	public ArrayList<ListVO> selectOne2(HashMap<String, String> map) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.selectOne2(map);
	}

	public int deleteFestival(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.deleteFestival(vo);
	}

	public ListVO readFestival(int mainBoardNum) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.readFestival(mainBoardNum);
	}
	
	//댓글 출력용
	public ArrayList<ReplyVO> replyList(int boardnum) {
		ReplyMapper mapper= sqlSession.getMapper(ReplyMapper.class);
		return mapper.replyList(boardnum);
	}

	public int updateFestival(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		System.out.println("수정할 다오vo " + vo);
		return mapper.updateFestival(vo);
	}

	public ListVO imagePrint(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.imagePrint(vo);
	}

	public ArrayList<ListVO> selectHashtag(String[] hashtag1) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.selectHashtag(hashtag1);
	}
	

	public ArrayList<ListVO> printCrawling(ListVO vo) {
		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
		return mapper.printCrawling(vo);
	}


}
