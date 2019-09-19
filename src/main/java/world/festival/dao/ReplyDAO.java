package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;


import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
@Repository
public class ReplyDAO {

	@Autowired
	SqlSession sqlSession;

	//댓글달기
	public int replywrite(ReplyVO vo) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		return mapper.replywrite(vo);
	}
	//댓글 삭제
	public boolean replyDelete(ReplyVO vo) {
		ReplyMapper mapper= sqlSession.getMapper(ReplyMapper.class);
		return mapper.replyDelete(vo);
	}
	//댓글 수정
	public void replyUpdate(ReplyVO vo) {
		ReplyMapper mapper= sqlSession.getMapper(ReplyMapper.class);
		mapper.replyUpdate(vo);
	}

	
	
	//	댓글 보여주기
	//	public ArrayList<ListVO> printAll() {
	//		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
	//		return mapper.printAll();
	//	}


	// 	댓글 삭제
	//	public int deleteFestival(ListVO vo) {
	//		ListMapper mapper = sqlSession.getMapper(ListMapper.class);
	//		return mapper.deleteFestival(vo);
	//	}





}
