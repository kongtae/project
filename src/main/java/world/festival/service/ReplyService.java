package world.festival.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.ReplyDAO;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	
	//댓글 달기
	public boolean replywrite(ReplyVO vo) {
		int result = dao.replywrite(vo);
		if(result!=1){return false;}
		return true;
	}

	//댓글 삭제
	public boolean replyDelete(ReplyVO vo, HttpSession session) {
		String userid=(String)session.getAttribute("loginid");
		vo.setUserid(userid);
		return dao.replyDelete(vo);
	}

	public void replyUpdate(ReplyVO vo, HttpSession session) {
		String userid=(String)session.getAttribute("loginid");
		vo.setUserid(userid);
		dao.replyUpdate(vo);
	}

	
	//댓글 삭제?
//	public boolean deleteFestival(ListVO vo) {
//		int result = dao.deleteFestival(vo);
//		if(result!=1){return false;}
//		return true;
//	}

}
