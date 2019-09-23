package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;


import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.VO.WishVO;
@Repository
public class WishDAO {

	@Autowired
	SqlSession sqlSession;

	//좋아요 누르면 추가
	public void insertwish(ListVO vo) {
		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		mapper.insertwish(vo);
	}
	
	//좋아요 누르면 취소
	public int deletetwish(ListVO vo) {
		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		return mapper.deletetwish(vo);
	}
	//좋아요 확인여부
	public int selectWish(ListVO vo) {
		// TODO Auto-generated method stub
		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		return mapper.selectWish(vo);
	}

	public ArrayList<WishVO> wishList(int parseInt) {
		// TODO Auto-generated method stub
		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		return mapper.wishList(parseInt);
	}


}
