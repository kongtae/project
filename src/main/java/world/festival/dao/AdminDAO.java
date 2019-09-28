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

	public AdminListVO selectReList(int mainBoardNum) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectReList(mainBoardNum);
	}



	public void AdminDeleteList(ListVO vo1) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		mapper.AdminDeleteList(vo1);
	}
		
	
	
	
//	public int registermember(UserVO vo) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		int result = mapper.registermember(vo);
//		
//		return result;
//	}
//
//	public int idcheck(String userid) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		int result = mapper.idcheck(userid);
//		return result;
//	}
//
//	public UserVO selectOne(UserVO vo,HttpSession session) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		UserVO result = mapper.selectOne(vo);
//		session.setAttribute("loginid", result.getUserid());
//		return result;
//	}
//
//	public int withdraw(String id) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		return mapper.withdraw(id);
//	}
//
//	public UserVO select(String id) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		return mapper.select(id);
//	}
//
//	public int updateMember(UserVO vo) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		int result = mapper.updateMember(vo);
//		System.out.println("result : " + result);
//		return result;
//	}
//
//	public UserVO selectpot(String loginid) {
//		// TODO Auto-generated method stub
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		return mapper.selectpot(loginid);
//	}
//	public UserVO memberSelect(String id) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		return mapper.memberSelect(id);
//	}
//	
//	public int updateReply(UserVO vo) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		int result = mapper.updateReply(vo);
//		System.out.println("result : " + result);
//		return result;
//	}
////위시리스트 가져오기
//	public ArrayList<WishVO> selectwish(String userid) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		return mapper.selectwish(userid);
//	}
//	//Board리스트 가져오기
//	public ArrayList<ListVO> selectlist(String userid) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		return mapper.selectlist(userid);
//	}
////조인 리스트 데이터 가져오기
//	public ArrayList<ListVO> selectlistAll(String userid) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		System.out.println("DAO userid"+userid);
//		return mapper.selectlistAll(userid);
//	}
//




}
