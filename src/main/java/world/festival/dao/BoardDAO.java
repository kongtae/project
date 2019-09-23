package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;

import world.festival.VO.ListVO;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;

	public ArrayList<BoardVO> boardPrintAll() {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.boardPrintAll();
	}

	public int BoardWrite(BoardVO vo) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.BoardWrite(vo);
	}

	public BoardVO readBoard(BoardVO vo1) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.hitcount(vo1);
		System.out.println("DAO히트를 위한 "+vo1);
		return mapper.readBoard(vo1);
	}

	public int BoardDelete(BoardVO vo) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.BoardDelete(vo);
	}

	public ArrayList<ReplyVO> replyList(ReplyVO vo) {
		BoardMapper mapper= sqlSession.getMapper(BoardMapper.class);
		return mapper.replyList(vo);
	}

	public int boardUpdate(BoardVO vo) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.boardUpdate(vo);
	}

	public ArrayList<BoardVO> BoardSelectOne1(HashMap<String, String> map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.BoardSelectOne1(map);
	}

	public ArrayList<BoardVO> BoardSelectOne2(HashMap<String, String> map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.BoardSelectOne2(map);
	}

	public BoardVO imagePrintBoard(BoardVO vo) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.imagePrintBoard(vo);
	}




}
