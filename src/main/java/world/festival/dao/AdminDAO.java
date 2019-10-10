package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import world.festival.VO.AdminBoardVO;
import world.festival.VO.AdminListVO;
import world.festival.VO.AdminVO;
import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.VO.WishVO;
@Repository
public class AdminDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void selectadmin(AdminVO adminvo, HttpSession session) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		AdminVO admin= mapper.selectadmin(adminvo);
		session.setAttribute("adminid", admin.getAdminid());
		System.out.println("어드민 id: "+admin.getAdminid());
	}
	
	public int AdminwriteFestival(AdminListVO vo) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.AdminwriteFestival(vo);
	}

	public AdminListVO selectList() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectList();
	}

	public AdminBoardVO selectBul() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectBul();
	}

	public int AdminBoardWrite(AdminBoardVO adminvo) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.AdminBoardWrite(adminvo);
	}

	public AdminListVO selectupList(int i) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectupList(i);
	}
	//자유게시판
	public AdminBoardVO selectupBoard(int bul_boardnum) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectupBoard(bul_boardnum);
	}
	//어드민 리스트의 전체값 가져오기
	public ArrayList<AdminListVO> selectListAll() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectListAll();
	}

	public ArrayList<AdminBoardVO> selectBulAll() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectBulAll();
	}

	public ArrayList<AdminBoardVO> AdminBoardSelectOne1(HashMap<String, String> map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.AdminBoardSelectOne1(map);
	}

	public ArrayList<AdminBoardVO> AdminBoardSelectOne2(HashMap<String, String> map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.AdminBoardSelectOne2(map);
	}

	public ArrayList<AdminListVO> AdminListSelectOne1(HashMap<String, String> map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.AdminListSelectOne1(map);
	}

	public ArrayList<AdminListVO> AdminListSelectOne2(HashMap<String, String> map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.AdminListSelectOne2(map);
	}

	//어드민 자유게시판 가져오기
	public AdminBoardVO readAdminBoard(AdminBoardVO vo1) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
//		mapper.hitcount(vo1);
//		System.out.println("DAO히트를 위한 "+vo1);
		return mapper.readAdminBoard(vo1);
	}

	public AdminListVO readAdminList(AdminListVO vo) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.readAdminList(vo);
	}

	public ListVO RecoveryRead(ListVO vo) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.RecoveryRead(vo);
	}

//	public AdminListVO selectReList(int mainBoardNum) {
//		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
//		return mapper.selectReList(mainBoardNum);
//	}



	public void AdminDeleteList(ListVO vo1) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		mapper.AdminDeleteList(vo1);
	}

	public BoardVO RecoveryReadBul(BoardVO vo) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.RecoveryReadBul(vo);
	}

	public void AdminwriteBoard(AdminBoardVO adminvo1) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		mapper.AdminwriteBoard(adminvo1);
		
	}

	public void AdminDeleteBul(BoardVO vo1) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		mapper.AdminDeleteBul(vo1);
	}

	public AdminListVO adImagePrint(AdminListVO vo1) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.adImagePrint(vo1);
	}


}
