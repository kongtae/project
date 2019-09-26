package world.festival.dao;

import java.util.ArrayList;

import world.festival.VO.AdminListVO;
import world.festival.VO.AdminVO;
import world.festival.VO.ListVO;
import world.festival.VO.WishVO;

public interface AdminMapper {

	//어드민
	public AdminVO selectadmin(AdminVO adminvo);

	public int AdminwriteFestival(AdminListVO adminvo);

	public AdminListVO selectList();
	
}
