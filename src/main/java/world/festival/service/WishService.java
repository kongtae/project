package world.festival.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.dao.UserDAO;
import world.festival.dao.WishDAO;

@Service
public class WishService {

	@Autowired
	private WishDAO dao;

	public void insertwish(ListVO vo) {
		dao.insertwish(vo);
	}

	
//	public UserVO selectpot(String loginid) {
//		UserVO pot= dao.selectpot(loginid);
//		return pot;
//	}




}
