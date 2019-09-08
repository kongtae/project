package world.festival.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import world.festival.VO.UserVO;
import world.festival.dao.UserDAO;
@Service
public class UserService {
	
	@Autowired
	private UserDAO dao;
	
	public UserVO login(UserVO vo, HttpSession session) {
		UserVO result = dao.login(vo);
		if(result == null) return result;
		session.setAttribute("id", vo.getId());
		System.out.println("123");
		return result;
	}

	public UserVO check(String id) {
		return dao.check(id);
	}

}
