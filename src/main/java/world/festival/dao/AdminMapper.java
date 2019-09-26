package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.AdminBoardVO;
import world.festival.VO.AdminListVO;
import world.festival.VO.AdminVO;
import world.festival.VO.ListVO;
import world.festival.VO.WishVO;

public interface AdminMapper {

	//어드민
	public AdminVO selectadmin(AdminVO adminvo);

	public int AdminwriteFestival(AdminListVO adminvo);

	public AdminListVO selectList();

	public AdminBoardVO selectBul();

	public int AdminBoardWrite(AdminBoardVO adminvo);

	public AdminListVO selectupList(int mainboardnum);

	public AdminBoardVO selectupBoard();

	public AdminBoardVO selectupBoard(int bul_boardnum);

	public ArrayList<AdminListVO> selectListAll();

	public ArrayList<AdminBoardVO> selectBulAll();

	public ArrayList<AdminBoardVO> AdminBoardSelectOne1(HashMap<String, String> map);

	public ArrayList<AdminBoardVO> AdminBoardSelectOne2(HashMap<String, String> map);

	public ArrayList<AdminListVO> AdminListSelectOne1(HashMap<String, String> map);

	public ArrayList<AdminListVO> AdminListSelectOne2(HashMap<String, String> map);

	public AdminBoardVO readAdminBoard(AdminBoardVO vo1);

	public AdminListVO readAdminList(AdminListVO vo);
	
}
