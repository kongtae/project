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
public class WishDAO {

	@Autowired
	SqlSession sqlSession;

	//댓글달기
	public int replywrite(ReplyVO vo) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		return mapper.replywrite(vo);
	}

	public void insertwish(ListVO vo) {
		// TODO Auto-generated method stub
		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		mapper.insertwish(vo);
	}

}
